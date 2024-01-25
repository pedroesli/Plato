//
//  PlatoInteger.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 24/01/24.
//

public class PlatoInteger: Value {
    public let type: ValueType = .integer
    public var value: Int
    
    public init(value: Int) {
        self.value = value
    }
}
