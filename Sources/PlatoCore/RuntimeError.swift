//
//  RuntimeError.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 26/01/24.
//

public struct RuntimeError: Error, CustomStringConvertible {
    public let description: String
    public let line: Int
    public let column: Int
    
    public init(_ message: String, line: Int, column: Int) {
        self.description = message
        self.line = line
        self.column = column
    }
}
