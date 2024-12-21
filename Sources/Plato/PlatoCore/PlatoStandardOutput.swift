//
//  PlatoStandardOutput.swift
//  Plato
//
//  Created by Pedro Ésli Vieira do Nascimento on 09/11/24.
//

class PlatoStandardOutput {
    var printFunctionHandler: ((_ printValue: PrintValue) -> Void)?
    
    /// Use this method to handle how to print the values
    func print(_ printValue: PrintValue) {
        if let userPrintFunctionHandler = printFunctionHandler {
            userPrintFunctionHandler(printValue)
            return
        }
        
        DefaultPrintHandler(printValue: printValue).handle()
    }
}
