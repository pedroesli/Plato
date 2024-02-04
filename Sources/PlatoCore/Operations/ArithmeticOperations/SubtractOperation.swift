//
//  MinusOperation.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 01/02/24.
//

struct SubtractOperation: BaseOperation {
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
        .int : [.int, .boolean],
        .float   : [.float, .int, .boolean],
        .string  : [],
        .array   : [],
    ]
    
    func result() throws -> Value? {
        try isCompatible(op: "-")
        switch order.high {
        case .boolean, .int:
            return Value(int: left.asInteger - right.asInteger)
        case .float:
            return Value(float: left.asFloat - right.asFloat)
        default:
            return nil
        }
    }
}
