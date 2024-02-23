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
        guard let expression = ctx.expression(),
              let result = visit(expression),
              let line = ctx.start?.getLine(),
              result.type.isInRange(of: .array)
        else { return nil }
        
        if let expectedValue = expectedValues[line] {
            guard expectedValue == result else {
                return error("{Test Error} Expected 'Value(\(expectedValue), \(expectedValue.type))' but got 'Value(\(result), \(result.type))'", at: ctx)
            }
        }
        
        handleExpressionStatementPrint(line: line, value: result)
        
        return Value.void
    }
}
