//
//  File.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 01/02/24.
//

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
        .boolean : [.boolean],
        .integer : [.integer, .boolean],
        .float   : [.float, .integer, .boolean],
        .string  : [.string],
        .array   : [.array],
    ]
    
    func result() -> Value? {
        switch order.high {
        case .boolean, .integer:
            return Value(int: left.asInteger + right.asInteger)
        case .float:
            return Value(float: left.asFloat + right.asFloat)
        case .string:
            return Value(string: left.asString + right.asString)
        case .array:
            return Value(array: left.asArray + right.asArray)
        default:
            return nil
        }
    }
}
