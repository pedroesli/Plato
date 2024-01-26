//
//  Value.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 24/01/24.
//

public class Value {
    public let type: ValueType
    private var value: Any
    
    public init(value: Int) {
        self.type = .integer
        self.value = value
    }
    
    public init(value: Float) {
        self.type = .float
        self.value = value
    }
    
    public init(value: Bool) {
        self.type = .boolean
        self.value = value
    }
    
    public init(value: String) {
        self.type = .string
        self.value = value
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
        return value as! String
    }
}

extension Value {
    public static let void = Value(type: .void, value: ())
}

extension Value: CustomStringConvertible {
    public var description: String {
        "Type: \(type), Value: \(value)"
    }
}
