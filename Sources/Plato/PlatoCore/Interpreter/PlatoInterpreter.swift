//
//  PlatoMainVisitor.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 24/01/24.
//
// Return rule: ALWAYS return a value! Only return nil when an error occurs or
// when visiting a context that also returns nil (because an error occurred at that context).

import Antlr4
import Foundation

class PlatoInterpreter: PlatoBaseVisitor<ReturnResult> {
    var configuration: PlatoConfiguration
    var nativeFunctionHandler: NativeFunctionHandling = DefaultNativeFunctionHandler()
    var standardOutput = PlatoStandardOutput()
    
    private(set) var isExecuting = false {
        didSet {
            guard !isExecuting else { return }
            executionHandler?()
        }
    }
    private(set) var isHalting = false
    
    var returnValue: Value = .void
    var canUseReturn = false
    
    let memory = PlatoMemory()
    
    private var canUseBreakOrContinue = false
    private var executionHandler: (() -> Void)?
    
    init(configuration: PlatoConfiguration) {
        self.configuration = configuration
    }
    
    // MARK: Visitors
    
    override func visitProgram(_ ctx: PlatoParser.ProgramContext) -> ReturnResult? {
        guard let statements = ctx.statements() else { return nil }
        isExecuting = true
        let result = visit(statements)
        isExecuting = false
        return result
    }
    
    // MARK: Statements
    
    override func visitStatements(_ ctx: PlatoParser.StatementsContext) -> ReturnResult? {
        var result: ReturnResult?
        statementLoop: for statement in ctx.statement() {
            result = visit(statement)
            // Stop mechanism when an error or command occurs
            switch result {
            case .command, .error:
                break statementLoop
            default:
                continue
            }
        }
        return result
    }
    
    override func visitExpressionStatement(_ ctx: PlatoParser.ExpressionStatementContext) -> ReturnResult? {
        guard let expression = ctx.expression() else {
            return .unexpectedError("Expression returned nil", at: ctx)
        }
        
        let result = visit(expression)
        
        switch result {
        case .value(let value):
            let line = ctx.getStart()?.getLine() ?? 0
            standardOutput.print(PrintValue(
                line: line,
                rawParameters: [CallParameter(value: value)],
                formattedValue: value.asString,
                terminator: "\n",
                isFunction: false
            ))
            return .value(.void)
        default:
            return result
        }
    }
    
    override func visitBreakStatement(_ ctx: PlatoParser.BreakStatementContext) -> ReturnResult? {
        guard canUseBreakOrContinue else {
            return .error("The 'break' keyword is only allowed inside a loop", at: ctx)
        }
        return .command(.break)
    }
    
    override func visitContinueStatement(_ ctx: PlatoParser.ContinueStatementContext) -> ReturnResult? {
        guard canUseBreakOrContinue else {
            return .error("The 'continue' keyword is only allowed inside a loop", at: ctx)
        }
        return .command(.continue)
    }
    
    override func visitReturnStatement(_ ctx: PlatoParser.ReturnStatementContext) -> ReturnResult? {
        guard canUseReturn else {
            return .error("The 'return' keyword is only allowed inside a function", at: ctx)
        }
        guard let expression = ctx.expression(), let result = visit(expression) else {
            returnValue = .void
            return .command(.return)
        }
        
        guard case .value(let value) = result else { return result }
        
        returnValue = value
        return .command(.return)
    }
    
    override func visitVariableAssignmentStatement(_ ctx: PlatoParser.VariableAssignmentStatementContext) -> ReturnResult? {
        let result = visit(ctx.expression()!)
        guard case .value(let value) = result else { return result }
        
        let id = ctx.ID()!.getText()
        
        // Check if already exists
        if let variable = memory.variables.peek().retrieve(forKey: id) {
            guard variable.canAssign(value: value) else {
                return .error("Cannot assign value of type '\(value.type)' to type '\(variable.type)'", at: ctx)
            }
            variable.assign(value)
            return .value(.void)
        }
        
        guard !ReservedKeywordValidator(keyword: id).isReserved() else {
            return .error("Keyword '\(id)' cannot be used as an identifier", at: ctx)
        }
        
        // Create new variable with type any
        memory.variables.peek().createVariable(type: .any, value: value, forKey: id)
        return .value(.void)
    }
    
