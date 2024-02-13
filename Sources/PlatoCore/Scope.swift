//
//  File.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 05/02/24.
//

import Foundation

public class Scope {
    private var symbols: [String: Variable]
    private var parent: Scope?
    
    public init(parent: Scope?) {
        self.symbols = [:]
        self.parent = parent
    }
    
    public init(_ dictionary: [String : Variable], parent: Scope) {
        self.symbols = dictionary
    }
    
//    public func updateValue(_ value: Value, forKey key: String) -> Value? {
//        guard let variable = getVariable(forKey: key) else { return nil }
//        variable.value = value
//        return value
//    }
    
//    @discardableResult public func updateVariable(_ variable: Variable, forKey key: String) -> Variable? {
//        guard let retrievedVariable = getVariable(forKey: key) else {
//            return symbols.updateValue(variable, forKey: key)
//        }
//        retrievedVariable.value = variable.value
//        retrievedVariable.type = variable.type
//        return retrievedVariable
//    }
    
    /// Creates a new variable in this scope
    /// Note: Doesn't check if there is the same variable in parents scopes. Use carefully! 
    @discardableResult public func createVariable(_ variable: Variable, forKey key: String) -> Variable? {
        return symbols.updateValue(variable, forKey: key)
    }

//    @discardableResult public func updateValue(_ value: Variable, forKey key: String) -> Variable? {
//        if symbols[key] != nil {
//            return symbols.updateValue(value, forKey: key)
//        }
//        // Else check if parent has the value otherwise create in this scope
//        if let parentValue = parent?.mayUpdateValue(value, forKey: key) {
//            return parentValue
//        }
//        return symbols.updateValue(value, forKey: key)
//    }
    
    public func getVariable(forKey key: String) -> Variable? {
        guard let value = symbols[key] else {
            return parent?.getVariable(forKey: key)
        }
        return value
    }
    
    // use this to update parent value. Returns nil instead of creating a value in that scope
//    private func mayUpdateValue(_ value: Variable, forKey key: String) -> Variable? {
//        if symbols[key] != nil {
//            return symbols.updateValue(value, forKey: key)
//        }
//        if let parentValue = parent?.mayUpdateValue(value, forKey: key) {
//            return parentValue
//        }
//        return nil
//    }
}
