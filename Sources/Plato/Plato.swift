import PlatoCore
import Antlr4

public struct Plato {
    static func run(_ code: String) throws {
        let input = ANTLRInputStream(code)
        let lexer = PlatoLexer(input)
        let tokens = CommonTokenStream(lexer)
        do {
            let parser = try PlatoParser(tokens)
            let tree = try parser.program()
            _ = PlatoInterpreter().visit(tree)
        } catch {
            throw RuntimeError(error.localizedDescription)
        }
    }
}
