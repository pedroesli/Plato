//
//  BaseOperation.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 03/02/24.
//

protocol BaseOperation {
    typealias OrderType = (high: ValueType, low: ValueType)
    var left: Value { get }
    var right: Value { get }
    var order: OrderType { get }
    static var compatibleMatrix: [ValueType : [ValueType]] { get }
    
    func result() throws -> Value?
    func isCompatible(op: String) throws
}

extension BaseOperation {
    
    static func highestOrderType(_ left: Value, _ right: Value) -> OrderType {
        return left.type.rawValue > right.type.rawValue ? (left.type, right.type) : (right.type, left.type)
    }
    
    func isCompatible(op: String) throws {
        guard Self.compatibleMatrix[order.high]?.first(where: { $0 == order.low }) != nil else {
            if left.type == right.type {
                throw OperationError.typeError(message: "Binary operator '\(op)' cannot be applied to two '\(left.type)' operands")
            }
            throw OperationError.typeError(message: "Binary operator '\(op)' cannot be applied to '\(left.type)' and '\(right.type)' operands")
        }
    }
}
