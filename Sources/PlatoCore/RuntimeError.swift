//
//  RuntimeError.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 26/01/24.
//

public struct RuntimeError: Error, CustomStringConvertible {
    public var description: String
    
    public init(_ description: String) {
        self.description = description
    }
}
