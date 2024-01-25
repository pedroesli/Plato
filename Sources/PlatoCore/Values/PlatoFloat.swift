//
//  PlatoFloat.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 24/01/24.
//

public class PlatoFloat: Value {
    public let type: ValueType = .float
    public var value: Float
    
    public init(value: Float) {
        self.value = value
    }
}
