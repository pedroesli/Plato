//
//  File.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 03/02/24.
//

import Foundation

enum BooleanError: Error, LocalizedError {
    case typeError(message: String)
    
    var errorDescription: String? {
        switch self {
        case .typeError(let message):
            return message
        }
    }
}