    override func visitVariableTypeAssignmentStatement(_ ctx: PlatoParser.VariableTypeAssignmentStatementContext) -> ReturnResult? {
        let result = visit(ctx.expression()!)
        guard case .value(let value) = result else { return result }
        
        let id = ctx.ID()!.getText()
        
        guard !ReservedKeywordValidator(keyword: id).isReserved() else {
            return .error("Keyword '\(id)' cannot be used as an identifier", at: ctx)
        }
        
        guard let type = getParameterType(ctx.idTypeStatement()) else {
            return .error("The type '\(ctx.idTypeStatement()!.ID()!.getText())' does not exit", at: ctx)
        }
        
        guard type.isCompatible(with: value.type) else {
            return .error("Cannot assign value of type '\(value.type)' to type '\(type)'", at: ctx)
        }
        
        memory.variables.peek().createVariable(type: type, value: value, forKey: id)
        return .value(value)
    }
    
    override func visitOperationAssignmentStatement(_ ctx: PlatoParser.OperationAssignmentStatementContext) -> ReturnResult? {
        let result = visit(ctx.expression()!)
        guard case .value(let value) = result else { return result }
        
        let id = ctx.ID()!.getText()
        
        guard let variable = memory.variables.peek().retrieve(forKey: id) else {
            return .error("Assignment of type '\(ctx.op.getText()!)' cannot be applied on an empty value", at: ctx)
        }
        
        guard variable.canAssign(value: value) else {
            return .error("Cannot convert value of type '\(value.type)' to specified type '\(variable.type)'", at: ctx)
        }
        
        let left = variable.value
        let operation: BaseOperation!
        let op = PlatoParser.Tokens(rawValue: ctx.op.getType())!
        
        switch op {
        case .MUL_ASSIGN:
            operation = MultiplyOperation(left, value)
        case .DIV_ASSIGN:
            operation = DivideOperation(left, value)
        case .MOD_ASSIGN:
            operation = ModuloOperation(left, value)
        case .ADD_ASSIGN:
            operation = AddOperation(left, value)
        case .SUB_ASSIGN:
            operation = SubtractOperation(left, value)
        default:
            fatalError("No switch statement for \(String(describing: ctx.op.getText()))")
        }
        
        do {
            let result = try operation.result()
            variable.assign(result)
        } catch {
            return .error(error.localizedDescription, at: ctx)
        }
        
        return .value(.void)
    }
    
    override func visitSelectionStatement(_ ctx: PlatoParser.SelectionStatementContext) -> ReturnResult? {
        let result = visit(ctx.expression()!)
        guard case .value(let ifCondition) = result else { return result }
        
        guard ifCondition.type.isNumber else {
            return .error("Cannot convert value of type '\(ifCondition.type)' to expected condition type 'Bool'", at: ctx)
        }
        
        // If the expression returns true, then visit the 'if' statements
        if ifCondition.asBool, let statements = ctx.statements() {
            return memory.withMemoryScope {
                visit(statements)
            }
        }
        
        for elseIfStatement in ctx.elseIfStatement() {
            let result = visit(elseIfStatement)!
            if case .interpreterCommand(let command) = result, command == .next { continue }
            return result
        }
        
        if let elseStatement = ctx.elseStatement() {
            return visit(elseStatement)
        }
        return .value(.void)
    }
    
    override func visitElseIfStatement(_ ctx: PlatoParser.ElseIfStatementContext) -> ReturnResult? {
        let result = visit(ctx.expression()!)
        guard case .value(let elseIfCondition) = result else { return result }
        
        guard elseIfCondition.type.isNumber else {
            return .error("Cannot convert value of type '\(elseIfCondition.type)' to expected condition type 'Bool'", at: ctx)
        }
        
        if elseIfCondition.asBool, let statements = ctx.statements() {
            return memory.withMemoryScope {
                visit(statements)
            }
        }
        
        // The condition was false so we continue to the next 'else if' statement, if there is any.
        return .interpreterCommand(.next)
    }
    
    override func visitElseStatement(_ ctx: PlatoParser.ElseStatementContext) -> ReturnResult? {
        guard let statements = ctx.statements() else { return .value(.void) }
        return visit(statements)
    }
    
