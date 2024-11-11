//
//  File.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 23/02/24.
//

struct DefaultPrintHandler {
    let printValue: PrintValue
    
    func handle() {
        print(printValue.formattedValue, terminator: printValue.terminator)
    }
}
