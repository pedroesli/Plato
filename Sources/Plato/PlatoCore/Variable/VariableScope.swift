//
//  VariableScope.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 05/02/24.
//

class VariableScope {
    
    private var symbols: [String: Variable]
    private var parent: VariableScope?
    
    init() {
        self.symbols = [:]
        self.parent = nil
    }
    
    init(parent: VariableScope?) {
        self.symbols = [:]
        self.parent = parent
    }
    
    /// Creates a new value in this scope
    /// Note: Doesn't check if there is the same value in parents scopes. Use carefully!
    @discardableResult func create(_ value: Variable, forKey key: String) -> Variable? {
        return symbols.updateValue(value, forKey: key)
    }
    
    /// Creates a new variable in this scope
    /// Note: Doesn't check if there is the same variable in parents scopes. Use carefully!
    @discardableResult func createVariable(type: VariableType, value: Value, forKey key: String) -> Variable? {
        return create(Variable(type: type, value: value), forKey: key)
    }
    
    func retrieve(forKey key: String) -> Variable? {
        guard let value = symbols[key] else {
            return parent?.retrieve(forKey: key)
        }
        return value
    }
}
