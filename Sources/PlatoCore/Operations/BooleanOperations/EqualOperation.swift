//
//  File.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 02/02/24.
//

struct EqualOperation: BaseOperation {
    let left: Value
    let right: Value
    let order: OrderType
    static var compatibleMatrix: [ValueType : [ValueType]] = [
        .void    : [],
        .boolean : [.boolean],
        .int     : [.int, .boolean],
        .float   : [.float, .int, .boolean],
        .string  : [.string],
        .array   : [.array],
    ]
    
    init(_ left: Value, _ right: Value) {
        self.left = left
        self.right = right
        order = Self.highestOrderType(left, right)
    }
    
    func result() throws -> Value {
        try isCompatible(op: "=", type: .boolean)
        switch order.high {
        case .boolean:
            return Value(bool: left.asBool == right.asBool)
        case .int:
            return Value(bool: left.asInteger == right.asInteger)
        case .float:
            return Value(bool: left.asFloat == right.asFloat)
        case .string:
            return Value(bool: left.asString == right.asString)
        case .array:
            guard left.asArray.count == right.asArray.count else { return Value(bool: false) }
            return Value(
                bool: try left.asArray.elementsEqual(
                    right.asArray,
                    by: isEqual(left:right:)
                )
            )
        default:
            fatalError("Equal operation failed. Reason: unsupported operation for \(order.high) type")
        }
    }
    
    private func isEqual(left: Value, right: Value) throws -> Bool {
        let operation = EqualOperation(left, right)
        let result = try operation.result()
        return result.asBool
    }
}
