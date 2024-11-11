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
        .bool    : [.bool],
        .int     : [.int, .bool],
        .float   : [.float, .int, .bool],
        .double  : [.double, .float, .int, .bool],
        .string  : [],
        .array   : [],
    ]
    
    func result() throws -> Value {
        try isCompatible(op: "%", type: .arithmetic)
        if right.asFloat == 0 {
            throw OperationError.zeroDivisionError
        }
        
        switch order.high {
        case .bool, .int:
            return Value(int: left.asInteger % right.asInteger)
        case .float:
            return Value(float: left.asFloat.truncatingRemainder(dividingBy: right.asFloat))
        case .double:
            return Value(double: left.asDouble.truncatingRemainder(dividingBy: right.asDouble))
        default:
            fatalError("Modulo operation failed. Reason: unsupported operation for \(order.high) type")
        }
    }
}
