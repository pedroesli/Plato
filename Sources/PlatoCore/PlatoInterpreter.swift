//
//  PlatoMainVisitor.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 24/01/24.
//

import Antlr4
import Foundation

open class PlatoInterpreter: PlatoBaseVisitor<Value> {
    public var error: RuntimeError?
    
    private var globalMemory: NSMutableDictionary = [:]
    private var scopes = Stack<NSMutableDictionary>()
    private let functions: [String : PlatoParser.FunctionDeclarationContext] = [:]
    
    open override func visitProgram(_ ctx: PlatoParser.ProgramContext) -> Value? {
        scopes.push(globalMemory)
        guard let statements = ctx.statements() else { return nil }
        return visit(statements)
    }
    
    // MARK: Statements
    open override func visitExpressionStatement(_ ctx: PlatoParser.ExpressionStatementContext) -> Value? {
        if let expression = ctx.expression(), let result = visit(expression) {
            print(result)
        }
        return nil
    }
    
    open override func visitAssignmentStatement(_ ctx: PlatoParser.AssignmentStatementContext) -> Value? {
        let id = ctx.ID()!.getText()
        if !IDValidator.isValid(id) {
            return error("Keyword '\(id)' cannot be used as an identifier", at: ctx)
        }
        
        guard let value = visit(ctx.expression()!) else { return nil }
        // Normal assign
        if ctx.op.getType() == PlatoParser.Tokens.ASSIGN {
            scopes.peek().setValue(value, forKey: id)
            return value
        }
        
        // Arithmetic assign
        guard let left = scopes.peek().value(forKey: id) as? Value else {
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
            return try operation.result()
        } catch {
            return self.error(error.localizedDescription, at: ctx)
        }
    }
    
    // MARK: Expressions
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
        
        guard value.type <= ValueType.float else {
            return error("Unary operator '\(ctx.op.getText()!)' to an operand of type '\(value.type)'", at: ctx)
        }
        
        if ctx.op.getType() == PlatoParser.Tokens.MINUS {
            return minusUnaryValue(value)
        }
        return value
    }
    
    open override func visitNotExpression(_ ctx: PlatoParser.NotExpressionContext) -> Value? {
        guard let expression = ctx.expression(),
              let value = visit(expression) else { return nil }
        
        guard value.type <= ValueType.float else {
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
        return scopes.peek().value(forKey: id) as? Value
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
        var values: [Value] = []
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
    
    private func minusUnaryValue(_ value: Value) -> Value? {
        switch value.type {
        case .boolean, .integer:
            return Value(int: -value.asInteger)
        case .float:
            return Value(float: -value.asFloat)
        default:
            return nil
        }
    }
    
    /// Get the left and right expression
    private func getExpressionValues(_ ctx: PlatoParser.ExpressionContext) -> (Value, Value)? {
        guard let leftExp = ctx.getRuleContext(PlatoParser.ExpressionContext.self, 0),
              let rightExp = ctx.getRuleContext(PlatoParser.ExpressionContext.self, 1),
              let left = visit(leftExp),
              let right = visit(rightExp) else { return nil }
        return (left, right)
    }
    
    private func error(_ description: String, at ctx: ParserRuleContext) -> Value? {
        let line = ctx.getStart()?.getLine() ?? 0
        let column = ctx.getStart()?.getCharPositionInLine() ?? 0
        error = RuntimeError(
            message: description,
            badCode: ctx.getText(),
            line: line,
            column: column
        )
        return nil
    }
    
    private func unexpectedError(at ctx: ParserRuleContext) -> Value? {
        return error("Unexpected error!", at: ctx)
    }
}

