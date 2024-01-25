//
//  PlatoBoolean.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 24/01/24.
//

public class PlatoBoolean: Value {
    public let type: ValueType = .boolean
    public var value: Bool
    
    public init(value: Bool) {
        self.value = value
    }
}
