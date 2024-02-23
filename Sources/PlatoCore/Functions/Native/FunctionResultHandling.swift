//
//  FunctionHandling.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 14/02/24.
//

public protocol FunctionResultHandling {
    static var name: String { get }
    static func handle(parameters: [CallParameter]) throws -> Value
}