import PlatoCore
import Antlr4

public struct Plato {
    static func run(_ code: String) throws {
        let input = ANTLRInputStream(code)
        let lexer = PlatoLexer(input)
        let tokens = CommonTokenStream(lexer)
        let parser = try PlatoParser(tokens)
        parser.setErrorHandler(BailErrorStrategy())
        let tree = try parser.program()
        
        let interpreter = PlatoInterpreter()
        _ = interpreter.visit(tree)
        if let error = interpreter.error {
            throw error
        }
    }
}