    // MARK: Loops
    override func visitWhileStatement(_ ctx: PlatoParser.WhileStatementContext) -> ReturnResult? {
        var result = visit(ctx.expression()!)
        guard case .value(var condition) = result else { return result }
        
        guard condition.type.isNumber else {
            return .error("Cannot convert value of type '\(condition.type)' to expected condition type 'Bool'", at: ctx)
        }
        
        defer {
            canUseBreakOrContinue = false
        }
        
        var maxLoopCount = 0
        
        whileLoopStatement: while condition.asBool {
            // Check the max allowed loop count
            if let maxLoop = configuration.loop.value {
                guard maxLoopCount <= maxLoop else {
                    return .error("Max loop count has reached! Can only loop \(maxLoop) times.", at: ctx)
                }
                maxLoopCount += 1
            }
            
            if let statements = ctx.statements() {
                guard !isHalting else { return .value(.void) }
                
                if !canUseBreakOrContinue {
                    canUseBreakOrContinue = true
                }
                
                // Create a new scope for while statement
                result = memory.withMemoryScope {
                    visit(statements)
                }
                
                if case .command(let command) = result {
                    switch command {
                    case .break, .return:
                        break whileLoopStatement
                    case .continue:
                        continue
                    }
                }
            }
            
            // Update the condition value by visiting it again.
            result = visit(ctx.expression()!)
            guard case .value(let updatedCondition) = result else { return result }
            condition = updatedCondition
            guard condition.type.isNumber else {
                return .error("Cannot convert value of type '\(condition.type)' to expected condition type 'Bool'", at: ctx)
            }
        }
        return .value(.void)
    }
    
    override func visitForInStatement(_ ctx: PlatoParser.ForInStatementContext) -> ReturnResult? {
        var result = visit(ctx.expression()!)
        guard case .value(let values) = result else { return result }
        
        guard values.type == .array || values.type == .string else {
            return .error("Cannot convert value of type '\(values.type)' to expected type 'Array'", at: ctx)
        }
        
        let id = ctx.ID()!.getText()
        guard !ReservedKeywordValidator(keyword: id).isReserved() else {
            return .error("Keyword '\(id)' cannot be used as an identifier", at: ctx)
        }
        
        var maxLoopCount = 0
        
        forLoopStatement: for value in values.asArray {
            guard !isHalting else { return .value(.void) }
            
            if !canUseBreakOrContinue {
                canUseBreakOrContinue = true
            }
            
            // New for in scope
            result = memory.withMemoryScope {
                memory.variables.peek().createVariable(type: .any, value: value, forKey: id)
                if let statements = ctx.statements() {
                    return visit(statements)
                }
                return .value(.void)
            }
            
            if case .command(let command) = result {
                switch command {
                case .break, .return:
                    break forLoopStatement
                case .continue:
                    continue
                }
            }
            
            // Check the max loop count allowed
            if let maxLoop = configuration.loop.value {
                guard maxLoopCount <= maxLoop else {
                    return .error("Max loop count has reached! Can only loop \(maxLoop) times.", at: ctx)
                }
                maxLoopCount += 1
            }
        }
        
        canUseBreakOrContinue = false
        return .value(.void)
    }
    
    override func visitForFromToByStatement(_ ctx: PlatoParser.ForFromToByStatementContext) -> ReturnResult? {
        let from = visit(ctx.expression(0)!)
        let to = visit(ctx.expression(1)!)
        let by = visit(ctx.expression(2)!)
        
        guard case .value(let fromValue) = from else {
            return from
        }
        guard case .value(let toValue) = to else {
            return to
        }
        guard case .value(let byValue) = by else {
            return by
        }
        
        guard fromValue.type.isNumber else {
            return .error("Cannot use type '\(fromValue.type)' on parameter 'from'", at: ctx)
        }
        guard toValue.type.isNumber else {
            return .error("Cannot use type '\(toValue.type)' on parameter 'to'", at: ctx)
        }
        guard byValue.type.isNumber else {
            return .error("Cannot use type '\(byValue.type)' on parameter 'by'", at: ctx)
        }
        
        let id = ctx.ID()!.getText()
        guard !ReservedKeywordValidator(keyword: id).isReserved() else {
            return .error("Keyword '\(id)' cannot be used as an identifier", at: ctx)
        }
        
        // No statements to run, then return early?
        if ctx.statements() == nil {
            return .value(.void)
        }
        
        let highestType = highestValueType(fromValue.type, highestValueType(toValue.type, byValue.type))
        switch highestValueType(fromValue.type, highestValueType(toValue.type, byValue.type)) {
        case .bool:
            return runForFromToByLoop(type: .bool, id: id, from: fromValue.asInteger, to: toValue.asInteger, by: byValue.asInteger, at: ctx)
        case .int:
            return runForFromToByLoop(type: .int, id: id, from: fromValue.asInteger, to: toValue.asInteger, by: byValue.asInteger, at: ctx)
        case .float:
            return runForFromToByLoop(type: .float, id: id, from: fromValue.asFloat, to: toValue.asFloat, by: byValue.asFloat, at: ctx)
        case .double:
            return runForFromToByLoop(type: .double, id: id, from: fromValue.asDouble, to: toValue.asDouble, by: byValue.asDouble, at: ctx)
        default:
            fatalError("No switch statement for \(highestType)")
        }
    }
    
