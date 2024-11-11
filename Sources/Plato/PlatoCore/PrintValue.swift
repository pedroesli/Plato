//
//  PrintValue.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 22/02/24.
//

public struct PrintValue {
    /// The line in which print is being called
    public let line: Int
    /// The raw parameters extracted from the print function or single value if from an expression statement
    public let rawParameters: [CallParameter]
    /// The formatted value of the raw parameters handled by Plato
    public let formattedValue: String
    /// The terminator string, default is '\n'. Not appended to formattedValue.
    public let terminator: String
    /// True if print is being called from a 'print()' function, otherwise false if it's from a expression statement
    public let isFunction: Bool
}
