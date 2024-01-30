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
    open override func visitUnaryExpresion(_ ctx: PlatoParser.UnaryExpresionContext) -> Value? {
        guard let expression = ctx.expression(),
              let value = visit(expression) else { return nil }
        
        guard value.type.rawValue <= ValueType.float.rawValue else {
            return error("Unary operator '\(ctx.op.getText()!)' to an operand of type '\(value.type)'", at: ctx)
        }
        
        switch ctx.op.getType() {
        case PlatoParser.Tokens.PLUS.rawValue:
            return value
        case PlatoParser.Tokens.MINUS.rawValue:
            return minusUnaryValue(value)
        default:
            return unexpectedError(at: ctx)
        }
    }
    
    open override func visitMulExpresion(_ ctx: PlatoParser.MulExpresionContext) -> Value? {
        guard let (left, right) = getArithmeticValues(ctx) else { return nil }
        
        guard left.type.isCompatible(with: right.type) else {
            return error("'\(left.type)' and '\(right.type)' is not of the same type or numerical.", at: ctx)
        }
        
        guard left.type.rawValue <= ValueType.float.rawValue else {
            return error("Binary operator '\(ctx.op.getText()!)' cannot be applied to two '\(left.type)' operands", at: ctx)
        }
        
        switch ctx.op.getType() {
        case PlatoParser.Tokens.MUL.rawValue:
            return multiplyValues(left, right)
        case PlatoParser.Tokens.DIV.rawValue:
            guard right.asFloat != 0 else {
                return error("Division by zero", at: ctx)
            }
            return divideValues(left, right)
        case PlatoParser.Tokens.MOD.rawValue:
            guard right.asFloat != 0 else {
                return error("Division by zero", at: ctx)
            }
            return moduloValues(left, right)
        default:
            return unexpectedError(at: ctx)
        }
    }
    
    open override func visitAddExpresion(_ ctx: PlatoParser.AddExpresionContext) -> Value? {
        guard let (left, right) = getArithmeticValues(ctx) else { return nil }
        
        guard left.type.isCompatible(with: right.type) else {
            return error("'\(left.type)' and '\(right.type) is not of the same type or numerical.", at: ctx)
        }
        
        switch ctx.op.getType() {
        case PlatoParser.Tokens.PLUS.rawValue:
            return addValues(left, right)
        case PlatoParser.Tokens.MINUS.rawValue:
            guard left.type.rawValue <= ValueType.float.rawValue else {
                return error("Binary operator '-' cannot be applied to two '\(left.type)' operands", at: ctx)
            }
            return subtractValues(left, right)
        default:
            return unexpectedError(at: ctx)
        }
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
    
    private func multiplyValues(_ left: Value, _ right: Value) -> Value? {
        switch higherOrderType(left, right) {
        case .boolean, .integer:
            return Value(int: left.asInteger * right.asInteger)
        case .float:
            return Value(float: left.asFloat * right.asFloat)
        default:
            return nil
        }
    }
    
    private func divideValues(_ left: Value, _ right: Value) -> Value? {
        switch higherOrderType(left, right) {
        case .boolean, .integer:
            return Value(int: left.asInteger / right.asInteger)
        case .float:
            return Value(float: left.asFloat / right.asFloat)
        default:
            return nil
        }
    }
    
    private func moduloValues(_ left: Value, _ right: Value) -> Value? {
        switch higherOrderType(left, right) {
        case .boolean, .integer:
            return Value(int: left.asInteger % right.asInteger)
        case .float:
            return Value(float: left.asFloat.truncatingRemainder(dividingBy: right.asFloat))
        default:
            return nil
        }
    }
    
    private func addValues(_ left: Value, _ right: Value) -> Value? {
        switch higherOrderType(left, right) {
        case .boolean, .integer:
            return Value(int: left.asInteger + right.asInteger)
        case .float:
            return Value(float: left.asFloat + right.asFloat)
        case .string:
            return Value(string: left.asString + right.asString)
        case .array:
            return Value(array: left.asArray + right.asArray)
        default:
            return nil
        }
    }
    
    private func subtractValues(_ left: Value, _ right: Value) -> Value? {
        switch higherOrderType(left, right) {
        case .boolean, .integer:
            return Value(int: left.asInteger - right.asInteger)
        case .float:
            return Value(float: left.asFloat - right.asFloat)
        default:
            return nil
        }
    }
    
    /// Which value has the highest order
    private func higherOrderType(_ left: Value, _ right: Value) -> ValueType {
        return left.type.rawValue > right.type.rawValue ? left.type : right.type
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
        error = RuntimeError("Runtime Error in \(ctx.getText()): " + description, line: line, column: column)
        return nil
    }
    
    private func unexpectedError(at ctx: ParserRuleContext) -> Value? {
        return error("Unexpected error!", at: ctx)
    }
}