    func runForFromToByLoop<T>(type: ValueType, id: String, from: T, to: T, by: T.Stride, at ctx: PlatoParser.ForFromToByStatementContext) -> ReturnResult? where T: Strideable {
        var maxLoopCount = 0
        forLoop: for index in stride(from: from, to: to, by: by) {
            guard !isHalting else { return .value(.void) }
            
            // New FromToBy Scope if there are statements to run.
            if let statements = ctx.statements() {
                if !canUseBreakOrContinue {
                    canUseBreakOrContinue = true
                }
                
                let result = memory.withMemoryScope {
                    memory.variables.peek().createVariable(type: .any, value: Value(type: type, value: index), forKey: id)
                    return visit(statements)
                }
                
                switch result {
                case .command(let command):
                    if command == .break || command == .return {
                        break forLoop
                    }
                    continue
                case .error:
                    return result
                default: // For other cases, we just continue.
                    break
                }
                
                if canUseBreakOrContinue {
                    canUseBreakOrContinue = false
                }
            }
            
            // Check the max loop count allowed
            if let maxLoop = configuration.loop.value {
                guard maxLoopCount <= maxLoop else {
                    return .error("Max loop count has reached! Can only loop \(maxLoop) times.", at: ctx)
                }
                maxLoopCount += 1
            }
        }
        return .value(.void)
    }
    
    override func visitFunctionDeclaration(_ ctx: PlatoParser.FunctionDeclarationContext) -> ReturnResult? {
        let name = ctx.ID()!.getText()
        var parameters: [Parameter] = []
        
        if let arguments = ctx.functionArguments()?.functionArgument() {
            for argument in arguments {
                guard let parameterType = getParameterType(argument.idTypeStatement()) else {
                    return .error("The type '\(argument.idTypeStatement()!.ID()!.getText())' does not exit", at: ctx)
                }
                parameters.append(
                    Parameter(
                        id: argument.ID()!.getText(),
                        isIdExplicit: argument.AT() != nil,
                        type: parameterType
                    )
                )
            }
        }
        
        memory.functions.peek().createFunction(name: name, parameters: parameters, ctx: ctx)
        
        return .value(.void)
    }
    
    // MARK: Expressions
    
    override func visitSubscriptExpression(_ ctx: PlatoParser.SubscriptExpressionContext) -> ReturnResult? {
        guard let result = visit(ctx.expression(0)!) else {
            return .unexpectedError(at: ctx)
        }
        guard case .value(let firstValue) = result else { return result }
        return getSubscriptValue(from: firstValue, ctx: ctx)
    }
    
    override func visitExponentExpression(_ ctx: PlatoParser.ExponentExpressionContext) -> ReturnResult? {
        produceValueResultFromLeftRightExpressions(ctx) { left, right in
            return try ExponentOperation(left, right).result()
        }
    }
    
    override func visitUnaryExpression(_ ctx: PlatoParser.UnaryExpressionContext) -> ReturnResult? {
        produceValueResultFromSingleExpression(ctx) { value in
            guard value.type.isNumber else {
                throw PlatoError.commonError("Unary operator '\(ctx.op.getText()!)' to an operand of type '\(value.type)'", at: ctx)
            }
            
            switch value.type {
            case .bool, .int:
                return Value(int: -value.asInteger)
            case .float:
                return Value(float: -value.asFloat)
            case .double:
                return Value(double: -value.asDouble)
            default:
                fatalError("Unhandled value type: \(value.type)")
            }
        }
    }
    
