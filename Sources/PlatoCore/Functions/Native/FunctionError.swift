//
//  NativeFunctionError.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 14/02/24.
//

import Foundation

public enum FunctionError: Error, LocalizedError {
    case notFound(funcName: String)
    case missingArgument(parameter: String)
    case typeError(parameterType: ValueType, expectedType: VariableType)
    case noMatch
    case extraArgument

    public var errorDescription: String? {
        switch self {
        case .notFound(let funcName):
            return "Cannot find function '\(funcName)'"
        case .missingArgument(let parameter):
            return "Missing argument for parameter '\(parameter)' in call"
        case .typeError(let parameterType, let expectedType):
            return "Cannot convert value of type '\(parameterType)' to expected argument type '\(expectedType)'"
        case .noMatch:
            return "No exact matches in call to initializer"
        case .extraArgument:
            return "Extra argument in call"
        }
    }
}
