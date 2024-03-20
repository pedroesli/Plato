//
//  OrOperation.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 02/02/24.
//

struct OrOperation: BaseOperation {
    let left: Value
    let right: Value
    let order: OrderType
    static var compatibleMatrix: [ValueType : [ValueType]] = [
        .void    : [],
        .bool    : [.bool, .int, .float, .double],
        .int     : [.bool, .int, .float, .double],
        .float   : [.bool, .int, .float, .double],
        .double  : [.bool, .int, .float, .double],
        .string  : [],
        .array   : [],
    ]
    
    init(_ left: Value, _ right: Value) {
        self.left = left
        self.right = right
        order = Self.highestOrderType(left, right)
    }
    
    func result() throws -> Value {
        try isCompatible(op: "or", type: .boolean)
        return Value(bool: left.asBool || right.asBool)
    }
}
