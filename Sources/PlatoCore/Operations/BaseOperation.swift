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
    
    func result() -> Value?
    func isCompatible() -> Bool
}

extension BaseOperation {
    
    static func highestOrderType(_ left: Value, _ right: Value) -> OrderType {
        return left.type.rawValue > right.type.rawValue ? (left.type, right.type) : (right.type, left.type)
    }
    
    func isCompatible() -> Bool {
        return Self.compatibleMatrix[order.high]?.first(where: { $0 == order.low }) != nil
    }
}
