//
//  ReservedKeywordValidator.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 03/02/24.
//

struct IDValidator {
    enum ReservedKeywords: String, CaseIterable {
        case elseKey        = "else"
        case whileKey       = "while"
        case forKey         = "for"
        case inKey          = "in"
        case fromKey        = "from"
        case toKey          = "to"
        case byKey          = "by"
        case funcKey        = "func"
        case andKey         = "and"
        case orKey          = "or"
        case trueKey        = "true"
        case falseKey       = "false"
        case returnKey      = "return"
        case breakKey       = "break"
        case continueKey    = "continue"
    }
    
    static func isValid(_ id: String) -> Bool {
        return ReservedKeywords.allCases.first(where: { $0.rawValue == id }) == nil
    }
}

