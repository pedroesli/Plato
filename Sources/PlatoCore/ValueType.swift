//
//  ValueType.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 24/01/24.
//

public enum ValueType: Int8 {
    case boolean
    case integer
    case float
    case string
    case array
    case void
    
    public func isCompatible(with right: ValueType) -> Bool {
        guard self != .void && right != .void else { return false }
        if self.rawValue == right.rawValue {
            return true
        }
        if self.rawValue <= ValueType.float.rawValue && right.rawValue <= ValueType.float.rawValue {
            return true
        }
        return false
    }
    
    static func <= (_ left: ValueType, _ right: ValueType) -> Bool {
        return left.rawValue <= right.rawValue
    }
}
