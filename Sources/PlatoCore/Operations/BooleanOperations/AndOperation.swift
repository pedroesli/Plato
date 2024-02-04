//
//  AndOperation.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 02/02/24.
//

struct AndOperation: BaseOperation {
    let left: Value
    let right: Value
    let order: OrderType
    static var compatibleMatrix: [ValueType : [ValueType]] = [
        .void    : [],
        .boolean : [.float, .integer, .boolean],
        .integer : [.float, .integer, .boolean],
        .float   : [.float, .integer, .boolean],
        .string  : [],
        .array   : [],
    ]
    
    init(_ left: Value, _ right: Value) {
        self.left = left
        self.right = right
        order = Self.highestOrderType(left, right)
    }
    
    func result() throws -> Value? {
        try isCompatible(op: "and")
        return Value(bool: left.asBool && right.asBool)
    }
}
