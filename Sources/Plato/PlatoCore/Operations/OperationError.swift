//
//  OperationError.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 04/02/24.
//

import Foundation

enum OperationError: Error, LocalizedError {
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
