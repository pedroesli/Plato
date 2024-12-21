//
//  RuntimeError.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 26/01/24.
//

import Antlr4

public struct PlatoError: Error, CustomStringConvertible {
    public let message: String
    public let badCode: String?
    public let line: Int
    public let column: Int
    
    init(message: String, badCode: String? = nil, line: Int, column: Int) {
        self.message = message
        self.badCode = badCode
        self.line = line
        self.column = column
    }
    
    /// Get the full description of the error
    public var description: String {
        if let badCode {
            return "Runtime Error in line \(line):\(column): \(message). Bad code: \(badCode)"
        }
        return "Runtime Error in line \(line):\(column): \(message)"
    }
}

extension PlatoError {
    static func commonError(_ message: String, at ctx: ParserRuleContext) -> PlatoError {
        let line = ctx.getStart()?.getLine() ?? 0
        let column = ctx.getStart()?.getCharPositionInLine() ?? 0
        return PlatoError(
            message: message,
            badCode: ctx.getText(),
            line: line,
            column: column
        )
    }
    
    static func unexpectedError(_ message: String? = nil, at ctx: ParserRuleContext) -> PlatoError {
        return commonError("Unexpected error! \(message ?? "")", at: ctx)
    }
}
