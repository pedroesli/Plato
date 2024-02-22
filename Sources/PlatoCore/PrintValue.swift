//
//  PrintValue.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 22/02/24.
//

public struct PrintValue {
    /// The line in which print is being called
    public let line: Int
    /// The value meant to be printed
    public let value: Value
    /// True if print is being called from a 'print()' function, otherwise false if it's from a expression statement
    public let isFunction: Bool
}
