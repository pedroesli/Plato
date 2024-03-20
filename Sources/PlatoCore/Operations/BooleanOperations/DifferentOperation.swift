//
//  DifferentOperation.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 02/02/24.
//

struct DifferentOperation: BaseOperation {
    let left: Value
    let right: Value
    let order: OrderType
    static var compatibleMatrix: [ValueType : [ValueType]] = [
        .void    : [],
        .bool    : [.bool],
        .int     : [.int, .bool],
        .float   : [.float, .int, .bool],
        .double  : [.double, .float, .int, .bool],
        .string  : [.string],
        .array   : [.array],
    ]
    
    init(_ left: Value, _ right: Value) {
        self.left = left
        self.right = right
        order = Self.highestOrderType(left, right)
    }
    
    func result() throws -> Value {
        try isCompatible(op: "!=", type: .boolean)
        switch order.high {
        case .bool:
            return Value(bool: left.asBool != right.asBool)
        case .int:
            return Value(bool: left.asInteger != right.asInteger)
        case .float:
            return Value(bool: left.asFloat != right.asFloat)
        case .double:
            return Value(bool: left.asDouble != right.asDouble)
        case .string:
            return Value(bool: left.asString != right.asString)
        case .array:
            return Value(
                bool: try !left.asArray.elementsEqual(
                    right.asArray,
                    by: isNotEqual(left:right:)
                )
            )
        default:
            fatalError("Different operation failed. Reason: unsupported operation for \(order.high) type")
        }
    }
    
    private func isNotEqual(left: Value, right: Value) throws -> Bool {
        let operation = DifferentOperation(left, right)
        let result = try operation.result()
        return !result.asBool
    }
}
