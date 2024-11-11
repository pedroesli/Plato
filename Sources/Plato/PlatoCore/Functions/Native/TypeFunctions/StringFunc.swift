//
//  StringFunc.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 15/02/24.
//

struct StringFunc: FunctionResultHandling {
    
    static let name: String = "string"
    
    static func handle(parameters: [CallParameter]) throws -> Value {
        guard !parameters.isEmpty else { throw FunctionError.missingArgument(parameter: "value") }
        guard parameters.count == 1 else { throw FunctionError.extraArgument }
        let value = parameters[0].value
        
        return Value(string: value.asString)
    }
}
