//
//  ValueType.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 24/01/24.
//

/// The atomic type of a value
public enum ValueType: Int8 {
    case boolean
    case int
    case float
    case string
    case array
    case void
    case command
    
    public var isNumber: Bool {
        isInRange(of: .float)
    }
    
    public func isInRange(of type: ValueType) -> Bool {
        self.rawValue <= type.rawValue
    }
}
