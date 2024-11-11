//
//  BailErrorStrategy.swift
//
//
//  Created by Pedro Ésli Vieira do Nascimento on 01/02/24.
//

import Antlr4

public class BailErrorStrategy: ANTLRErrorStrategy {
    public func reset(_ recognizer: Antlr4.Parser) {
        
    }
    
    public func inErrorRecoveryMode(_ recognizer: Antlr4.Parser) -> Bool {
        return false
    }
    
    public func reportMatch(_ recognizer: Antlr4.Parser) {
        
    }
    
    public func reportError(_ recognizer: Antlr4.Parser, _ e: Antlr4.RecognitionException) {
        if let nvae = e as? NoViableAltException {
            reportNoViableAlternative(recognizer, nvae)
        }
        else if let ime = e as? InputMismatchException {
            reportInputMismatch(recognizer, ime)
        }
        else if let fpe = e as? FailedPredicateException {
            reportFailedPredicate(recognizer, fpe)
        }
        else {
            print("unknown recognition error type: " + String(describing: type(of: e)))
            recognizer.notifyErrorListeners(e.getOffendingToken(), e.message ?? "", e)
        }
    }
    
    // Instead of recovering from exception e, rethrow it wrapped
    // in a generic RuntimeException so it is not caught by the
    // rule function catches.  Exception e is the "cause" of the
    // RuntimeException.
    public func recover(_ recognizer: Parser, _ e: RecognitionException) throws {
        let message = e.message ?? "Bail Error"
        let line = e.getOffendingToken().getStartIndex()
        let column = e.getOffendingToken().getCharPositionInLine()
        throw PlatoError(message: message, line: line, column: column)
    }
    
    // Make sure we don't attempt to recover inline; if the parser
    //  successfully recovers, it won't throw an exception.
    public func recoverInline(_ recognizer: Parser) throws -> Token {
        let message = "Inline recover fail"
        let line = try recognizer.getCurrentToken().getLine()
        let column = try recognizer.getCurrentToken().getCharPositionInLine()
        throw PlatoError(message: message, line: line, column: column)
    }
    
    // Make sure we don't attempt to recover from problems in subrules.
    public func sync(_ recognizer: Parser) throws {
        
    }
    
    ///
    /// This is called by _#reportError_ when the exception is a
    /// _org.antlr.v4.runtime.NoViableAltException_.
    ///
    /// - seealso: #reportError
    ///
    /// - parameter recognizer: the parser instance
    /// - parameter e: the recognition exception
    ///
    open func reportNoViableAlternative(_ recognizer: Parser, _ e: NoViableAltException) {
        let tokens = getTokenStream(recognizer)
        var input: String
        if e.getStartToken().getType() == CommonToken.EOF {
            input = "<EOF>"
        }
        else {
            do {
                input = try tokens.getText(e.getStartToken(), e.getOffendingToken())
            }
            catch {
                input = "<unknown>"
            }
        }
        let msg = "no viable alternative at input " + escapeWSAndQuote(input)
        recognizer.notifyErrorListeners(e.getOffendingToken(), msg, e)
    }
    
    ///
    /// This is called by _#reportError_ when the exception is an
    /// _org.antlr.v4.runtime.InputMismatchException_.
    ///
    /// - seealso: #reportError
    ///
    /// - parameter recognizer: the parser instance
    /// - parameter e: the recognition exception
    ///
    open func reportInputMismatch(_ recognizer: Parser, _ e: InputMismatchException) {
        let tok = getTokenErrorDisplay(e.getOffendingToken())
        let expected = e.getExpectedTokens()?.toString(recognizer.getVocabulary()) ?? "<missing>"
        let msg = "mismatched input \(tok) expecting \(expected)"
        recognizer.notifyErrorListeners(e.getOffendingToken(), msg, e)
    }
    
    ///
    /// This is called by _#reportError_ when the exception is a
    /// _org.antlr.v4.runtime.FailedPredicateException_.
    ///
    /// - seealso: #reportError
    ///
    /// - parameter recognizer: the parser instance
    /// - parameter e: the recognition exception
    ///
    open func reportFailedPredicate(_ recognizer: Parser, _ e: FailedPredicateException) {
        let ruleName = recognizer.getRuleNames()[recognizer._ctx!.getRuleIndex()]
        let msg = "rule \(ruleName) \(e.message!)"
        recognizer.notifyErrorListeners(e.getOffendingToken(), msg, e)
    }
    
    ///
    /// Conjure up a missing token during error recovery.
    ///
    /// The recognizer attempts to recover from single missing
    /// symbols. But, actions might refer to that missing symbol.
    /// For example, x=ID {f($x);}. The action clearly assumes
    /// that there has been an identifier matched previously and that
    /// $x points at that token. If that token is missing, but
    /// the next token in the stream is what we want we assume that
    /// this token is missing and we keep going. Because we
    /// have to return some token to replace the missing token,
    /// we have to conjure one up. This method gives the user control
    /// over the tokens returned for missing tokens. Mostly,
    /// you will want to create something special for identifier
    /// tokens. For literals such as '{' and ',', the default
    /// action in the parser or tree parser works. It simply creates
    /// a CommonToken of the appropriate type. The text will be the token.
    /// If you change what tokens must be created by the lexer,
    /// override this method to create the appropriate tokens.
    ///
    open func getTokenStream(_ recognizer: Parser) -> TokenStream {
        return recognizer.getInputStream() as! TokenStream
    }
    
    open func escapeWSAndQuote(_ s: String) -> String {
        var s = s
        s = s.replacingOccurrences(of: "\n", with: "\\n")
        s = s.replacingOccurrences(of: "\r", with: "\\r")
        s = s.replacingOccurrences(of: "\t", with: "\\t")
        return "'" + s + "'"
    }
    
    ///
    /// How should a token be displayed in an error message? The default
    /// is to display just the text, but during development you might
    /// want to have a lot of information spit out.  Override in that case
    /// to use t.toString() (which, for CommonToken, dumps everything about
    /// the token). This is better than forcing you to override a method in
    /// your token objects because you don't have to go modify your lexer
    /// so that it creates a new Java type.
    ///
    open func getTokenErrorDisplay(_ t: Token?) -> String {
        guard let t = t else {
            return "<no token>"
        }
        var s = getSymbolText(t)
        if s == nil {
            if getSymbolType(t) == CommonToken.EOF {
                s = "<EOF>"
            } else {
                s = "<\(getSymbolType(t))>"
            }
        }
        return escapeWSAndQuote(s!)
    }
    
    open func getSymbolText(_ symbol: Token) -> String? {
        return symbol.getText()
    }
    
    open func getSymbolType(_ symbol: Token) -> Int {
        return symbol.getType()
    }
}
