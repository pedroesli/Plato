//
//  Function.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 19/02/24.
//

import Foundation

public class Function {
    private let parameters: [Parameter]
    private let ctx: PlatoParser.FunctionDeclarationContext
    
    public var parametersCount: Int {
        return parameters.count
    }
    
    public init(parameters: [Parameter], ctx: PlatoParser.FunctionDeclarationContext) {
        self.parameters = parameters
        self.ctx = ctx
    }
    
    public func compareParameters(with callParameters: [CallParameter]) -> Bool {
        return parameters.elementsEqual(callParameters, by: { $0.compare(with: $1) })
    }
    
    public func handle(callParameters: [CallParameter], interpreter: PlatoInterpreter) throws -> Value? {
        interpreter.newScope()
        interpreter.canUseReturn = true
        for (index, parameter) in parameters.enumerated() {
            interpreter.variables.peek().createVariable(type: parameter.type, value: callParameters[index].value, forKey: parameter.id)
        }
        if let statements = ctx.statements() {
            _ = interpreter.visit(statements)
        }
        interpreter.canUseReturn = false
        interpreter.popScope()
        return interpreter.returnValue
    }
}

extension Function: Hashable {
    public static func == (lhs: Function, rhs: Function) -> Bool {
        lhs.parameters == rhs.parameters
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(parameters)
    }
}
