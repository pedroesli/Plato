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

open class PlatoInterpreter: PlatoBaseVisitor<Value> {
    
    public typealias PrintHandler = (_ printValue: PrintValue) -> Void
    
    public var nativeFunctionHandler: NativeFunctionHandling = DefaultNativeFunctionHandler()
    public var error: RuntimeError?
    
    internal let variables = Stack<VariableScope>()
    internal let functions = Stack<FunctionScope>()
    internal var returnValue: Value = .void
    internal var canUseReturn = false
    
    private let globalVariables = VariableScope(parent: nil)
    private let globalFunctions = FunctionScope(parent: nil)
    private var canUseBreakContinue = false
    private var printHandler: PrintHandler = DefaultPrintHandler.handle(printValue:)
    private let typeFunctionHandler = DefaultTypeFunctionHandler()
    
    open override func visitProgram(_ ctx: PlatoParser.ProgramContext) -> Value? {
        guard let statements = ctx.statements() else { return nil }
        variables.push(globalVariables)
        functions.push(globalFunctions)
        
        return visit(statements)
    }
    
    // MARK: Statements
    
    open override func visitStatements(_ ctx: PlatoParser.StatementsContext) -> Value? {
        // Stop mechanism when an error occurs
        var result: Value?
        for statement in ctx.statement() {
            result = visit(statement)
            guard error == nil else { return nil }
            if result?.type == .command {
                break
            }
        }
        return result
    }
    
    open override func visitExpressionStatement(_ ctx: PlatoParser.ExpressionStatementContext) -> Value? {
        guard let expression = ctx.expression(),
              let result = visit(expression),
              result.type.isInRange(of: .array)
        else { return nil }
        
        let line = ctx.getStart()?.getLine() ?? 0
        handleExpressionStatementPrint(line: line, value: result)
        return .void
    }
    
    open override func visitBreakStatement(_ ctx: PlatoParser.BreakStatementContext) -> Value? {
        guard canUseBreakContinue else {
            return error("'break' is only allowed inside a loop", at: ctx)
        }
        return Value(command: .breakCommand)
    }
    
    open override func visitContinueStatement(_ ctx: PlatoParser.ContinueStatementContext) -> Value? {
        guard canUseBreakContinue else {
            return error("'continue' is only allowed inside a loop", at: ctx)
        }
        return Value(command: .continueCommand)
    }
    
    open override func visitReturnStatement(_ ctx: PlatoParser.ReturnStatementContext) -> Value? {
        guard canUseReturn else {
            return error("'return' is only allowed inside a function", at: ctx)
        }
        guard let expression = ctx.expression(), let value = visit(expression) else {
            returnValue = .void
            return Value(command: .returnCommand)
        }
        returnValue = value
        return Value(command: .returnCommand)
    }
    
    open override func visitVariableAssignmentStatement(_ ctx: PlatoParser.VariableAssignmentStatementContext) -> Value? {
        guard let value = visit(ctx.expression()!) else { return nil }
        let id = ctx.ID()!.getText()

        // Check if already exists
        if let variable = variables.peek().retrieve(forKey: id) {
            guard variable.canAssign(value: value) else {
                return error("Cannot assign value of type '\(value.type)' to type '\(variable.type)'", at: ctx)
            }
            variable.assign(value)
        }
        
        // Create new variable with type any
        if let idError = validateId(id, at: ctx) {
            return idError
        }
        
        variables.peek().createVariable(type: .any, value: value, forKey: id)
        return value
    }
    
    open override func visitVariableTypeAssignmentStatement(_ ctx: PlatoParser.VariableTypeAssignmentStatementContext) -> Value? {
        guard let value = visit(ctx.expression()!) else { return nil }
        let id = ctx.ID()!.getText()
        
        if let idError = validateId(id, at: ctx) {
            return idError
        }
        
        let idTypeRawValue = ctx.idTypeStatement()!.type.getType()
        let type: VariableType!
        switch PlatoParser.Tokens(rawValue: idTypeRawValue) {
        case .ANY_TYPE:
            type = .any
        case .BOOL_TYPE:
            type = .boolean
        case .INT_TYPE:
            type = .int
        case .FLOAT_TYPE:
            type = .float
        case .NUMBER_TYPE:
            type = .number
        case .STRING:
            type = .string
        case .ARRAY_TYPE:
            type = .array
        default:
            return unexpectedError("No type for \(String(describing: ctx.idTypeStatement()!.type.getText()))", at: ctx)
        }
        
        guard type.isCompatible(with: value.type) else {
            return error("Cannot assign value of type '\(value.type)' to type '\(type!)'", at: ctx)
        }
        
        variables.peek().createVariable(type: type, value: value, forKey: id)
        return value
    }
    
