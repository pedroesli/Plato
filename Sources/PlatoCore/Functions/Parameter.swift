//
//  Parameter.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 15/02/24.
//

public struct Parameter: Equatable, Hashable {
    public let id: String
    /// Indicates wether this parameter uses the explicit  'at' keyword  id
    public let isIdExplicit: Bool
    public let type: VariableType
    
    /// Checks wether this parameter is the same as the callers parameter
    public func compare(with call: CallParameter) -> Bool {
        if isIdExplicit {
            guard let callId = call.id else { return false }
            return id == callId && type.isCompatible(with: call.value.type)
        }
        return type.isCompatible(with: call.value.type)
    }
}
