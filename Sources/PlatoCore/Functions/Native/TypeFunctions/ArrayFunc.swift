//
//  ArrayFunc.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 15/02/24.
//

public struct ArrayFunc: FunctionResultHandling {
    
    public static let name: String = "array"
    
    public static func handle(parameters: [CallParameter]) throws -> Value {
        guard !parameters.isEmpty else { throw FunctionError.missingArgument(parameter: "values") }
        if let result = try repeatingValue(parameters){
            return result
        }
        return Value(array: ArrayValue(parameters.map({ $0.value })))
    }
    
    static func repeatingValue(_ parameters: [CallParameter]) throws -> Value? {
        guard parameters.count == 2,
              parameters[0].id == "repeating",
              parameters[1].id == "count"
        else { return nil }
        
        guard parameters[1].value.type.isInRange(of: .int) else {
            throw FunctionError.typeError(parameterType: parameters[1].value.type, expectedType: .int)
        }
        
        return Value(array: ArrayValue(Array(repeating: parameters[0].value, count: parameters[1].value.asInteger)))
    }
}
