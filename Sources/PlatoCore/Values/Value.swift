//
//  Value.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 24/01/24.
//

public protocol Value: CustomStringConvertible {
    associatedtype T
    var type: ValueType { get }
    var value: T { get set }
}

extension Value {
    public var description: String {
        "Type: \(type), Value: \(value)"
    }
}
