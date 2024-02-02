//
//  DifferentOperation.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 02/02/24.
//

struct DifferentOperation: BooleanOperation {
    var left: Value
    var right: Value
    static var compatibleMatrix: [ValueType : [ValueType]] = [
        .void    : [],
        .boolean : [.float, .integer, .boolean],
        .integer : [.float, .integer, .boolean],
        .float   : [.float, .integer, .boolean],
        .string  : [.string],
        .array   : [.array],
    ]
    
    init(_ left: Value, _ right: Value) {
        self.left = left
        self.right = right
    }
    
    func result() -> Value? {
        let highest = highestValueType(left, right)
        switch highest {
        case .boolean:
            return Value(bool: left.asBool != right.asBool)
        case .integer:
            return Value(bool: left.asInteger != right.asInteger)
        case .float:
            return Value(bool: left.asFloat != right.asFloat)
        case .string:
            return Value(bool: left.asString != right.asString)
        case .array:
            guard left.asArray.count == right.asArray.count else { return Value(bool: true) }
            return Value(
                bool: !left.asArray.elementsEqual(
                    right.asArray,
                    by: isNotEqual(left:right:)
                )
            )
        default:
            return nil
        }
    }
    
    func highestValueType(_ left: Value, _ right: Value) -> ValueType {
        return left.type.rawValue > right.type.rawValue ? left.type : right.type
    }
    
    private func isNotEqual(left: Value, right: Value) -> Bool {
        let operation = DifferentOperation(left, right)
        guard operation.isCompatible() else { return false }
        guard let result = operation.result() else { return false }
        return !result.asBool
    }
}
