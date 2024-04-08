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
    
    private let interpreter = PlatoInterpreter()
    
    /// Initiate a new Plato executer.
    public init() {
        
    }
    
    /// Executes the provided Plato code.
    public func run(_ code: String) throws {
        guard !code.isEmpty else { return }
        
        let input = ANTLRInputStream(code)
        let lexer = PlatoLexer(input)
        let tokens = CommonTokenStream(lexer)
        let parser = try PlatoParser(tokens)
        parser.setErrorHandler(BailErrorStrategy())
        let tree = try parser.program()
        
        _ = interpreter.visit(tree)
        if let error = interpreter.error {
            throw error
        }
    }
    
    /// Stops the interpreter if it's running .
//    public func stop() {
//        
//    }
}
