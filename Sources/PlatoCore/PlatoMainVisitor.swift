//
//  PlatoMainVisitor.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 24/01/24.
//

import Antlr4

open class PlatoMainVisitor: PlatoBaseVisitor<Value> {
    public var error: PlatoError?
    
    private let globalMemory: [String : Value] = [:]
    private let scopes: Stack<[String : Value]> = Stack<[String : Value]>()
    private let functions: [String : PlatoParser.FunctionDeclarationContext] = [:]
    
    open override func visitProgram(_ ctx: PlatoParser.ProgramContext) -> Value? {
        scopes.push(globalMemory)
        guard let statements = ctx.statements() else { return Value.void }
        return visit(statements)
    }
}

