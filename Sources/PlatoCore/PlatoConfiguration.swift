//
//  PlatoConfiguration.swift
//  
//
//  Created by Pedro Ésli Vieira do Nascimento on 08/04/24.
//

public class PlatoConfiguration {
    /// Set how loops should run
    let loop: Looping
    
    /// Configure plato language.
    ///
    /// - Parameters:
    ///   - loop: The amount of times a plato loop can occur.
    public init(loop: Looping = .indefinitely) {
        self.loop = loop
    }
}

extension PlatoConfiguration {
    public enum Looping {
        /// Run the loop indefinitely.
        case indefinitely
        /// Limit the run loop until the specified value (inclusive).
        case max(Int)
        
        var value: Int? {
            switch self {
            case .indefinitely:
                return nil
            case .max(let max):
                return max
            }
        }
    }
    
    // TODO: See if this should be used
//    public enum ReadLine {
//        /// Use the default readLine() method to get user input.
//        case `default`
//        /// Use the continuation method to return a user input.
//        case continuation
//    }
}