    open override func visitOperationAssignmentStatement(_ ctx: PlatoParser.OperationAssignmentStatementContext) -> Value? {
        let id = ctx.ID()!.getText()
        
        guard let variable = variables.peek().retrieve(forKey: id) else {
            return error("Assignment of type '\(ctx.op.getText()!)' cannot be applied on an empty value", at: ctx)
        }
        
        guard let right = visit(ctx.expression()!) else { return nil }
        guard variable.canAssign(value: right) else {
            return error("Cannot convert value of type '\(right.type)' to specified type '\(variable.type)'", at: ctx)
        }
        let left = variable.value
        
        let operation: BaseOperation!
        let op = PlatoParser.Tokens(rawValue: ctx.op.getType())!
        
        switch op {
        case .MUL_ASSIGN:
            operation = MultiplyOperation(left, right)
        case .DIV_ASSIGN:
            operation = DivideOperation(left, right)
        case .MOD_ASSIGN:
            operation = ModuloOperation(left, right)
        case .ADD_ASSIGN:
            operation = AddOperation(left, right)
        case .SUB_ASSIGN:
            operation = SubtractOperation(left, right)
        default:
            return unexpectedError(at: ctx)
        }
        
        do {
            guard let result = try operation.result() else { return unexpectedError("Assignment math operation returned nil", at: ctx) }
            variable.assign(result)
            return result
        } catch {
            return self.error(error.localizedDescription, at: ctx)
        }
    }
    
    open override func visitSelectionStatement(_ ctx: PlatoParser.SelectionStatementContext) -> Value? {
        guard let ifCondition = visit(ctx.expression()!) else { return nil }
        
        guard ifCondition.type.isNumber else {
            return error("Cannot convert value of type '\(ifCondition.type)' to expected condition type 'Bool'", at: ctx)
        }
        
        if let ifResult = ifOperation(ifCondition, statements: ctx.statements()) {
            return ifResult
        }
        
        for elseIfStatement in ctx.elseIfStatement() {
            if let elseIfResult = visit(elseIfStatement) {
                return elseIfResult
            }
        }
        
        if let elseStatement = ctx.elseStatement() {
            return visit(elseStatement)
        }
        return Value.void
    }
    
    open override func visitElseIfStatement(_ ctx: PlatoParser.ElseIfStatementContext) -> Value? {
        guard let ifCondition = visit(ctx.expression()!) else { return nil }
        
        guard ifCondition.type.isNumber else {
            return error("Cannot convert value of type '\(ifCondition.type)' to expected condition type 'Bool'", at: ctx)
        }
        
        return ifOperation(ifCondition, statements: ctx.statements())
    }
    
    open override func visitElseStatement(_ ctx: PlatoParser.ElseStatementContext) -> Value? {
        guard let statements = ctx.statements() else { return nil }
        return visit(statements)
    }
    
    open override func visitWhileStatement(_ ctx: PlatoParser.WhileStatementContext) -> Value? {
        guard var condition = visit(ctx.expression()!) else { return nil }
        
        guard condition.type.isNumber else {
            return error("Cannot convert value of type '\(condition.type)' to expected condition type 'Bool'", at: ctx)
        }
        
        defer {
            canUseBreakContinue = false
        }
        
        var result: Value?
        while condition.asBool {
            if let statements = ctx.statements() {
                if !canUseBreakContinue {
                    canUseBreakContinue = true
                }
                newScope()
                result = visit(statements)
                popScope()
                if result?.type == .command {
                    if result?.asCommand == .breakCommand || result?.asCommand == .returnCommand {
                        result = Value.void
                        break
                    }
                    result = Value.void
                    continue
                }
            }
            // update the condition value
            guard let nextCondition = visit(ctx.expression()!) else { return nil }
            condition = nextCondition
            guard condition.type.isNumber else {
                return error("Cannot convert value of type '\(condition.type)' to expected condition type 'Bool'", at: ctx)
            }
        }
        return result
    }
    
