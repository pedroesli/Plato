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
        .int     : [.int, .boolean],
        .float   : [.float, .int, .boolean],
        .string  : [],
        .array   : [],
    ]
    
    func result() throws -> Value {
        try isCompatible(op: "%", type: .arithmetic)
        if right.asFloat == 0 {
            throw OperationError.zeroDivisionError
        }
        
        switch order.high {
        case .boolean, .int:
            return Value(int: left.asInteger % right.asInteger)
        case .float:
            return Value(float: left.asFloat.truncatingRemainder(dividingBy: right.asFloat))
        default:
            fatalError("Modulo operation failed. Reason: no operation for \(order.high) type")
        }
    }
}
