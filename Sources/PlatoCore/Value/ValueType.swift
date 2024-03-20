//
//  ValueType.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 24/01/24.
//

/// The atomic type of a value
public enum ValueType: Int {
    case bool
    case int
    case float
    case double
    case string
    case array
    case void
    case command
    
    public var isNumber: Bool {
        isInRange(of: .double)
    }
    
    public func isInRange(of type: ValueType) -> Bool {
        self.rawValue <= type.rawValue
    }
    
    public func isHigherOrder(than type: ValueType) -> Bool {
        self.rawValue > type.rawValue
    }
}
