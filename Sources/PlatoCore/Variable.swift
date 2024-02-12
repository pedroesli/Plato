//
//  Variable.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 12/02/24.
//

public class Variable {
    public var type: VariableType
    public var value: Value
    
    public init(type: VariableType, value: Value) {
        self.type = type
        self.value = value
    }
}
