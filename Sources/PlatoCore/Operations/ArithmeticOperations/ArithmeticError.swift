//
//  ArithmeticError.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 03/02/24.
//

import Foundation

enum ArithmeticError: Error, LocalizedError {
    case typeError(message: String)
    case zeroDivisionError
    
    var errorDescription: String? {
        switch self {
        case .typeError(let message):
            return message
        case .zeroDivisionError:
            return "Division by zero"
        }
    }
}
