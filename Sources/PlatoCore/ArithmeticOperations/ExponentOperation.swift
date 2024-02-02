//
//  ExponentOperation.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 01/02/24.
//

import Foundation

struct ExponentOperation: ArithmeticOperation {
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
        .integer : [.integer, .boolean],
        .float   : [.float, .integer, .boolean],
        .string  : [],
        .array   : [],
    ]
    
    func result() -> Value? {
        switch order.high {
        case .boolean, .integer:
            return Value(int: Int(pow(Float(left.asInteger), Float(right.asInteger))))
        case .float:
            return Value(float: pow(left.asFloat, right.asFloat))
        default:
            return nil
        }
    }
}
