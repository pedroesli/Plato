//
//  Log10Func.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 19/03/24.
//

import Darwin

struct Log10Func: FunctionResultHandling {
    static let name: String = "log10"
    
    static func handle(parameters: [CallParameter]) throws -> Value {
        guard !parameters.isEmpty else { throw FunctionError.missingArgument(parameter: "x") }
        guard parameters.count == 1 else { throw FunctionError.extraArgument }
        
        let x = parameters[0].value
        
        guard x.type.isNumber else { throw FunctionError.typeError(parameterType: x.type, expectedType: .number) }
        
        if x.type == .float {
            return Value(float: log10f(x.asFloat))
        }
        return Value(double: log10(x.asDouble))
    }
}
