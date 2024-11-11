//
//  TestablePlatoInterpreter.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 13/02/24.
//


@testable import Plato

class TestablePlatoInterpreter: PlatoInterpreter {
    
    var tests: [Int : TestingMethod] = [:]
    
    override func visitExpressionStatement(_ ctx: PlatoParser.ExpressionStatementContext) -> Value? {
        guard let expression = ctx.expression(),
              let result = visit(expression),
              let line = ctx.start?.getLine(),
              result.type.isInRange(of: .array)
        else { return nil }
        
        if let test = tests[line] {
            guard test.test(result) else {
                return error(test.makeErrorMessage(result), at: ctx)
            }
        }
        
        handleExpressionStatementPrint(line: line, value: result)
        
        return Value.void
    }
}
