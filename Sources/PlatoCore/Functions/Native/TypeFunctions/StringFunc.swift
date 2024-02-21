//
//  StringFunc.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 15/02/24.
//

public struct StringFunc: FunctionResultHandling {
    
    public static let name: String = "string"
    
    public static func handle(parameters: [CallParameter]) throws -> Value {
        guard !parameters.isEmpty else { throw NativeFunctionError.missingArgument(parameter: "value") }
        guard parameters.count == 1 else { throw NativeFunctionError.extraArgument }
        let value = parameters[0].value
        
        return Value(string: value.asString)
    }
}