    override func visitNotExpression(_ ctx: PlatoParser.NotExpressionContext) -> ReturnResult? {
        produceValueResultFromSingleExpression(ctx) { value throws(PlatoError) in
            guard value.type.isNumber else {
                throw PlatoError.commonError("Not operator '!' to an operand of type '\(value.type)'", at: ctx)
            }
            
            return Value(bool: !value.asBool)
        }
    }
    
    override func visitMulExpression(_ ctx: PlatoParser.MulExpressionContext) -> ReturnResult? {
        produceValueResultFromLeftRightExpressions(ctx) { left, right in
            let operation: BaseOperation!
            switch PlatoParser.Tokens(rawValue: ctx.op.getType()) {
            case .MUL:
                operation = MultiplyOperation(left, right)
            case .DIV:
                operation = DivideOperation(left, right)
            case .MOD:
                operation = ModuloOperation(left, right)
            default:
                fatalError("Unhandled operation type: \(String(describing: ctx.op.getText()))")
            }
            return try operation.result()
        }
    }
    
    override func visitAddExpression(_ ctx: PlatoParser.AddExpressionContext) -> ReturnResult? {
        produceValueResultFromLeftRightExpressions(ctx) { left, right in
            if ctx.op.getType() == PlatoParser.Tokens.MINUS {
                return try SubtractOperation(left, right).result()
            }
            
            return try AddOperation(left, right).result()
        }
    }
    
    override func visitCompareExpression(_ ctx: PlatoParser.CompareExpressionContext) -> ReturnResult? {
        produceValueResultFromLeftRightExpressions(ctx) { left, right in
            let operation: BaseOperation!
            switch PlatoParser.Tokens(rawValue: ctx.op.getType()) {
            case .LT:
                operation = LessThanOperation(left, right)
            case .LTE:
                operation = LessThanEqualOperation(left, right)
            case .GT:
                operation = GreaterThanOperation(left, right)
            case .GTE:
                operation = GreaterThanEqualOperation(left, right)
            default:
                fatalError("Unhandled operation type: \(String(describing: ctx.op.getText()))")
            }
            return try operation.result()
        }
    }
    
    override func visitEqualityExpression(_ ctx: PlatoParser.EqualityExpressionContext) -> ReturnResult? {
        produceValueResultFromLeftRightExpressions(ctx) { left, right in
            if ctx.op.getType() == PlatoParser.Tokens.EQUAL {
                return try EqualOperation(left, right).result()
            }
            
            return try DifferentOperation(left, right).result()
        }
    }
    
    override func visitAndExpression(_ ctx: PlatoParser.AndExpressionContext) -> ReturnResult? {
        produceValueResultFromLeftRightExpressions(ctx) { left, right in
            return try AndOperation(left, right).result()
        }
    }
    
    override func visitOrExpression(_ ctx: PlatoParser.OrExpressionContext) -> ReturnResult? {
        produceValueResultFromLeftRightExpressions(ctx) { left, right in
            return try OrOperation(left, right).result()
        }
    }
    
    override func visitFunctionCallExpression(_ ctx: PlatoParser.FunctionCallExpressionContext) -> ReturnResult? {
        guard let functionCall = ctx.functionCall() else { return nil }
        let functionName = functionCall.ID()!.getText()
        var parameterList: [CallParameter] = []
        
        // Reset return value
        defer {
            returnValue = .void
        }
        
//        // Get parameters
//        if let parameters = functionCall.parameterList()?.parameter() {
//            for parameter in parameters {
//                guard let value = visit(parameter.expression()!) else { return nil }
//                guard value.type.isInRange(of: .array) else {
//                    return error("Expected expression in list of expressions", at: ctx)
//                }
//                let id = parameter.ID()?.getText()
//                parameterList.append(CallParameter(id: id, value: value))
//            }
//        }
//        
//        // Handle user defined functions
//        do {
//            if let function = try memory.functions.peek().retrieveFunction(name: functionName, parameters: parameterList) {
//                return try? function.handle(callParameters: parameterList, interpreter: self)
//            }
//        } catch {
//            return .error(error.localizedDescription, at: ctx)
//        }
//        
//        // Handle print function
//        if functionName == PrintFunc.name {
//            return printFunction(parameters: parameterList, ctx: ctx)
//        }
//        
//        if functionName == ReadLineFunc.name {
//            return readLineFunction(parameters: parameterList, ctx: ctx)
//        }
//        
//        // Handle native functions
//        do {
//            return try nativeFunctionHandler.handle(functionName: functionName, parameters: parameterList)
//        } catch {
//            return .error(error.localizedDescription, at: ctx)
//        }
        return .value(.void)
    }
    
