//
//  File.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 23/02/24.
//

public struct DefaultPrintHandler {
    static func handle(printValue: PrintValue) {
        print(printValue.formattedValue, terminator: printValue.terminator)
    }
}
