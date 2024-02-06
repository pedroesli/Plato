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
    
    public var error: RuntimeError?
    
    private var globalMemory = Scope<String, Value>(parent: nil)
    private var scopes = Stack<Scope<String, Value>>()
    private let functions: [String : PlatoParser.FunctionDeclarationContext] = [:]
    
    open override func visitProgram(_ ctx: PlatoParser.ProgramContext) -> Value? {
        scopes.push(globalMemory)
        guard let statements = ctx.statements() else { return nil }
        return visit(statements)
    }
    
    // MARK: Statements
    
    open override func visitStatements(_ ctx: PlatoParser.StatementsContext) -> Value? {
        // Stop mechanism when an error occurs
        var result: Value?
        for statement in ctx.statement() {
            guard error == nil else { return nil }
            result = visit(statement)
        }
        return result
    }
    
    open override func visitExpressionStatement(_ ctx: PlatoParser.ExpressionStatementContext) -> Value? {
        if let expression = ctx.expression(), let result = visit(expression) {
            print(result)
        }
        return Value.void
    }
    
    open override func visitAssignmentStatement(_ ctx: PlatoParser.AssignmentStatementContext) -> Value? {
        let id = ctx.ID()!.getText()
        if !IDValidator.isValid(id) {
            return error("Keyword '\(id)' cannot be used as an identifier", at: ctx)
        }
        
        guard let value = visit(ctx.expression()!) else { return nil }
        // Normal assign
        if ctx.op.getType() == PlatoParser.Tokens.ASSIGN {
            scopes.peek().updateValue(value, forKey: id)
            return value
        }
        
        // Arithmetic assign
        guard let left = scopes.peek().getValue(forKey: id) else {
            return error("Assignment of type '\(ctx.op.getText()!)' cannot be applied on an empty value", at: ctx)
        }
        
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
            return unexpectedError(at: ctx)
        }
        
        do {
            guard let result = try operation.result() else { return unexpectedError("Assignment math operation returned nil", at: ctx) }
            scopes.peek().updateValue(result, forKey: id)
            return result
        } catch {
            return self.error(error.localizedDescription, at: ctx)
        }
    }
    
    open override func visitSelectionStatement(_ ctx: PlatoParser.SelectionStatementContext) -> Value? {
        guard let ifCondition = visit(ctx.expression()!) else { return nil }
        guard ifCondition.type <= .float else {
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
        guard ifCondition.type <= .float else {
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
        guard condition.type <= .float else {
            return error("Cannot convert value of type '\(condition.type)' to expected condition type 'Bool'", at: ctx)
        }
        
        var finalValue: Value?
        while condition.asBool {
            if let statements = ctx.statements() {
                newScope()
                finalValue = visit(statements)
                popScope()
            }
            // update the condition value
            guard let nextCondition = visit(ctx.expression()!) else { return nil }
            condition = nextCondition
            guard condition.type <= .float else {
                return error("Cannot convert value of type '\(condition.type)' to expected condition type 'Bool'", at: ctx)
            }
        }
        return finalValue
    }
    
    open override func visitForInStatement(_ ctx: PlatoParser.ForInStatementContext) -> Value? {
        guard let values = visit(ctx.expression()!) else { return nil }
        guard values.type == .array || values.type == .string else {
            return error("Cannot convert value of type '\(values.type)' to expected type 'Array'", at: ctx)
        }
        
        let id = ctx.ID()!.getText()
        var finalValue: Value?
        for value in values.asArray {
            newScope()
            scopes.peek().updateValue(value, forKey: id)
            if let statements = ctx.statements() {
                finalValue = visit(statements)
            }
            popScope()
        }
        
        return finalValue
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
        
        guard value.type <= .float else {
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
        
        guard value.type <= .float else {
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
    
    open override func visitParenthesesExpression(_ ctx: PlatoParser.ParenthesesExpressionContext) -> Value? {
        return visit(ctx.expression()!)
    }
    
    // MARK: Elements
    open override func visitIdElement(_ ctx: PlatoParser.IdElementContext) -> Value? {
        let id = ctx.ID()!.getText()
        guard let value = scopes.peek().getValue(forKey: id) else {
            return error("Cannot find '\(id)' in scope", at: ctx)
        }
        return value
    }
    
    open override func visitIntElement(_ ctx: PlatoParser.IntElementContext) -> Value? {
        return Value(int: Int(ctx.INT()!.getText())!)
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
        if let expressions = ctx.parameterList()?.expression() {
            for expression in expressions {
                values.append(visit(expression)!)
            }
        }
        return Value(array: values)
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
            guard indexValue.type <= ValueType.int else {
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
        let parent = scopes.peek()
        scopes.push(Scope(parent: parent))
    }
    
    func popScope() {
        scopes.pop()
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