    open override func visitForInStatement(_ ctx: PlatoParser.ForInStatementContext) -> Value? {
        guard let values = visit(ctx.expression()!) else { return nil }
        
        guard values.type == .array || values.type == .string else {
            return error("Cannot convert value of type '\(values.type)' to expected type 'Array'", at: ctx)
        }
        
        let id = ctx.ID()!.getText()
        if let idError = validateId(id, at: ctx) {
            return idError
        }
        
        var result: Value?
        for value in values.asArray {
            if !canUseBreakContinue {
                canUseBreakContinue = true
            }
            newScope()
            variables.peek().createVariable(type: .any, value: value, forKey: id)
            if let statements = ctx.statements() {
                result = visit(statements)
            }
            popScope()
            if result?.type == .command {
                if result?.asCommand == .breakCommand {
                    result = Value.void
                    break
                }
                result = Value.void
                continue
            }
        }
        
        canUseBreakContinue = false
        return result
    }
    
    open override func visitForFromToByStatement(_ ctx: PlatoParser.ForFromToByStatementContext) -> Value? {
        guard let from = visit(ctx.expression(0)!),
              let to = visit(ctx.expression(1)!),
              let by = visit(ctx.expression(2)!)
        else { return nil }
        
        guard from.type.isNumber else {
            return error("Cannot use type '\(from.type)' on parameter 'from'", at: ctx)
        }
        guard to.type.isNumber else {
            return error("Cannot use type '\(to.type)' on parameter 'to'", at: ctx)
        }
        guard by.type.isNumber else {
            return error("Cannot use type '\(by.type)' on parameter 'by'", at: ctx)
        }
        
        let id = ctx.ID()!.getText()
        if let idError = validateId(id, at: ctx) {
            return idError
        }
        
        guard let statements = ctx.statements() else {
            return nil
        }
        
        let highestType = highestValueType(from.type, highestValueType(to.type, by.type))
        var result: Value?
        
        switch highestType {
        case .boolean, .int:
            for index in stride(from: from.asInteger, to: to.asInteger, by: by.asInteger) {
                if !canUseBreakContinue {
                    canUseBreakContinue = true
                }
                newScope()
                variables.peek().createVariable(type: .any, value: Value(int: index), forKey: id)
                result = visit(statements)
                popScope()
                if result?.type == .command {
                    if result?.asCommand == .breakCommand {
                        result = Value.void
                        break
                    }
                    result = Value.void
                    continue
                }
            }
        case .float:
            for index in stride(from: from.asFloat, to: to.asFloat, by: by.asFloat) {
                if !canUseBreakContinue {
                    canUseBreakContinue = true
                }
                newScope()
                variables.peek().createVariable(type: .any, value: Value(float: index), forKey: id)
                result = visit(statements)
                popScope()
                if result?.type == .command {
                    if result?.asCommand == .breakCommand {
                        result = Value.void
                        break
                    }
                    result = Value.void
                    continue
                }
            }
        default:
            return unexpectedError("No switch statement for \(highestType)",at: ctx)
        }
        
        canUseBreakContinue = false
        return result
    }
    
    open override func visitFunctionDeclaration(_ ctx: PlatoParser.FunctionDeclarationContext) -> Value? {
        let name = ctx.ID()!.getText()
        var parameters: [Parameter] = []
        
        if let arguments = ctx.functionArguments()?.functionArgument() {
            for argument in arguments {
                parameters.append(
                    Parameter(
                        id: argument.ID()!.getText(),
                        isIdExplicit: argument.AT() != nil,
                        type: functionDeclarationParameterType(argument.idTypeStatement())
                    )
                )
            }
        }
        
        functions.peek().createFunction(name: name, parameters: parameters, ctx: ctx)
        
        return Value.void
    }
    
    // MARK: Expressions
    
    open override func visitSubscriptExpression(_ ctx: PlatoParser.SubscriptExpressionContext) -> Value? {
        guard let firstValue = visit(ctx.expression(0)!) else {
            return unexpectedError(at: ctx)
        }
        return getSubscriptValue(from: firstValue, ctx: ctx)
    }
    
    open override func visitExponentExpression(_ ctx: PlatoParser.ExponentExpressionContext) -> Value? {
        guard let (left, right) = getExpressionValues(ctx) else { return nil }
        
        let operation = ExponentOperation(left, right)
        
        do {
            return try operation.result()
        } catch {
            return self.error(error.localizedDescription, at: ctx)
        }
    }
    
