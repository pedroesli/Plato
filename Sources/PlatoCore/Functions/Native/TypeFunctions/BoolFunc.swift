//
//  BoolFunc.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 14/02/24.
//

public struct BoolFunc: FunctionResultHandling {
    
    public static let name: String = "bool"
    
    public static func handle(parameters: [CallParameter]) throws -> Value {
        guard !parameters.isEmpty else { throw FunctionError.missingArgument(parameter: "value") }
        guard parameters.count == 1 else { throw FunctionError.extraArgument }
        let value = parameters[0].value
        guard value.type.isInRange(of: .string) else { throw FunctionError.noMatch }
        
        if value.type == .string {
            if value.asString == "true" {
                return Value(bool: true)
            }
            if value.asString == "false" {
                return Value(bool: false)
            }
            
            return Value(bool: Int(value.asString) ?? 0 == 1)
        }
        return Value(bool: value.asBool)
    }
}
