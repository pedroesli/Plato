//
//  DefaultTypeFunctionHandler.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 23/02/24.
//

public struct DefaultTypeFunctionHandler: NativeFunctionHandling {
    
    public func handle(functionName: String, parameters: [CallParameter]) throws -> Value {
        switch functionName {
        case BoolFunc.name:
            return try BoolFunc.handle(parameters: parameters)
        case IntFunc.name:
            return try IntFunc.handle(parameters: parameters)
        case FloatFunc.name:
            return try FloatFunc.handle(parameters: parameters)
        case StringFunc.name:
            return try StringFunc.handle(parameters: parameters)
        case ArrayFunc.name:
            return try ArrayFunc.handle(parameters: parameters)
        default:
            throw NativeFunctionError.notFound(funcName: functionName)
        }
    }
}
