//
//  ReservedKeywordValidator.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 03/02/24.
//

struct ReservedKeywordValidator {
    let keyword: String
    
    func isValid() -> Bool {
        return ReservedKeywords.allCases.first(where: { $0.getKeyword() == keyword }) == nil
    }
}

