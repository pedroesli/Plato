//
//  File.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 19/03/24.
//

public struct DoubleFunc: FunctionResultHandling {
    
    public static let name: String = "double"
    
    public static func handle(parameters: [CallParameter]) throws -> Value {
        guard !parameters.isEmpty else { throw FunctionError.missingArgument(parameter: "value") }
        guard parameters.count == 1 else { throw FunctionError.extraArgument }
        let value = parameters[0].value
        
        guard value.type.isInRange(of: .string) else { throw FunctionError.noMatch }
        
        if value.type == .string {
            return Value(double: Double(value.asString) ?? 0)
        }
        return Value(double: value.asDouble)
    }
}
