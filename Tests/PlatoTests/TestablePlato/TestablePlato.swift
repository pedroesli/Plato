//
//  TestablePlato.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 13/02/24.
//

import PlatoCore
import Antlr4

struct TestablePlato {
    
    private let interpreter = TestablePlatoInterpreter()
    
    init() {
        interpreter.setPrintHandler(handlePrint(printValue:))
    }
    
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
    
    /// Resets the interpreter by clearing the cache and errors.
    func reset() {
        interpreter.tests = [:]
        interpreter.reset()
    }
    
    /// Adds an expected value for a 'visitExpressionStatement' result at a line.
    /// Note: Lines begin a 1
    func addExpectedValue(_ value: Value, forLine line: Int) {
        interpreter.tests[line] = ExpectedTest(value: value)
    }
    
    func addExpectedValue(bool value: Bool, forLine line: Int) {
        interpreter.tests[line] = ExpectedTest(value: Value(bool: value))
    }
    
    func addExpectedValue(int value: Int, forLine line: Int) {
        interpreter.tests[line] = ExpectedTest(value: Value(int: value))
    }
    
    func addExpectedValue(float value: Float, forLine line: Int) {
        interpreter.tests[line] = ExpectedTest(value: Value(float: value))
    }
    
    func addExpectedValue(string value: String, forLine line: Int) {
        interpreter.tests[line] = ExpectedTest(value: Value(string: value))
    }
    
    func addExpectedValue(array values: [Value], forLine line: Int) {
        interpreter.tests[line] = ExpectedTest(value: Value(array: ArrayValue(values)))
    }
    
    func addExpectedValueInRange(_ range: ClosedRange<Int>, forLine line: Int) {
        interpreter.tests[line] = IntRangeTest(range: range)
    }
    
    func addExpectedValueInRange(_ range: ClosedRange<Float>, forLine line: Int) {
        interpreter.tests[line] = FloatRangeTest(range: range)
    }
    
    private func handlePrint(printValue: PrintValue) {
        print("line \(printValue.line)\t: \t\(printValue.formattedValue)", terminator: printValue.terminator)
    }
}
