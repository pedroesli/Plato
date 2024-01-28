import PlatoCore
import Antlr4

public struct Plato {
    static func run(_ code: String) throws {
        let input = ANTLRInputStream(code)
        let lexer = PlatoLexer(input)
        let tokens = CommonTokenStream(lexer)
        let interpreter = PlatoInterpreter()
        do {
            let parser = try PlatoParser(tokens)
            let tree = try parser.program()
            _ = interpreter.visit(tree)
            if let error = interpreter.error {
                throw RuntimeError(error.description)
            }
        } catch {
            throw RuntimeError(error.localizedDescription)
        }
    }
}
