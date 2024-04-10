//
//  TestablePlato.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 13/02/24.
//

import Plato
import PlatoCore
import Antlr4

class TestablePlato {
    
    var config: PlatoConfiguration {
        set { interpreter.config = newValue }
        get { interpreter.config }
    }
    
    var readLineContinuation: PlatoContinuation {
        get { interpreter.readLineContinuation }
    }
    
    private let interpreter = TestablePlatoInterpreter()
    private let plato: Plato
    
    init() {
        self.plato = Plato(interpreter: interpreter)
        
        self.interpreter.config.setPrintHandler(self.handlePrint(printValue:))
    }
    
    func run(_ code: String) async throws {
        try await plato.run(code)
    }
    
    /// Resets the interpreter by clearing the cache and errors.
    func reset() {
        interpreter.config = PlatoConfiguration()
        interpreter.config.setPrintHandler(self.handlePrint(printValue:))
        interpreter.tests = [:]
        interpreter.reset()
    }
    
    func clearCache() {
        interpreter.clearCache()
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
