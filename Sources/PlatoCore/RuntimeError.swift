//
//  RuntimeError.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 26/01/24.
//

public struct RuntimeError: Error, CustomStringConvertible {
    public let reason: String
    public let badCode: String?
    public let line: Int
    public let column: Int
    
    /// Get the full description of the error
    public var description: String {
        return "Runtime Error in line \(line):\(column) \(badCode ?? ""): \(reason)"
    }
}
