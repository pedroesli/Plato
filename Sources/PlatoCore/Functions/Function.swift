//
//  Function.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 19/02/24.
//

import Foundation

public class Function {
    private let parameters: [Parameter]
    private let ctx: PlatoParser.FunctionDeclarationContext
    
    public var parametersCount: Int {
        return parameters.count
    }
    
    public init(parameters: [Parameter], ctx: PlatoParser.FunctionDeclarationContext) {
        self.parameters = parameters
        self.ctx = ctx
    }
    
    public func compareParameters(with call: [CallParameter]) -> Bool {
        return parameters.elementsEqual(call, by: { $0.compare(with: $1) })
    }
    
//    public func handle() throws -> Value? {
//        
//    }
}

extension Function: Hashable {
    public static func == (lhs: Function, rhs: Function) -> Bool {
        lhs.parameters == rhs.parameters
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(parameters)
    }
}
