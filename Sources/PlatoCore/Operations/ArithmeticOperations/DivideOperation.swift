//
//  DivideOperation.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 01/02/24.
//

struct DivideOperation: BaseOperation {
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
        try isCompatible(op: "/", type: .arithmetic)
        if right.asFloat == 0 {
            throw OperationError.zeroDivisionError
        }
        
        switch order.high {
        case .boolean, .int:
            return Value(int: left.asInteger / right.asInteger)
        case .float:
            return Value(float: left.asFloat / right.asFloat)
        default:
            fatalError("Divide operation failed. Reason: no operation for \(order.high) type")
        }
    }
    
    func isCompatible() -> Bool {
        return Self.compatibleMatrix[order.high]?.first(where: { $0 == order.low }) != nil && right.asFloat != 0
    }
}
