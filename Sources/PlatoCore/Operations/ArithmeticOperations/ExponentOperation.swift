//
//  ExponentOperation.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 01/02/24.
//

import Foundation

struct ExponentOperation: BaseOperation {
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
        .string  : [],
        .array   : [],
    ]
    
    func result() throws -> Value {
        try isCompatible(op: "**", type: .arithmetic)
        switch order.high {
        case .bool, .int:
            return Value(int: Int(pow(Float(left.asInteger), Float(right.asInteger))))
        case .float:
            return Value(float: pow(left.asFloat, right.asFloat))
        case .double:
            return Value(double: pow(left.asDouble, right.asDouble))
        default:
            fatalError("Divide operation failed. Reason: unsupported operation for \(order.high) type")
        }
    }
}
