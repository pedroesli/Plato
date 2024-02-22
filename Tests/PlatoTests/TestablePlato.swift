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
    
    func addExpectedValue(bool value: Bool, forLine line: Int) {
        interpreter.expectedValues[line] = Value(bool: value)
    }
    
    func addExpectedValue(int value: Int, forLine line: Int) {
        interpreter.expectedValues[line] = Value(int: value)
    }
    
    func addExpectedValue(float value: Float, forLine line: Int) {
        interpreter.expectedValues[line] = Value(float: value)
    }
    
    func addExpectedValue(string value: String, forLine line: Int) {
        interpreter.expectedValues[line] = Value(string: value)
    }
    
    func addExpectedValue(array values: [Value], forLine line: Int) {
        interpreter.expectedValues[line] = Value(array: ArrayValue(values))
    }
    
    private func handlePrint(line: Int, value: Value) {
        print("line: \(line): \(value)")
    }
}
