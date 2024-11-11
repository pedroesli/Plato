//
//  NativeFunctionHandling.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 14/02/24.
//

protocol NativeFunctionHandling {
    func handle(functionName: String, parameters: [CallParameter]) throws -> Value
}
