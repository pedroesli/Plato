//
//  File.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 01/02/24.
//

import Foundation

struct AddOperation: BaseOperation {
    let left: Value
    let right: Value
    let order: OrderType
    
    init(_ left: Value, _ right: Value) {
        self.left = left
        self.right = right
        self.order = Self.highestOrderType(left, right)
    }
    
    static let compatibleMatrix: [ValueType : [ValueType]] = [
        .void    : [],
        .bool    : [.bool],
        .int     : [.int, .bool],
        .float   : [.float, .int, .bool],
        .double  : [.double, .float, .int, .bool],
        .string  : [.string],
        .array   : [.array],
    ]
    
    func result() throws -> Value {
        try isCompatible(op: "+", type: .arithmetic)
        switch order.high {
        case .bool, .int:
            return Value(int: left.asInteger + right.asInteger)
        case .float:
            return Value(float: left.asFloat + right.asFloat)
        case .double:
            return Value(double: left.asDouble + right.asDouble)
        case .string:
            return Value(string: left.asString + right.asString)
        case .array:
            return Value(array: left.asArray + right.asArray)
        default:
            fatalError("Add operation failed. Reason: unsupported operation for \(order.high) type")
        }
    }
}
