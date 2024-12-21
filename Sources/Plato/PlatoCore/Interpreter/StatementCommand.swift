//
//  StatementCommand.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 06/02/24.
//

enum StatementCommand: String {
    case `break` = "Break"
    case `continue` = "Continue"
    case `return` = "Return"
    
    func getName() -> String {
        self.rawValue
    }
}
