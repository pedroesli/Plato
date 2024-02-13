//
//  Variable.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 12/02/24.
//

public class Variable {
    public var type: VariableType
    public private(set) var value: Value
    
    public init(type: VariableType, value: Value) {
        self.type = type
        self.value = value
    }
    
    public func canAssign(value: Value) -> Bool {
        switch type {
        case .any:
            value.type.isInRange(of: .array)
        case .boolean:
            value.type.isNumber
        case .int:
            value.type == .int || value.type == .boolean
        case .float:
            value.type.isNumber
        case .number:
            value.type.isNumber
        case .string:
            value.type == .string
        case .array:
            value.type == .array
        }
    }
    
    /// Assigns the value to the appropriate type of the variable.
    /// Note: Check if can assign first using the 'canAssign' method.
    public func assign(_ value: Value) {
        switch type {
        case .any, .number, .string, .array:
            self.value = value
        case .boolean:
            guard value.type == .boolean else {
                self.value = Value(bool: value.asBool)
                return
            }
            self.value = value
        case .int:
            guard value.type == .int else {
                self.value = Value(int: value.asInteger)
                return
            }
            self.value = value
        case .float:
            guard value.type == .float else {
                self.value = Value(float: value.asFloat)
                return
            }
            self.value = value
        }
    }
}
