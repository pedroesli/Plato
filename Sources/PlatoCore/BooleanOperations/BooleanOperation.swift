//
//  BooleanOperation.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 02/02/24.
//

protocol BooleanOperation {
    var left: Value { get }
    var right: Value { get }
    static var compatibleMatrix: [ValueType : [ValueType]] { get }
    
    func result() -> Value?
    func isCompatible() -> Bool
}

extension BooleanOperation {
    func isCompatible() -> Bool {
        return Self.compatibleMatrix[left.type]?.first(where: { $0 == right.type }) != nil
    }
}
