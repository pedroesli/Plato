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
    open override func visitStatements(_ ctx: PlatoParser.StatementsContext) -> Value? {
        for statement in ctx.statement() {
            guard error == nil else { return nil }
            return visit(statement)
        }
        return nil
    }
    
    open override func visitExpressionStatement(_ ctx: PlatoParser.ExpressionStatementContext) -> Value? {
        if let expression = ctx.expression(), let result = visit(expression) {
            print(result)
        }
        return nil
    }
    
    // MARK: Expressions
    open override func visitAddExpresion(_ ctx: PlatoParser.AddExpresionContext) -> Value? {
        guard let leftExp = ctx.expression(0),
              let rightExp = ctx.expression(1),
              let left = visit(leftExp),
              let right = visit(rightExp) else { return nil }
        
        guard left.type.isCompatible(with: right.type) else {
            error = RuntimeError("Runtime Error in \(ctx.getText()): \(left.type) and \(right.type) is not of the same type or numerical.")
            return nil
        }
        
        switch ctx.op.getType() {
        case PlatoParser.Tokens.PLUS.rawValue:
            return addValues(left, right)
        case PlatoParser.Tokens.MINUS.rawValue:
            guard left.type.rawValue <= ValueType.float.rawValue else {
                error = RuntimeError("Runtime Error in \(ctx.getText()): Binary operator '-' cannot be applied to two '\(left.type)' operands")
                return nil
            }
            return subtractValues(left, right)
        default:
            return nil
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
    private func addValues(_ left: Value, _ right: Value) -> Value? {
        switch higherOrderType(left, right) {
        case .boolean:
            return Value(int: left.asInteger + right.asInteger)
        case .integer:
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
        case .boolean:
            return Value(int: left.asInteger - right.asInteger)
        case .integer:
            return Value(int: left.asInteger - right.asInteger)
        case .float:
            return Value(float: left.asFloat - right.asFloat)
        default:
            return nil
        }
    }
    
    /// which one has the highest order
    private func higherOrderType(_ left: Value, _ right: Value) -> ValueType {
        return left.type.rawValue > right.type.rawValue ? left.type : right.type
    }
}

