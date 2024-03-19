//
//  DefaultNativeFunctionHandler.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 14/02/24.
//

public struct DefaultNativeFunctionHandler: NativeFunctionHandling {
    
    public func handle(functionName: String, parameters: [CallParameter]) throws -> Value {
        switch functionName {
        // Type
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
        // Foundation
        case RandomFunc.name:
            return try RandomFunc.handle(parameters: parameters)
        // Math
        case LogFunc.name:
            return try LogFunc.handle(parameters: parameters)
        case Log2Func.name:
            return try Log2Func.handle(parameters: parameters)
        case PowFunc.name:
            return try PowFunc.handle(parameters: parameters)
        case SqrtFunc.name:
            return try SqrtFunc.handle(parameters: parameters)
            // Sin
        case SinFunc.name:
            return try SinFunc.handle(parameters: parameters)
        case SinhFunc.name:
            return try SinhFunc.handle(parameters: parameters)
        case AsinFunc.name:
            return try AsinFunc.handle(parameters: parameters)
        case AsinhFunc.name:
            return try AsinhFunc.handle(parameters: parameters)
            // Cos
        case CosFunc.name:
            return try CosFunc.handle(parameters: parameters)
        case CoshFunc.name:
            return try CoshFunc.handle(parameters: parameters)
        case AcosFunc.name:
            return try AcosFunc.handle(parameters: parameters)
        case AcoshFunc.name:
            return try AcoshFunc.handle(parameters: parameters)
            // Tan
        case TanFunc.name:
            return try TanFunc.handle(parameters: parameters)
        case TanhFunc.name:
            return try TanhFunc.handle(parameters: parameters)
        case AtanFunc.name:
            return try AtanFunc.handle(parameters: parameters)
        case AtanhFunc.name:
            return try AtanhFunc.handle(parameters: parameters)
        default:
            throw FunctionError.notFound(funcName: functionName)
        }
    }
}
