//
//  ReservedKeywords.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 19/03/24.
//

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
    case notKey         = "not"
    case trueKey        = "true"
    case falseKey       = "false"
    case returnKey      = "return"
    case breakKey       = "break"
    case continueKey    = "continue"
    case atKey          = "at"
    
    func getKeyword() -> String {
        self.rawValue
    }
}
