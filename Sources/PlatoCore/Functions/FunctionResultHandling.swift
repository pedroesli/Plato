//
//  FunctionHandling.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 14/02/24.
//

public protocol FunctionResultHandling {
    static func handle(parameters: [Value]) throws -> Value
}
