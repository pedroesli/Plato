//
//  CallParameter.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 16/02/24.
//

public struct CallParameter {
    public let id: String?
    public let value: Value
    
    init(id: String? = nil, value: Value) {
        self.id = id
        self.value = value
    }
}
