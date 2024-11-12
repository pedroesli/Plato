//
//  ReservedKeywordValidator.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 03/02/24.
//

struct ReservedKeywordValidator {
    let keyword: String
    
    func isReserved() -> Bool {
        return ReservedKeywords(rawValue: keyword) != nil
    }
}