    open override func visitUnaryExpression(_ ctx: PlatoParser.UnaryExpressionContext) -> Value? {
        guard let expression = ctx.expression(),
              let value = visit(expression) else { return nil }
        
        guard value.type.isNumber else {
            return error("Unary operator '\(ctx.op.getText()!)' to an operand of type '\(value.type)'", at: ctx)
        }
        
        if ctx.op.getType() == PlatoParser.Tokens.MINUS {
            guard let result = minusUnaryValue(value) else {
                return unexpectedError(at: ctx)
            }
            return result
        }
        return value
    }
    
    open override func visitNotExpression(_ ctx: PlatoParser.NotExpressionContext) -> Value? {
        guard let expression = ctx.expression(),
              let value = visit(expression) else { return nil }
        
        guard value.type.isNumber else {
            return error("Not operator '!' to an operand of type '\(value.type)'", at: ctx)
        }
        
        return Value(bool: !value.asBool)
    }
    
    open override func visitMulExpression(_ ctx: PlatoParser.MulExpressionContext) -> Value? {
        guard let (left, right) = getExpressionValues(ctx) else { return nil }
        
        let operation: BaseOperation!
        let op = PlatoParser.Tokens(rawValue: ctx.op.getType())!
        
        switch op {
        case PlatoParser.Tokens.MUL:
            operation = MultiplyOperation(left, right)
        case PlatoParser.Tokens.DIV:
            operation = DivideOperation(left, right)
        case PlatoParser.Tokens.MOD:
            operation = ModuloOperation(left, right)
        default:
            return unexpectedError(at: ctx)
        }
        
        do {
            return try operation.result()
        } catch {
            return self.error(error.localizedDescription, at: ctx)
        }
    }
    
    open override func visitAddExpression(_ ctx: PlatoParser.AddExpressionContext) -> Value? {
        guard let (left, right) = getExpressionValues(ctx) else { return nil }
        
        let operation: BaseOperation = if ctx.op.getType() == PlatoParser.Tokens.MINUS {
            SubtractOperation(left, right)
        } else {
            AddOperation(left, right)
        }
        
        do {
            return try operation.result()
        } catch {
            return self.error(error.localizedDescription, at: ctx)
        }
    }
    
    open override func visitCompareExpression(_ ctx: PlatoParser.CompareExpressionContext) -> Value? {
        guard let (left, right) = getExpressionValues(ctx) else { return nil }
        
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
            return unexpectedError(at: ctx)
        }
        
