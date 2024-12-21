//
//  TestablePlatoInterpreter.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 13/02/24.
//


@testable import Plato

class TestablePlatoInterpreter: PlatoInterpreter {
    
    var tests: [Int : TestingMethod] = [:]
    
    override func visitExpressionStatement(_ ctx: PlatoParser.ExpressionStatementContext) -> ReturnResult? {
        guard let expression = ctx.expression() else {
            return .unexpectedError("Expression returned nil", at: ctx)
        }
        
        let result = visit(expression)
        
        switch result {
        case .value(let value):
            let line = ctx.getStart()?.getLine() ?? 0
            
            if let test = tests[line] {
                guard test.test(value) else {
                    return .error(test.makeErrorMessage(value), at: ctx)
                }
            }
            
            standardOutput.print(PrintValue(
                line: line,
                rawParameters: [CallParameter(value: value)],
                formattedValue: value.asString,
                terminator: "\n",
                isFunction: false
            ))
            return .value(.void)
        default:
            return result
        }
    }
}
