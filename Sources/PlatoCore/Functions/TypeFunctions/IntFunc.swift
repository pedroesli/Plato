//
//  IntFunc.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 15/02/24.
//

public struct IntFunc: FunctionResultHandling {
    public static func handle(parameters: [Value]) throws -> Value {
        guard !parameters.isEmpty else { throw NativeFunctionError.missingArgument(parameter: "value") }
        guard parameters.count == 1 else { throw NativeFunctionError.extraArgument }
        let value = parameters[0]
        guard value.type.isInRange(of: .string) else { throw NativeFunctionError.noMatch }
        
        if value.type == .string {
            return Value(int: Int(value.asString) ?? 0)
        }
        return Value(int: Int(value.asFloat))
    }
}
