//
//  Parameter.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 15/02/24.
//

struct Parameter: Equatable, Hashable {
    let id: String
    /// Indicates wether this parameter uses the explicit  'at' keyword  id
    let isIdExplicit: Bool
    let type: VariableType
    
    /// Checks wether this parameter is the same as the callers parameter
    func compare(with call: CallParameter) -> Bool {
        if isIdExplicit {
            guard let callId = call.id else { return false }
            return id == callId && type.isStrictCompatible(with: call.value.type)
        }
        return type.isStrictCompatible(with: call.value.type)
    }
}
