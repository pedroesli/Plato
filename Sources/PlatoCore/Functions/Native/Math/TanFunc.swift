//
//  TanFunc.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 18/03/24.
//

import Darwin

public struct TanFunc: FunctionResultHandling {
    public static let name: String = "tan"
    
    public static func handle(parameters: [CallParameter]) throws -> Value {
        guard !parameters.isEmpty else { throw FunctionError.missingArgument(parameter: "x") }
        guard parameters.count == 1 else { throw FunctionError.extraArgument }
        
        let x = parameters[0].value
        
        guard x.type.isNumber else { throw FunctionError.typeError(parameterType: x.type, expectedType: .number) }
        
        if x.type == .float {
            return Value(float: tanf(x.asFloat))
        }
        return Value(double: tan(x.asDouble))
    }
}