    override func visitParenthesesExpression(_ ctx: PlatoParser.ParenthesesExpressionContext) -> ReturnResult? {
        return visit(ctx.expression()!)
    }
    
    // MARK: Elements
    override func visitIdElement(_ ctx: PlatoParser.IdElementContext) -> ReturnResult? {
        let id = ctx.ID()!.getText()
        
        guard let variable = memory.variables.peek().retrieve(forKey: id) else {
            return .error("Cannot find '\(id)' in scope", at: ctx)
        }
        
        return .value(variable.value)
    }
    
    override func visitIntElement(_ ctx: PlatoParser.IntElementContext) -> ReturnResult? {
        return .value(Value(int: Int(ctx.INT()!.getText().replacingOccurrences(of: "_", with: ""))!))
    }
    
    override func visitDoubleElement(_ ctx: PlatoParser.DoubleElementContext) -> ReturnResult? {
        return .value(Value(double: Double(ctx.DOUBLE()!.getText())!))
    }
    
    override func visitTrueElement(_ ctx: PlatoParser.TrueElementContext) -> ReturnResult? {
        return .value(Value(bool: true))
    }
    
    override func visitFalseElement(_ ctx: PlatoParser.FalseElementContext) -> ReturnResult? {
        return .value(Value(bool: false))
    }
    
    override func visitStringElement(_ ctx: PlatoParser.StringElementContext) -> ReturnResult? {
        return .value(Value(string: String(ctx.STRING()!.getText().dropFirst().dropLast())))
    }
    
    override func visitArrayElement(_ ctx: PlatoParser.ArrayElementContext) -> ReturnResult? {
        return visit(ctx.array()!)
    }
    
    override func visitArray(_ ctx: PlatoParser.ArrayContext) -> ReturnResult? {
        let values = ArrayValue()
        guard let expressions = ctx.expressionList()?.expression() else { return .value(Value(array: ArrayValue.empty)) }
        for expression in expressions {
            let result = visit(expression)
            switch result {
            case .value(let value):
                values.append(value)
            case .command(let command):
                return .error("Expected expression in container literal and not \(command.getName()) statement", at: ctx)
            default:
                return result
            }
        }
        return .value(Value(array: values))
    }
}

// MARK: Print Handling
extension PlatoInterpreter {
    func printFunction(parameters: [CallParameter], ctx: PlatoParser.FunctionCallExpressionContext) -> ReturnResult? {
        do {
            var printFunc = PrintFunc(parameters: parameters)
            let formattedValue = try printFunc.getFormattedValue()
            let line = ctx.getStart()?.getLine() ?? 0
            
            standardOutput.print(
                PrintValue(
                    line: line,
                    rawParameters: parameters,
                    formattedValue: formattedValue,
                    terminator: printFunc.terminator,
                    isFunction: true
                )
            )
            return .value(.void)
        } catch {
            return .error(.commonError(error.localizedDescription, at: ctx))
        }
    }
}

// MARK: Read Line Handing
extension PlatoInterpreter {
    private func readLineFunction(parameters: [CallParameter], ctx: PlatoParser.FunctionCallExpressionContext) -> Value? {
        return nil
//        do {
//            switch config.readLine {
//            case .default:
//                return try ReadLineFunc(parameters: parameters).handle()
//            case .continuation:
//                readLineContinuation.wait()
//                switch readLineContinuation.result {
//                case .success(let value):
//                    return value
//                case .failure(let error):
//                    return self.error(String(describing: error), at: ctx)
//                case .none:
//                    fatalError("readLineContinuation result can't be nil")
//                }
//            }
//        } catch {
//            return self.error(error.localizedDescription, at: ctx)
//        }
    }
}

