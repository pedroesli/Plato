//
//  ExpectedTest.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 19/03/24.
//

@testable import PlatoCore

struct ExpectedTest: TestingMethod {
    let value: Value
    
    func test(_ expressionResult: Value) -> Bool {
        return value == expressionResult
    }

    func makeErrorMessage(_ unexpectedValue: Value) -> String {
        return "Expected 'Value(\(value), \(value.type))' but got 'Value(\(unexpectedValue), \(unexpectedValue.type))'"
    }
}