        do {
            return try operation.result()
        } catch {
            return self.error(error.localizedDescription, at: ctx)
        }
    }
    
    open override func visitEqualityExpression(_ ctx: PlatoParser.EqualityExpressionContext) -> Value? {
        guard let (left, right) = getExpressionValues(ctx) else { return nil }
        
        let operation: BaseOperation = if ctx.op.getType() == PlatoParser.Tokens.EQUAL {
            EqualOperation(left, right)
        } else {
            DifferentOperation(left, right)
        }
        
        do {
            return try operation.result()
        } catch {
            return self.error(error.localizedDescription, at: ctx)
        }
    }
    
    open override func visitAndExpression(_ ctx: PlatoParser.AndExpressionContext) -> Value? {
        guard let (left, right) = getExpressionValues(ctx) else { return nil }
        
        let operation = AndOperation(left, right)
        
        do {
            return try operation.result()
        } catch {
            return self.error(error.localizedDescription, at: ctx)
        }
    }
    
    open override func visitOrExpression(_ ctx: PlatoParser.OrExpressionContext) -> Value? {
        guard let (left, right) = getExpressionValues(ctx) else { return nil }
        
        let operation = OrOperation(left, right)
        
        do {
            return try operation.result()
        } catch {
            return self.error(error.localizedDescription, at: ctx)
        }
    }
    
    open override func visitFunctionCallExpression(_ ctx: PlatoParser.FunctionCallExpressionContext) -> Value? {
        guard let functionCall = ctx.functionCall() else { return nil }
        let functionName = functionCall.ID()!.getText()
        var parameterList: [CallParameter] = []
        
        // Reset return value
        defer {
            returnValue = .void
        }
        
        // Get parameters
        if let parameters = functionCall.parameterList()?.parameter() {
            for parameter in parameters {
                guard let value = visit(parameter.expression()!) else { return nil }
                guard value.type.isInRange(of: .array) else {
                    return error("Expected expression in list of expressions", at: ctx)
                }
                let id = parameter.ID()?.getText()
                parameterList.append(CallParameter(id: id, value: value))
            }
        }
        
        do {
            if let function = try functions.peek().retrieveFunction(name: functionName, parameters: parameterList) {
                return try? function.handle(callParameters: parameterList, interpreter: self)
            }
        } catch {
            return self.error(error.localizedDescription, at: ctx)
        }
        
        // Handle print function
        if functionName == PrintFunc.name {
            return printFunction(parameters: parameterList, ctx: ctx)
        }
        
        // Return func result
        do {
            return try nativeFunctionHandler.handle(functionName: functionName, parameters: parameterList)
        } catch {
            return self.error(error.localizedDescription, at: ctx)
        }
    }
    
    open override func visitTypeFunctionCallExpression(_ ctx: PlatoParser.TypeFunctionCallExpressionContext) -> Value? {
        guard let typeFunctionCall = ctx.typeFunctionCall() else { return nil }
        let functionName = typeFunctionCall.type.getText()!
        var parameterList: [CallParameter] = []
        
        // Get parameters
        if let parameters = typeFunctionCall.parameterList()?.parameter() {
            for parameter in parameters {
                guard let value = visit(parameter.expression()!) else { return nil }
                guard value.type.isInRange(of: .array) else {
                    return error("Expected expression in list of expressions", at: ctx)
                }
                let id = parameter.ID()?.getText()
                parameterList.append(CallParameter(id: id, value: value))
            }
        }
        
        // Return func result
        do {
            return try typeFunctionHandler.handle(functionName: functionName, parameters: parameterList)
        } catch {
            return self.error(error.localizedDescription, at: ctx)
        }
    }
    
    open override func visitParenthesesExpression(_ ctx: PlatoParser.ParenthesesExpressionContext) -> Value? {
        return visit(ctx.expression()!)
    }
    
    // MARK: Elements
    open override func visitIdElement(_ ctx: PlatoParser.IdElementContext) -> Value? {
        let id = ctx.ID()!.getText()
        
        guard let variable = variables.peek().retrieve(forKey: id) else {
            return error("Cannot find '\(id)' in scope", at: ctx)
        }
        
        return variable.value
    }
    
    open override func visitIntElement(_ ctx: PlatoParser.IntElementContext) -> Value? {
        return Value(int: Int(ctx.INT()!.getText().replacingOccurrences(of: "_", with: ""))!)
    }
    
    open override func visitFloatElement(_ ctx: PlatoParser.FloatElementContext) -> Value? {
        return Value(float: Float(ctx.FLOAT()!.getText())!)
    }
    
    open override func visitTrueElement(_ ctx: PlatoParser.TrueElementContext) -> Value? {
        return Value(bool: true)
    }
    
    open override func visitFalseElement(_ ctx: PlatoParser.FalseElementContext) -> Value? {
        return Value(bool: false)
    }
    
    open override func visitStringElement(_ ctx: PlatoParser.StringElementContext) -> Value? {
        return Value(string: String(ctx.STRING()!.getText().dropFirst().dropLast()))
    }
    
    open override func visitArrayElement(_ ctx: PlatoParser.ArrayElementContext) -> Value? {
        return visit(ctx.array()!)
    }
    
    open override func visitArray(_ ctx: PlatoParser.ArrayContext) -> Value? {
        let values = ArrayValue()
        guard let expressions = ctx.expressionList()?.expression() else { return Value(array: ArrayValue()) }
        for expression in expressions {
            guard let value = visit(expression) else { return nil }
            guard value.type.isInRange(of: .array) else {
                return error("Expected expression in container literal", at: ctx)
            }
            values.append(value)
        }
        return Value(array: values)
    }
}

// MARK: Error Handling
extension PlatoInterpreter {
    
    public func error(_ message: String, at ctx: ParserRuleContext) -> Value? {
        let line = ctx.getStart()?.getLine() ?? 0
        let column = ctx.getStart()?.getCharPositionInLine() ?? 0
        error = RuntimeError(
            message: message,
            badCode: ctx.getText(),
            line: line,
            column: column
        )
        return nil
    }
    
    public func unexpectedError(_ message: String? = nil, at ctx: ParserRuleContext) -> Value? {
        return error("Unexpected error! \(message ?? "")", at: ctx)
    }
}

