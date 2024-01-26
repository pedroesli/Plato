//
//  Value.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 24/01/24.
//

public final class Value {
    public let type: ValueType
    private var value: Any
    
    public init(int: Int) {
        self.type = .integer
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
    
    public init(array: [Value]) {
        self.type = .array
        self.value = array
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
        if type == .integer {
            return Float(value as! Int)
        } else if type == .boolean {
            return (value as! Bool) ? 1.0 : 0
        }
        return value as! Float
    }
    
    public var asBool: Bool {
        return value as! Bool
    }
    
    public var asString: String {
        return String(describing: value)
    }
    
    public var asArray: [Value] {
        return value as! [Value]
    }
}

extension Value {
    public static let void = Value(type: .void, value: ())
}

extension Value: CustomStringConvertible {
    public var description: String {
        self.asString
    }
}
