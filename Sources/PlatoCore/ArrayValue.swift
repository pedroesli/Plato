//
//  File.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 04/02/24.
//

import Foundation

public final class ArrayValue {
    private var values: [Value] = []
    
    public init(_ values: [Value]) {
        self.values = values
    }
    
    subscript(index: Int) -> Value {
        return values[index]
    }
    
    var count: Int {
        return values.count
    }
    
    func elementsEqual(_ other: ArrayValue, by areEquivalent: (Value, Value) throws -> Bool ) rethrows -> Bool {
        return try values.elementsEqual(other.values, by: areEquivalent)
    }
    
    public static func + (_ left: ArrayValue, right: ArrayValue) -> ArrayValue {
        ArrayValue(left.values + right.values)
    }
}
