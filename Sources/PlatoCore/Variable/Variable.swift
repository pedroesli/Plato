//
//  Variable.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 12/02/24.
//

public class Variable {
    public var type: VariableType
    public private(set) var value: Value = .void
    
    public init(type: VariableType, value: Value) {
        self.type = type
        assign(value)
    }
    
    public func canAssign(value: Value) -> Bool {
        return type.isCompatible(with: value.type)
    }
    
    /// Assigns the value to the appropriate type of the variable.
    /// Note: Check if can assign first using the 'canAssign' method.
    public func assign(_ value: Value) {
        switch type {
        case .any, .number, .string, .array:
            self.value = value
        case .bool:
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
