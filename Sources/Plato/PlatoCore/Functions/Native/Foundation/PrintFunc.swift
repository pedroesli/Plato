//
//  PrintFunc.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 23/02/24.
//

// Plato print function handler
struct PrintFunc {
    static let name = "print"
    
    let parameters: [CallParameter]
    var separator = " "
    var terminator = "\n"
    private var values: [Value] = []
    
    init(parameters: [CallParameter]) {
        self.parameters = parameters
    }
    
    mutating func getFormattedValue() throws -> String {
        if parameters.isEmpty {
            return "\n"
        }
        try splitParameters()
        
        var formattedValue = ""
        let count = values.count
        for index in 0..<count {
            formattedValue += values[index].asString
            if index < count - 1 {
                formattedValue += separator
            }
        }
        return formattedValue
    }
    
    private mutating func splitParameters() throws {
        for parameter in parameters {
            if parameter.id == "separator" {
                guard parameter.value.type == .string else {
                    throw FunctionError.typeError(parameterType: parameter.value.type, expectedType: .string)
                }
                separator = parameter.value.asString
                continue
            }
            if parameter.id == "terminator" {
                guard parameter.value.type == .string else {
                    throw FunctionError.typeError(parameterType: parameter.value.type, expectedType: .string)
                }
                terminator = parameter.value.asString
                if parameters.last?.id != parameter.id {
                    throw FunctionError.extraArgument
                }
                break
            }
            
            values.append(parameter.value)
        }
    }
}
