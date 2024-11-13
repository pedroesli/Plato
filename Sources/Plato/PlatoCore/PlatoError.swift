//
//  RuntimeError.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 26/01/24.
//

struct PlatoError: Error, CustomStringConvertible {
    let message: String
    let badCode: String?
    let line: Int
    let column: Int
    
    init(message: String, badCode: String? = nil, line: Int, column: Int) {
        self.message = message
        self.badCode = badCode
        self.line = line
        self.column = column
    }
    
    /// Get the full description of the error
    var description: String {
        return "Runtime Error in line \(line):\(column): \(message)"
    }
}
