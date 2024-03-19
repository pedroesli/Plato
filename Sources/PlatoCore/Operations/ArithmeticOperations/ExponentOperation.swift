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
        .boolean : [.boolean],
        .int     : [.int, .boolean],
        .float   : [.float, .int, .boolean],
        .string  : [],
        .array   : [],
    ]
    
    func result() throws -> Value {
        try isCompatible(op: "**", type: .arithmetic)
        switch order.high {
        case .boolean, .int:
            return Value(int: Int(pow(Float(left.asInteger), Float(right.asInteger))))
        case .float:
            return Value(float: pow(left.asFloat, right.asFloat))
        default:
            fatalError("Divide operation failed. Reason: no operation for \(order.high) type")
        }
    }
}
