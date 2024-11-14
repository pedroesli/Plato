//
//  PlatoMemory.swift
//  Plato
//
//  Created by Pedro Ésli Vieira do Nascimento on 13/11/24.
//

class PlatoMemory {
    let variables = Stack<VariableScope>()
    let functions = Stack<FunctionScope>()
    var returnValue: Value = .void
    var canUseReturn = false
    
    private var globalVariables = VariableScope()
    private var globalFunctions = FunctionScope()
    
    init() {
        variables.push(globalVariables)
        functions.push(globalFunctions)
    }
}
