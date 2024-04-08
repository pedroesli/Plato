//
//  TestablePlato.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 13/02/24.
//

import PlatoCore
import Antlr4

struct TestablePlato {
    
    var config: PlatoConfiguration {
        set { interpreter.config = newValue }
        get { interpreter.config }
    }
    
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
        interpreter.config = PlatoConfiguration()
        interpreter.tests = [:]
        interpreter.reset()
    }
    
    /// Adds an expected value for a 'visitExpressionStatement' result at a line.
    /// Note: Lines begin at 1
    func addExpectedValue(_ value: Value, forLine line: Int) {
        interpreter.tests[line] = ExpectedTest(value: value)
    }
    
    func addExpectedValue(bool value: Bool, forLine line: Int) {
        self.addExpectedValue(Value(bool: value), forLine: line)
    }
    
    func addExpectedValue(int value: Int, forLine line: Int) {
        self.addExpectedValue(Value(int: value), forLine: line)
    }
    
    func addExpectedValue(float value: Float, forLine line: Int) {
        self.addExpectedValue(Value(float: value), forLine: line)
    }
    
    func addExpectedValue(double value: Double, forLine line: Int) {
        self.addExpectedValue(Value(double: value), forLine: line)
    }
    
    func addExpectedValue(string value: String, forLine line: Int) {
        self.addExpectedValue(Value(string: value), forLine: line)
    }
    
    func addExpectedValue(array values: [Value], forLine line: Int) {
        self.addExpectedValue(Value(array: ArrayValue(values)), forLine: line)
    }
    
    func addExpectedValue(rangeInt: ClosedRange<Int>, forLine line: Int) {
        interpreter.tests[line] = IntRangeTest(range: rangeInt)
    }
    
    func addExpectedValue(rangeFloat: ClosedRange<Float>, forLine line: Int) {
        interpreter.tests[line] = FloatRangeTest(range: rangeFloat)
    }
    
    func addExpectedValue(rangeDouble: ClosedRange<Double>, forLine line: Int) {
        interpreter.tests[line] = DoubleRangeTest(range: rangeDouble)
    }
    
    private func handlePrint(printValue: PrintValue) {
        print("line \(printValue.line)\t: \t\(printValue.formattedValue)", terminator: printValue.terminator)
    }
}
