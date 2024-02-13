//
//  TestablePlatoInterpreter.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 13/02/24.
//


@testable import PlatoCore

class TestablePlatoInterpreter: PlatoInterpreter {
    
    var expectedValues: [Int : Value] = [:]
    
    override func visitExpressionStatement(_ ctx: PlatoParser.ExpressionStatementContext) -> Value? {
        guard let expression = ctx.expression(), let result = visit(expression) else { return nil }
        
        if let line = ctx.start?.getLine(), let expectedValue = expectedValues[line] {
            guard expectedValue == result else {
                return error("{Test Error} Expected 'Value(\(expectedValue), \(expectedValue.type))' but got 'Value(\(result), \(result.type))'", at: ctx)
            }
        }
        
        print(result)
        
        return Value.void
    }
}