// MARK: Print Handling
extension PlatoInterpreter {
    
    public func setPrintHandler(_ handle: @escaping PrintHandler) {
        self.printHandler = handle
    }
    
    /// Use this method to call the print handler closure
    public func handlePrint(_ printValue: PrintValue) {
        self.printHandler(printValue)
    }
    
    public func handleExpressionStatementPrint(line: Int, value: Value) {
        handlePrint(
            PrintValue(
                line: line,
                rawParameters: [CallParameter(value: value)],
                formattedValue: value.asString,
                terminator: "\n",
                isFunction: false
            )
        )
    }
    
    private func printFunction(parameters: [CallParameter], ctx: PlatoParser.FunctionCallExpressionContext) -> Value? {
        do {
            let printFunc = PrintFunc(parameters: parameters)
            let formattedValue = try printFunc.getFormattedValue()
            let line = ctx.getStart()?.getLine() ?? 0
            
            handlePrint(
                PrintValue(
                    line: line,
                    rawParameters: parameters,
                    formattedValue: formattedValue,
                    terminator: printFunc.terminator,
                    isFunction: true
                )
            )
            return .void
        } catch {
            return self.error(error.localizedDescription, at: ctx)
        }
    }
}

// MARK: Helper Methods
extension PlatoInterpreter {
    
    func getSubscriptValue(from value: Value, ctx: PlatoParser.SubscriptExpressionContext) -> Value? {
        var currentValue = value
        for index in 1..<ctx.expression().count{
            guard currentValue.type == .array else {
                return error("Cannot use subscript on type '\(currentValue.type)'", at: ctx)
            }
            guard let expression = ctx.expression(index), let indexValue = visit(expression) else { return nil }
            guard indexValue.type.isInRange(of: .int) else {
                return error("Subscript index can only use types of '\(ValueType.int)' and '\(ValueType.boolean)'", at: ctx)
            }
            
            let currentArray = currentValue.asArray
            guard indexValue.asInteger >= 0 && indexValue.asInteger < currentArray.count else {
                return error("Index out of range", at: ctx)
            }
            currentValue = currentArray[indexValue.asInteger]
        }
        return currentValue
    }
    
    func minusUnaryValue(_ value: Value) -> Value? {
        switch value.type {
        case .boolean, .int:
            return Value(int: -value.asInteger)
        case .float:
            return Value(float: -value.asFloat)
        default:
            return nil
        }
    }
    
    /// Get the left and right expression
    func getExpressionValues(_ ctx: PlatoParser.ExpressionContext) -> (Value, Value)? {
        guard let leftExp = ctx.getRuleContext(PlatoParser.ExpressionContext.self, 0),
              let rightExp = ctx.getRuleContext(PlatoParser.ExpressionContext.self, 1),
              let left = visit(leftExp),
              let right = visit(rightExp) else { return nil }
        return (left, right)
    }
    
    func newScope() {
        variables.push(VariableScope(parent: variables.peek()))
        functions.push(FunctionScope(parent: functions.peek()))
    }
    
    func popScope() {
        variables.pop()
        functions.pop()
    }
    
    func ifOperation(_ condition: Value, statements:  PlatoParser.StatementsContext?) -> Value? {
        if condition.asBool, let statements {
            let value: Value?
            newScope()
            value = visit(statements)
            popScope()
            return value
        }
        return nil
    }
    
    func validateId(_ id: String, at ctx: ParserRuleContext) -> Value? {
        if !IDValidator.isValid(id) {
            return error("Keyword '\(id)' cannot be used as an identifier", at: ctx)
        }
        return nil
    }
    
    func highestValueType(_ left: ValueType, _ right: ValueType) -> ValueType {
        return left.rawValue > right.rawValue ? left : right
    }
    
    func functionDeclarationParameterType(_ idTypeStatement: PlatoParser.IdTypeStatementContext?) -> VariableType {
        guard let idTypeStatement else { return .any }
        
        switch PlatoParser.Tokens(rawValue: idTypeStatement.type.getType()) {
        case .ANY_TYPE:
            return .any
        case .BOOL_TYPE:
            return .boolean
        case .INT_TYPE:
            return .int
        case .FLOAT_TYPE:
            return .float
        case .NUMBER_TYPE:
            return .number
        case .STRING_TYPE:
            return .string
        case .ARRAY_TYPE:
            return .array
        default:
            return .any
        }
    }
}