// MARK: Helper Methods
extension PlatoInterpreter {
    
    // This allows us to handle multiple subscripts like: a[1][2][0]
    func getSubscriptValue(from value: Value, ctx: PlatoParser.SubscriptExpressionContext) -> ReturnResult? {
        var currentValue = value
        
        for index in 1..<ctx.expression().count {
            guard currentValue.type == .array else {
                return .error("Cannot use subscript on type '\(currentValue.type)'", at: ctx)
            }
            guard let expression = ctx.expression(index) else {
                return .unexpectedError(at: ctx)
            }
            let indexResult = visit(expression)
            guard case .value(let value) = indexResult else { return indexResult }
            
            guard value.type.isInRange(of: .int) else {
                return .error("Subscript index can only use types of '\(ValueType.int)' and '\(ValueType.bool)'", at: ctx)
            }
            
            let currentArray = currentValue.asArray
            guard value.asInteger >= 0 && value.asInteger < currentArray.count else {
                return .error("Index out of range", at: ctx)
            }
            currentValue = currentArray[value.asInteger]
        }
        
        return .value(currentValue)
    }
    
    func visitLeftExpression(_ ctx: PlatoParser.ExpressionContext) -> ReturnResult? {
        guard let leftExp = ctx.getRuleContext(PlatoParser.ExpressionContext.self, 0) else {
            return .unexpectedError("Failed to get left expression context", at: ctx)
        }
        return visit(leftExp)
    }
    
    func visitRightExpression(_ ctx: PlatoParser.ExpressionContext) -> ReturnResult? {
        guard let rightExp = ctx.getRuleContext(PlatoParser.ExpressionContext.self, 1) else {
            return .unexpectedError("Failed to get right expression context", at: ctx)
        }
        return visit(rightExp)
    }
    
    func produceValueResultFromLeftRightExpressions(_ ctx: PlatoParser.ExpressionContext, produce: (Value, Value) throws -> Value) -> ReturnResult? {
        let left = visitLeftExpression(ctx)
        let right = visitRightExpression(ctx)
        guard case .value(let leftValue) = left else { return left }
        guard case .value(let rightValue) = right else { return right }
        
        do {
            return .value(try produce(leftValue, rightValue))
        } catch let error as PlatoError {
            return .error(error)
        } catch {
            return .error(error.localizedDescription, at: ctx)
        }
    }
    
    func produceValueResultFromSingleExpression(_ ctx: PlatoParser.ExpressionContext, produce: (Value) throws -> Value) -> ReturnResult? {
        guard let expression = ctx.getRuleContext(PlatoParser.ExpressionContext.self, 0) else {
            return .unexpectedError(at: ctx)
        }
        let result = visit(expression)
        guard case .value(let value) = result else { return result }
        
        do {
            return .value(try produce(value))
        } catch let error as PlatoError {
            return .error(error)
        } catch {
            return .error(error.localizedDescription, at: ctx)
        }
    }
    
    func highestValueType(_ left: ValueType, _ right: ValueType) -> ValueType {
        return left.isHigherOrder(than: right) ? left : right
    }
    
    /// Gets the variable type from a 'IdTypeStatement'. Returns nil if the type doesn't exist
    func getParameterType(_ idTypeStatement: PlatoParser.IdTypeStatementContext?) -> VariableType? {
        guard let idTypeStatement else { return .any }
        
        switch idTypeStatement.ID()!.getText() {
        case VariableType.any.getText():
            return .any
        case VariableType.bool.getText():
            return .bool
        case VariableType.int.getText():
            return .int
        case VariableType.float.getText():
            return .float
        case VariableType.double.getText():
            return .double
        case VariableType.number.getText():
            return .number
        case VariableType.string.getText():
            return .string
        case VariableType.array.getText():
            return .array
        default:
            return nil
        }
    }
    
    /// Halts the interpreter from executing and resets.
    func halt(_ completion: (() -> Void)? = nil) {
        isHalting = true
        executionHandler = {
            self.reset()
            completion?()
        }
    }
    
    /// Use this method to reset the interpreter without the need to reconfigure it. (Resets the cache and errors)
    func reset() {
        returnValue = .void
        canUseReturn = false
        canUseBreakOrContinue = false
        isHalting = false
    }
}
