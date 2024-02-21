//
//  FunctionScope.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 19/02/24.
//

public class FunctionScope {
    
    private var symbols: [String: FunctionPolymorphism]
    private var parent: FunctionScope?
    
    public init(parent: FunctionScope?) {
        self.symbols = [:]
        self.parent = parent
    }
    
    func createFunction(name: String, parameters: [Parameter], ctx: PlatoParser.FunctionDeclarationContext) {
        let newFunction = Function(parameters: parameters, ctx: ctx)
        guard let functionPoly = self.symbols[name] else {
            self.create(FunctionPolymorphism(adding: newFunction), forKey: name)
            return
        }
        functionPoly.addFunction(newFunction)
    }
    
    /// Creates a new value in this scope
    /// Note: Doesn't check if there is the same value in parents scopes. Use carefully!
    @discardableResult public func create(_ value: FunctionPolymorphism, forKey key: String) -> FunctionPolymorphism? {
        return symbols.updateValue(value, forKey: key)
    }
    
    func retrieveFunction(name: String, parameters: [CallParameter]) -> Function? {
        // If doesn't exist search on parent
        guard let functionPoly = symbols[name] else {
            return parent?.retrieveFunction(name: name, parameters: parameters)
        }
        // If doesn't have the function search on parent
        guard let function = functionPoly.retrieve(callParameters: parameters) else {
            return parent?.retrieveFunction(name: name, parameters: parameters)
        }
        return function
    }
}
