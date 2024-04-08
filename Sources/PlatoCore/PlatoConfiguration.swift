//
//  File.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 08/04/24.
//

import Foundation

public struct PlatoConfiguration {
    public typealias PrintHandler = (_ printValue: PrintValue) -> Void
    
    /// Set how loops should run
    public var loop: Looping = .indefinitely
    /// Set a handler to handle custom printing of values.
    public var printHandler: PrintHandler =  DefaultPrintHandler.handle(printValue:)
    
    public init() { }
}

extension PlatoConfiguration {
    public enum Looping {
        /// Run the loop indefinitely.
        case indefinitely
        /// Limit the run loop until the specified value (inclusive).
        case max(Int)
        
        internal var value: Int? {
            switch self {
            case .indefinitely:
                return nil
            case .max(let max):
                return max
            }
        }
    }
}
