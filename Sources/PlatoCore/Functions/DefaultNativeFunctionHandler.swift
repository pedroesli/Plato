//
//  DefaultNativeFunctionHandler.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 14/02/24.
//

import Foundation

public struct DefaultNativeFunctionHandler: NativeFunctionHandling {
    
    public func handle(functionName: String, parameters: [CallParameter]) throws -> Value {
        switch functionName {
        case "bool":
            return try BoolFunc.handle(parameters: parameters)
        case "int":
            return try IntFunc.handle(parameters: parameters)
        case "float":
            return try FloatFunc.handle(parameters: parameters)
        case "string":
            return try StringFunc.handle(parameters: parameters)
        case "array":
            return try ArrayFunc.handle(parameters: parameters)
        default:
            throw NativeFunctionError.notFound(funcName: functionName)
        }
    }
}
