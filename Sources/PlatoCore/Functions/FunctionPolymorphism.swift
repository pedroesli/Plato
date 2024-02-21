//
//  FunctionPolymorphism.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 19/02/24.
//

import Foundation

/// Function Polymorphism
public class FunctionPolymorphism {
    /// A dictionary of the same functions separated by number of parameters
    private var functionDictionary: [Int: Set<Function>] = [:]
    
    public init(adding function: Function) {
        self.addFunction(function)
    }
    
    public func addFunction(_ function: Function) {
        let key = function.parametersCount
        guard functionDictionary[key] != nil else {
            functionDictionary[key] = [function]
            return
        }
        functionDictionary[key]?.insert(function)
    }
    
    func retrieve(callParameters: [CallParameter]) -> Function? {
        let key = callParameters.count
        return functionDictionary[key]?.first(where: { $0.compareParameters(with: callParameters) })
    }
}
