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
    
    public init(int: Int) {
        self.type = .int
        self.value = int
    }
    
    public init(float: Float) {
        self.type = .float
        self.value = float
    }
    
    public init(bool: Bool) {
        self.type = .boolean
        self.value = bool
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
    
    public var asInteger: Int {
        // Implicit upcasting
        if type == .boolean {
            return (value as! Bool) ? 1 : 0
        }
        return value as! Int
    }
    
    public var asFloat: Float {
        // Implicit upcasting
        switch type {
        case .boolean:
            return (value as! Bool) ? 1.0 : 0
        case .int:
            return Float(value as! Int)
        default:
            return value as! Float
        }
    }
    
    public var asBool: Bool {
        switch type {
        case .int:
            return Bool(value as! Int != 0)
        case .float:
            return Bool(value as! Float != 0)
        default:
            return value as! Bool
        }
    }
    
    public var asString: String {
        return String(describing: value)
    }
    
    public var asArray: ArrayValue {
        if type == .string {
            var stringArray: [Value] = []
            for character in value as! String {
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
        case .boolean:
            guard rhs.type == .boolean else { return false }
            return lhs.asBool == rhs.asBool
        case .int:
            guard rhs.type == .int else { return false }
            return lhs.asInteger == rhs.asInteger
        case .float:
            guard rhs.type == .float else { return false }
            return lhs.asFloat == rhs.asFloat
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
