import PlatoCore
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
/// try plato.run(code)
/// ```
public class Plato {
    
    /// Configure Plato interpreter.
    public var config: PlatoConfiguration {
        set { interpreter.config = newValue }
        get { interpreter.config }
    }
    
    public var readLineContinuation: PlatoContinuation {
        get { interpreter.readLineContinuation }
    }
    
    private let interpreter: PlatoInterpreter
    
    /// Initiate a new Plato executer with the default interpreter.
    public init() {
        self.interpreter = PlatoInterpreter()
    }
    
    /// Initiate a new Plato executer with a custom interpreter.
    public init(interpreter: PlatoInterpreter) {
        self.interpreter = interpreter
    }
    
    /// Executes the provided Plato code asynchronously with an optional completion closure for when the code is done executing.
    public func run(_ code: String, qos: DispatchQoS.QoSClass = .default, completion: ((Error?) -> Void)?) {
        guard !code.isEmpty else { return }
        
        DispatchQueue.global(qos: qos).async {
            do {
                let input = ANTLRInputStream(code)
                let lexer = PlatoLexer(input)
                let tokens = CommonTokenStream(lexer)
                let parser = try PlatoParser(tokens)
                parser.setErrorHandler(BailErrorStrategy())
                let tree = try parser.program()
                
                _ = self.interpreter.visit(tree)
                if let error = self.interpreter.error {
                    throw error
                }
                completion?(nil)
            } catch {
                completion?(error)
            }
        }
    }
    
    /// Executes the provided Plato code asynchronously.
    public func run(_ code: String, qos: DispatchQoS.QoSClass = .default) async throws {
        return try await withCheckedThrowingContinuation { continuation in
            run(code, qos: qos) { error in
                if let error = error {
                    continuation.resume(throwing: error)
                    return
                }
                continuation.resume()
            }
        }
    }
    
    /// Stops the interpreter if it's running .
//    public func stop() {
//        
//    }
}
