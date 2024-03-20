//
//  Value.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 24/01/24.
//

import Foundation

public final class Value {
    public let type: ValueType
    private var value: Any
    
    public init(bool: Bool) {
        self.type = .bool
        self.value = bool
    }
    
    public init(int: Int) {
        self.type = .int
        self.value = int
    }
    
    public init(float: Float) {
        self.type = .float
        self.value = float
    }
    
    public init(double: Double) {
        self.type = .double
        self.value = double
    }
    
    public init(string: String) {
        self.type = .string
        self.value = string
    }
    
    public init(array: ArrayValue) {
        self.type = .array
        self.value = array
    }
    
    internal init(command: CommandType) {
        self.type = .command
        self.value = command
    }
    
    private init(type: ValueType, value: Any) {
        self.type = type
        self.value = value
    }
    
    public var asBool: Bool {
        // Implicit downcasting
        switch type {
        case .int:
            return asInteger != 0
        case .float:
            return asFloat != 0
        case .double:
            return asDouble != 0
        default:
            return value as! Bool
        }
    }
    
    public var asInteger: Int {
        // Implicit upcasting
        if type == .bool {
            return asBool ? 1 : 0
        }
        return value as! Int
    }
    
    public var asFloat: Float {
        switch type {
        case .bool:
            return asBool ? 1.0 : 0
        case .int:
            return Float(asInteger)
        // Implicit down casting for double
        case .double:
            return Float(asDouble)
        default:
            return value as! Float
        }
    }
    
    public var asDouble: Double {
        // Implicit upcasting
        switch type {
        case .bool:
            return asBool ? 1.0 : 0
        case .int:
            return Double(asInteger)
        case .float:
            return Double(asFloat)
        default:
            return value as! Double
        }
    }
    
    public var asString: String {
        return String(describing: value)
    }
    
    public var asArray: ArrayValue {
        if type == .string {
            var stringArray: [Value] = []
            for character in asString {
                stringArray.append(Value(string: String(character)))
            }
            return ArrayValue(stringArray)
        }
        return value as! ArrayValue
    }
    
    internal var asCommand: CommandType {
        return value as! CommandType
    }
}

public extension Value {
    static let void = Value(type: .void, value: ())
}

extension Value: CustomStringConvertible {
    public var description: String {
        self.asString
    }
}

internal extension Value {
    
    // More strict equality used for test purposes. If you need to do equality checks for code, use the EqualOperation instead.
    static func == (lhs: Value, rhs: Value) -> Bool {
        switch lhs.type {
        case .bool:
            guard rhs.type == .bool else { return false }
            return lhs.asBool == rhs.asBool
        case .int:
            guard rhs.type == .int else { return false }
            return lhs.asInteger == rhs.asInteger
        case .float:
            guard rhs.type == .float else { return false }
            return lhs.asFloat == rhs.asFloat
        case .double:
            guard rhs.type == .double else { return false }
            return lhs.asDouble == rhs.asDouble
        case .string:
            guard rhs.type == .string else { return false }
            return lhs.asString == rhs.asString
        case .array:
            guard rhs.type == .array else { return false }
            return lhs.asArray == rhs.asArray
        case .void:
            return rhs.type == .void
        case .command:
            guard rhs.type == .command else { return false }
            return lhs.asCommand == rhs.asCommand
        }
    }
}
