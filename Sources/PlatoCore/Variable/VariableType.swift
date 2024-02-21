//
//  VariableType.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 12/02/24.
//

public enum VariableType {
    case any
    case boolean
    case int
    case float
    case number
    case string
    case array
    
    public func isCompatible(with valueType: ValueType) -> Bool {
        switch self {
        case .any:
            valueType.isInRange(of: .array)
        case .boolean:
            valueType.isNumber
        case .int:
            valueType == .int || valueType == .boolean
        case .float:
            valueType.isNumber
        case .number:
            valueType.isNumber
        case .string:
            valueType == .string
        case .array:
            valueType == .array
        }
    }
}
