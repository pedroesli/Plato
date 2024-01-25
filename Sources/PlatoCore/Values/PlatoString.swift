//
//  PlatoString.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 24/01/24.
//

public class PlatoString: Value {
    public let type: ValueType = .string
    public var value: String
    
    public init(value: String) {
        self.value = value
    }
}
