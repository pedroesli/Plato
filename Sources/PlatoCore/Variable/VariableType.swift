//
//  VariableType.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 12/02/24.
//

public enum VariableType: String {
    case any
    case bool
    case int
    case float
    case double
    case number
    case string
    case array
    
    public var text: String {
        self.rawValue
    }
    
    public func isCompatible(with valueType: ValueType) -> Bool {
        switch self {
        case .any:
            valueType.isInRange(of: .array)
        case .bool:
            valueType.isNumber
        case .int:
            valueType == .int || valueType == .bool
        case .float:
            valueType.isNumber
        case .double:
            valueType.isNumber
        case .number:
            valueType.isNumber
        case .string:
            valueType == .string
        case .array:
            valueType == .array
        }
    }
    
    /// Return true if ValueType is the of the same type or compatible with any, otherwise return false. Used in function parameters.
    public func isStrictCompatible(with valueType: ValueType) -> Bool {
        switch self {
        case .any:
            valueType.isInRange(of: .array)
        case .bool:
            valueType == .bool
        case .int:
            valueType == .int
        case .float:
            valueType == .float
        case .double:
            valueType == .double
        case .number:
            valueType.isNumber
        case .string:
            valueType == .string
        case .array:
            valueType == .array
        }
    }
}
