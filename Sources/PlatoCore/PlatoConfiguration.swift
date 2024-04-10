//
//  PlatoConfiguration.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 08/04/24.
//

public struct PlatoConfiguration {
    public typealias PrintHandler = (_ printValue: PrintValue) -> Void
    
    /// Set how loops should run
    public var loop: Looping = .indefinitely
    public var readLine: ReadLine = .default
    internal var printHandler: PrintHandler?
    
    public init() { }
    
    public init(printHandler: PrintHandler?) {
        self.printHandler = printHandler
    }
    
    /// Set a handler to handle custom printing of values.
    public mutating func setPrintHandler(_ handler: @escaping PrintHandler) {
        self.printHandler = handler
    }
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
    
    public enum ReadLine {
        /// Use the default readLine() method to get user input.
        case `default`
        /// Use the continuation method to return a user input.
        case continuation
    }
}
