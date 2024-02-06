//
//  LessThanEqualOperation.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 03/02/24.
//

struct LessThanEqualOperation: BaseOperation {
    let left: Value
    let right: Value
    let order: OrderType
    static var compatibleMatrix: [ValueType : [ValueType]] = [
        .void    : [],
        .boolean : [.boolean],
        .int     : [.int, .boolean],
        .float   : [.float, .int, .boolean],
        .string  : [.string],
        .array   : [],
    ]
    
    init(_ left: Value, _ right: Value) {
        self.left = left
        self.right = right
        order = Self.highestOrderType(left, right)
    }
    
    func result() throws -> Value? {
        try isCompatible(op: "<=", type: .boolean)
        switch order.high {
        case .boolean, .int:
            return Value(bool: left.asInteger <= right.asInteger)
        case .float:
            return Value(bool: left.asFloat <= right.asFloat)
        case .string:
            return Value(bool: left.asString <= right.asString)
        default:
            return nil
        }
    }
}
