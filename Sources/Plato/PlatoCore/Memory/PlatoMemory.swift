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
    
    func newScope() {
        variables.push(VariableScope(parent: variables.peek()))
        functions.push(FunctionScope(parent: functions.peek()))
    }
    
    func popScope() {
        variables.pop()
        functions.pop()
    }
    
    /// Clears the interpreters cache. (Use 'reset()' method if you want to reset the interpreter)
    func clearMemory() {
        variables.clear()
        functions.clear()
        
        globalVariables = VariableScope(parent: nil)
        globalFunctions = FunctionScope(parent: nil)
        
        variables.push(globalVariables)
        functions.push(globalFunctions)
    }
}
