//
//  FloatFunc.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 15/02/24.
//

public struct FloatFunc: FunctionResultHandling {
    
    public static let name: String = "float"
    
    public static func handle(parameters: [CallParameter]) throws -> Value {
        guard !parameters.isEmpty else { throw NativeFunctionError.missingArgument(parameter: "value") }
        guard parameters.count == 1 else { throw NativeFunctionError.extraArgument }
        let value = parameters[0].value
        
        guard value.type.isInRange(of: .string) else { throw NativeFunctionError.noMatch }
        
        if value.type == .string {
            return Value(float: Float(value.asString) ?? 0)
        }
        return Value(float: value.asFloat)
    }
}
