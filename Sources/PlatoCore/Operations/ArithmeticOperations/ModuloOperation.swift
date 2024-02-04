//
//  ModuloOperation.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 01/02/24.
//

struct ModuloOperation: BaseOperation {
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
    
    func result() throws -> Value? {
        try isCompatible(op: "%")
        if right.asFloat == 0 {
            throw ArithmeticError.zeroDivisionError
        }
        
        switch order.high {
        case .boolean, .integer:
            return Value(int: left.asInteger % right.asInteger)
        case .float:
            return Value(float: left.asFloat.truncatingRemainder(dividingBy: right.asFloat))
        default:
            return nil
        }
    }
}
