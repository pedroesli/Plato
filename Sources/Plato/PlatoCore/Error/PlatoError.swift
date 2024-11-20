//
//  RuntimeError.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 26/01/24.
//

public struct PlatoError: Error, CustomStringConvertible, VisitorReturnable {
    public let message: String
    public let badCode: String?
    public let line: Int
    public let column: Int
    
    init(message: String, badCode: String? = nil, line: Int, column: Int) {
        self.message = message
        self.badCode = badCode
        self.line = line
        self.column = column
    }
    
    /// Get the full description of the error
    public var description: String {
        if let badCode {
            return "Runtime Error in line \(line):\(column): \(message). Bad code: \(badCode)" 
        }
        return "Runtime Error in line \(line):\(column): \(message)"
    }
}
