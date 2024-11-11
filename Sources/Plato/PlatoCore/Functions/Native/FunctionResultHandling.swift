//
//  FunctionHandling.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 14/02/24.
//

protocol FunctionResultHandling {
    static var name: String { get }
    static func handle(parameters: [CallParameter]) throws -> Value
}

extension FunctionResultHandling {
    static func highestOrder(_ left: Value, _ right: Value) -> ValueType {
        return left.type.isHigherOrder(than: right.type) ? left.type : right.type
    }
}
