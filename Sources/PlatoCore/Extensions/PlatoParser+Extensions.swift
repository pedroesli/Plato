//
//  PlatoParser+Extensions.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 01/02/24.
//

extension PlatoParser.Tokens {
    static func == (left: Int, right: PlatoParser.Tokens) -> Bool {
        return left == right.rawValue
    }
}
