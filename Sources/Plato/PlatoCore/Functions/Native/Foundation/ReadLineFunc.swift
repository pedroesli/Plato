//
//  ReadLineFunc.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 09/04/24.
//

struct ReadLineFunc {
    static let name = "readLine"
    
    let parameters: [CallParameter]
    
    func handle() throws -> Value {
        guard parameters.isEmpty else { throw FunctionError.extraArgument }
        let result = readLine() ?? ""
        return Value(string: result)
    }
}
