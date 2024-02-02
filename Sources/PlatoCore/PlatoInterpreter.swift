//
//  PlatoMainVisitor.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 24/01/24.
//

import Antlr4

open class PlatoInterpreter: PlatoBaseVisitor<Value> {
    public var error: RuntimeError?
    
    private let globalMemory: [String : Value] = [:]
    private let scopes: Stack<[String : Value]> = Stack<[String : Value]>()
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
    
    // MARK: Expressions
    open override func visitExponentExpression(_ ctx: PlatoParser.ExponentExpressionContext) -> Value? {
        guard let (left, right) = getArithmeticValues(ctx) else { return nil }
        
        let operation = ExponentOperation(left, right)
        guard operation.isCompatible() else {
            return error("Binary operator '^' cannot be applied to '\(left.type)' and '\(right.type)' operands", at: ctx)
        }
        return operation.result()
    }
    
    open override func visitUnaryExpression(_ ctx: PlatoParser.UnaryExpressionContext) -> Value? {
        guard let expression = ctx.expression(),
              let value = visit(expression) else { return nil }
        
        guard value.type.rawValue <= ValueType.float.rawValue else {
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
        
        guard value.type.rawValue <= ValueType.float.rawValue else {
            return error("Not operator '!' to an operand of type '\(value.type)'", at: ctx)
        }
        return Value(bool: !value.asBool)
    }
    
    open override func visitMulExpression(_ ctx: PlatoParser.MulExpressionContext) -> Value? {
        guard let (left, right) = getArithmeticValues(ctx) else { return nil }
        
        let operation: ArithmeticOperation!
        
        switch PlatoParser.Tokens(rawValue: ctx.op.getType())! {
        case PlatoParser.Tokens.MUL:
            operation = MultiplyOperation(left, right)
        case PlatoParser.Tokens.DIV:
            guard right.asFloat != 0 else {
                return error("Division by zero", at: ctx)
            }
            operation = DivideOperation(left, right)
        case PlatoParser.Tokens.MOD:
            guard right.asFloat != 0 else {
                return error("Division by zero", at: ctx)
            }
            operation = ModuloOperation(left, right)
        default:
            return unexpectedError(at: ctx)
        }
        
        guard operation.isCompatible() else {
            return error("Binary operator '\(ctx.op.getText()!)' cannot be applied to '\(left.type)' and '\(right.type)' operands", at: ctx)
        }
        return operation.result()
    }
    
    open override func visitAddExpression(_ ctx: PlatoParser.AddExpressionContext) -> Value? {
        guard let (left, right) = getArithmeticValues(ctx) else { return nil }
        
        let operation: ArithmeticOperation = ctx.op.getType() == PlatoParser.Tokens.MINUS ?
        SubtractOperation(left, right) :
        AddOperation(left, right)
        
        guard operation.isCompatible() else {
            return error("Binary operator '\(ctx.op.getText()!)' cannot be applied to '\(left.type)' and '\(right.type)' operands", at: ctx)
        }
        return operation.result()
    }
    
    open override func visitAndExpression(_ ctx: PlatoParser.AndExpressionContext) -> Value? {
        guard let (left, right) = getArithmeticValues(ctx) else { return nil }
        let operation = AndOperation(left, right)
        
        guard operation.isCompatible() else {
            return error("Boolean operator 'and' cannot be applied to '\(left.type)' and '\(right.type)' operands", at: ctx)
        }
        
        return operation.result()
    }
    
    open override func visitOrExpression(_ ctx: PlatoParser.OrExpressionContext) -> Value? {
        guard let (left, right) = getArithmeticValues(ctx) else { return nil }
        let operation = OrOperation(left, right)
        
        guard operation.isCompatible() else {
            return error("Boolean operator 'or' cannot be applied to '\(left.type)' and '\(right.type)' operands", at: ctx)
        }
        
        return operation.result()
    }
    
    open override func visitParenthesesExpression(_ ctx: PlatoParser.ParenthesesExpressionContext) -> Value? {
        return visit(ctx.expression()!)
    }
    
    // MARK: Elements
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
    private func getArithmeticValues(_ ctx: PlatoParser.ExpressionContext) -> (Value, Value)? {
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

