//
//  File.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 15/02/24.
//

public struct ArrayFunc: FunctionResultHandling {
    
    public static let name: String = "array"
    
    public static func handle(parameters: [CallParameter]) throws -> Value {
        guard !parameters.isEmpty else { throw NativeFunctionError.missingArgument(parameter: "values") }
//        Array(repeating: <#T##Element#>, count: <#T##Int#>)
        return Value(array: ArrayValue(parameters.map({ $0.value })))
    }
}
