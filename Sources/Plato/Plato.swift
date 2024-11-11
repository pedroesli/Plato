import Antlr4
import Foundation

/// The Plato class that allows you to configure the interpreter and execute Plato code.
///
/// ```
/// let code = """
///     hello = "Hello, World!"
///     hello
/// """
/// let plato = Plato()
/// try await plato.run(code)
/// ```
public class Plato {
    
    /// Configure Plato interpreter.
    public var configuration: PlatoConfiguration {
        interpreter.configuration
    }
    
    private let interpreter: PlatoInterpreter
    
    /// Initiate a new Plato executer.
    public init(configuration: PlatoConfiguration = PlatoConfiguration()) {
        self.interpreter = PlatoInterpreter(configuration: configuration)
    }
    
    public func setPrintFunctionHandler(_ handler: ((_ printValue: PrintValue) -> Void)?) {
        interpreter.handlers.printFunctionHandler = handler
    }
    
    /// Executes the provided Plato code asynchronously with an optional completion closure for when the code is done executing.
//    public func run(_ code: String, qos: DispatchQoS.QoSClass = .default, completion: ((Error?) -> Void)?) {
//        guard !code.isEmpty else { return }
//        
//        DispatchQueue.global(qos: qos).async {
//            do {
//                let input = ANTLRInputStream(code)
//                let lexer = PlatoLexer(input)
//                let tokens = CommonTokenStream(lexer)
//                let parser = try PlatoParser(tokens)
//                parser.setErrorHandler(BailErrorStrategy())
//                let tree = try parser.program()
//                
//                _ = self.interpreter.visit(tree)
//                if let error = self.interpreter.error {
//                    throw error
//                }
//                
//                self.interpreter.reset()
//                completion?(nil)
//            } catch {
//                completion?(error)
//            }
//        }
//    }
//    
//    /// Executes the provided Plato code asynchronously.
//    public func run(_ code: String, qos: DispatchQoS.QoSClass = .default) async throws {
//        return try await withCheckedThrowingContinuation { continuation in
//            run(code, qos: qos) { error in
//                if let error = error {
//                    continuation.resume(throwing: error)
//                    return
//                }
//                continuation.resume()
//            }
//        }
//    }
    
    /// Halts the interpreter from executing and resets.
    public func halt(_ completion: (() -> Void)? = nil) {
        interpreter.halt(completion)
    }
    
    /// Halts the interpreter from executing and resets.
    public func halt() async {
        return await withCheckedContinuation { continuation in
            interpreter.halt(continuation.resume)
        }
    }
}
