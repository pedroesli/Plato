//
//  Function.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 19/02/24.
//

import Foundation

class Function {
    private let parameters: [Parameter]
    private let ctx: PlatoParser.FunctionDeclarationContext
    
    var parametersCount: Int {
        return parameters.count
    }
    
    init(parameters: [Parameter], ctx: PlatoParser.FunctionDeclarationContext) {
        self.parameters = parameters
        self.ctx = ctx
    }
    
    func compareParameters(with callParameters: [CallParameter]) -> Bool {
        return parameters.elementsEqual(callParameters, by: { $0.compare(with: $1) })
    }
    
    func handle(callParameters: [CallParameter], interpreter: PlatoInterpreter) throws -> Value? {
        guard !interpreter.isHalting else { return nil }
        
        interpreter.memory.newScope()
        interpreter.canUseReturn = true
        for (index, parameter) in parameters.enumerated() {
            interpreter.memory.variables.peek().createVariable(type: parameter.type, value: callParameters[index].value, forKey: parameter.id)
        }
        if let statements = ctx.statements() {
            _ = interpreter.visit(statements)
        }
        interpreter.canUseReturn = false
        interpreter.memory.popScope()
        
        return interpreter.returnValue
    }
}

extension Function: Hashable {
    static func == (lhs: Function, rhs: Function) -> Bool {
        lhs.parameters == rhs.parameters
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(parameters)
    }
}
