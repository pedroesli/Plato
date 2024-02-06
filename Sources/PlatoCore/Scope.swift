//
//  File.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 05/02/24.
//

import Foundation

public class Scope<Key, Value> where Key: Hashable {
    private var symbols: [Key: Value]
    private var parent: Scope<Key, Value>?
    
    public init(parent: Scope<Key, Value>?) {
        self.symbols = [:]
        self.parent = parent
    }
    
    public init(_ dictionary: [Key : Value], parentScope: Scope<Key, Value>) {
        self.symbols = dictionary
    }

    @discardableResult public func updateValue(_ value: Value, forKey key: Key) -> Value? {
        if symbols[key] != nil {
            return symbols.updateValue(value, forKey: key)
        }
        // Else check if parent has the value otherwise create in this scope
        if let parentValue = parent?.mayUpdateValue(value, forKey: key) {
            return parentValue
        }
        return symbols.updateValue(value, forKey: key)
    }
    
    public func getValue(forKey key: Key) -> Value? {
        guard let value = symbols[key] else {
            return parent?.getValue(forKey: key)
        }
        return value
    }
    
    // use this to update parent value. Returns nil instead of creating a value in that scope
    private func mayUpdateValue(_ value: Value, forKey key: Key) -> Value? {
        if symbols[key] != nil {
            return symbols.updateValue(value, forKey: key)
        }
        if let parentValue = parent?.mayUpdateValue(value, forKey: key) {
            return parentValue
        }
        return nil
    }
}
