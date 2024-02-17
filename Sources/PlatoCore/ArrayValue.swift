//
//  ArrayValue.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 04/02/24.
//

import Foundation

/// Reference type array for values
public final class ArrayValue: Sequence {
    private var values: [Value]
    
    public init() {
        self.values = []
    }
    
    public init(_ values: [Value]) {
        self.values = values
    }
    
    public subscript(index: Int) -> Value {
        get {
            values[index]
        }
        set {
            values[index] = newValue
        }
    }
    
    public var count: Int {
        return values.count
    }
    
    public var startIndex: Int {
        return values.startIndex
    }
    
    public var endIndex: Int {
        values.endIndex
    }
    
    public func elementsEqual(_ other: ArrayValue, by areEquivalent: (Value, Value) throws -> Bool ) rethrows -> Bool {
        return try values.elementsEqual(other.values, by: areEquivalent)
    }
    
    public func append(_ newValue: Value) {
        values.append(newValue)
    }
    
    public func makeIterator() -> IndexingIterator<[Value]> {
        values.makeIterator()
    }
    
    public static func + (_ left: ArrayValue, right: ArrayValue) -> ArrayValue {
        ArrayValue(left.values + right.values)
    }
}

extension ArrayValue: CustomStringConvertible {
    public var description: String {
        return String(describing: values)
    }
}

internal extension ArrayValue {
    // More strict equality used for test purposes. If you need to do equality checks for code, use the EqualOperation instead.
    static func == (lhs: ArrayValue, rhs: ArrayValue) -> Bool {
        return lhs.values.elementsEqual(rhs.values, by: { $0 == $1 })
    }
}
