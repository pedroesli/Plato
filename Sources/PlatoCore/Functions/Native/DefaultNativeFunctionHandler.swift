//
//  DefaultNativeFunctionHandler.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 14/02/24.
//

public struct DefaultNativeFunctionHandler: NativeFunctionHandling {
    
    public func handle(functionName: String, parameters: [CallParameter]) throws -> Value {
        switch functionName {
        default:
            throw NativeFunctionError.notFound(funcName: functionName)
        }
    }
}
