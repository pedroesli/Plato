//
//  InterpreterReturnValue.swift
//  Plato
//
//  Created by Pedro Ésli Vieira do Nascimento on 21/11/24.
//

enum InterpreterReturnValue {
    case value(Value)
    case command(StatementCommand)
    case error(PlatoError)
}
