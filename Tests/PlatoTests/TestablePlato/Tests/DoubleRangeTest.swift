//
//  DoubleRangeTest.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 19/03/24.
//

@testable import PlatoCore

struct DoubleRangeTest: TestingMethod {
    
    let range: ClosedRange<Double>
    
    func test(_ expressionResult: Value) -> Bool {
        guard expressionResult.type == .double else {
            fatalError("Range test failed. Reason: unsupported operation for \(expressionResult.type) type")
        }
        return range.contains(expressionResult.asDouble)
    }
    
    func makeErrorMessage(_ unexpectedValue: Value) -> String {
        return "Result of 'Value(\(unexpectedValue), \(unexpectedValue.type))' is not within the range of \(range)"
    }
}
