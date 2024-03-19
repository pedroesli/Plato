//
//  MethodTest.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 19/03/24.
//

@testable import PlatoCore

protocol TestingMethod {
    func test(_ expressionResult: Value) -> Bool
    func makeErrorMessage(_ unexpectedValue: Value) -> String
}
