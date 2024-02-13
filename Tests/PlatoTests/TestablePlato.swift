//
//  File.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 13/02/24.
//

import PlatoCore
import Antlr4

struct TestablePlato {
    
    private let interpreter = TestablePlatoInterpreter()
    
    func run(_ code: String) throws {
        let input = ANTLRInputStream(code)
        let lexer = PlatoLexer(input)
        let tokens = CommonTokenStream(lexer)
        let parser = try PlatoParser(tokens)
        parser.setErrorHandler(BailErrorStrategy())
        let tree = try parser.program()
        _ = interpreter.visit(tree)
        if let error = interpreter.error {
            throw error
        }
    }
    
    /// Adds an expected value for a 'visitExpressionStatement' result at a line.
    /// Note: Lines begin a 1
    func addExpectedValue(_ value: Value, forLine line: Int) {
        interpreter.expectedValues[line] = value
    }
}
