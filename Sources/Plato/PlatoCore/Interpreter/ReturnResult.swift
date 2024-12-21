//
//  ReturnResult.swift
//  Plato
//
//  Created by Pedro Ésli Vieira do Nascimento on 21/11/24.
//

import Antlr4

enum ReturnResult {
    case value(Value)
    case command(StatementCommand)
    case interpreterCommand(InterpreterCommand)
    case error(PlatoError)
}

extension ReturnResult {
    static func error(_ message: String, at ctx: ParserRuleContext) -> ReturnResult {
        .error(.commonError("Index out of range", at: ctx))
    }
    
    static func unexpectedError(_ message: String? = nil, at ctx: ParserRuleContext) -> ReturnResult {
        return .error(.unexpectedError(message, at: ctx))
    }
}
