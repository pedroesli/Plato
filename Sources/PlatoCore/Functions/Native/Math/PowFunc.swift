//
//  PowFunc.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 18/03/24.
//

import Foundation

public struct PowFunc: FunctionResultHandling {
    public static var name: String = "pow"
    
    public static func handle(parameters: [CallParameter]) throws -> Value {
        guard !parameters.isEmpty else { throw FunctionError.missingArgument(parameter: "x") }
        guard parameters.count == 1 else { throw FunctionError.missingArgument(parameter: "y") }
        guard parameters.count == 2 else { throw FunctionError.extraArgument }
        
        let x = parameters[0].value
        let y = parameters[1].value
        
        guard x.type.isNumber else { throw FunctionError.typeError(parameterType: x.type, expectedType: .number) }
        guard y.type.isNumber else { throw FunctionError.typeError(parameterType: y.type, expectedType: .number) }
        
        return try ExponentOperation(x, y).result()
    }
}
