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
    
    public init(_ symbols: [String : Variable], parent: Scope) {
        self.symbols = symbols
    }
    
    /// Creates a new variable in this scope
    /// Note: Doesn't check if there is the same variable in parents scopes. Use carefully! 
    @discardableResult public func createVariable(type: VariableType, value: Value, forKey key: String) -> Variable? {
        
        return symbols.updateValue(Variable(type: type, value: value), forKey: key)
    }
    
    public func getVariable(forKey key: String) -> Variable? {
        guard let value = symbols[key] else {
            return parent?.getVariable(forKey: key)
        }
        return value
    }
}
