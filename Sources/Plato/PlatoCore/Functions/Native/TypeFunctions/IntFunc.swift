//
//  IntFunc.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 15/02/24.
//

struct IntFunc: FunctionResultHandling {
    
    static let name: String = "int"
    
    static func handle(parameters: [CallParameter]) throws -> Value {
        guard !parameters.isEmpty else { throw FunctionError.missingArgument(parameter: "value") }
        guard parameters.count == 1 else { throw FunctionError.extraArgument }
        let value = parameters[0].value
        guard value.type.isInRange(of: .string) else { throw FunctionError.noMatch }
        
        if value.type == .string {
            return Value(int: Int(value.asString) ?? 0)
        }
        return Value(int: Int(value.asFloat))
    }
}
