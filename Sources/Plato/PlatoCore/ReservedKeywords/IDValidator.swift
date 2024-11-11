//
//  ReservedKeywordValidator.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 03/02/24.
//

struct IDValidator {
    public static func isValid(_ id: String) -> Bool {
        return ReservedKeywords.allCases.first(where: { $0.rawValue == id }) == nil
    }
}

