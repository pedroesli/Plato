// Generated from Grammar/Plato.g4 by ANTLR 4.13.1
import Antlr4

open class PlatoParser: Parser {

	internal static var _decisionToDFA: [DFA] = {
          var decisionToDFA = [DFA]()
          let length = PlatoParser._ATN.getNumberOfDecisions()
          for i in 0..<length {
            decisionToDFA.append(DFA(PlatoParser._ATN.getDecisionState(i)!, i))
           }
           return decisionToDFA
     }()

	internal static let _sharedContextCache = PredictionContextCache()

	public
	enum Tokens: Int {
		case EOF = -1, T__0 = 1, T__1 = 2, T__2 = 3, T__3 = 4, T__4 = 5, T__5 = 6, 
                 T__6 = 7, T__7 = 8, T__8 = 9, T__9 = 10, T__10 = 11, T__11 = 12, 
                 T__12 = 13, T__13 = 14, T__14 = 15, T__15 = 16, T__16 = 17, 
                 EXP = 18, MUL = 19, DIV = 20, MOD = 21, PLUS = 22, MINUS = 23, 
                 LT = 24, LTE = 25, GT = 26, GTE = 27, EQUAL = 28, DIF = 29, 
                 AND = 30, OR = 31, NOT = 32, TRUE = 33, FALSE = 34, ASSIGN = 35, 
                 MUL_ASSIGN = 36, DIV_ASSIGN = 37, MOD_ASSIGN = 38, ADD_ASSIGN = 39, 
                 SUB_ASSIGN = 40, RETURN = 41, BREAK = 42, CONTINUE = 43, 
                 ID = 44, FLOAT = 45, INT = 46, STRING = 47, NEWLINE = 48, 
                 WS = 49, COMMENT = 50, COMMENT_LONG = 51
	}

	public
	static let RULE_program = 0, RULE_statements = 1, RULE_statement = 2, RULE_breakStatement = 3, 
            RULE_continueStatement = 4, RULE_assignmentStatement = 5, RULE_selectionStatement = 6, 
            RULE_selectionElseIf = 7, RULE_selectionElse = 8, RULE_controlFlowStatement = 9, 
            RULE_functionDeclaration = 10, RULE_functionArguments = 11, 
            RULE_expression = 12, RULE_functionCall = 13, RULE_parameterList = 14, 
            RULE_element = 15, RULE_array = 16

	public
	static let ruleNames: [String] = [
		"program", "statements", "statement", "breakStatement", "continueStatement", 
		"assignmentStatement", "selectionStatement", "selectionElseIf", "selectionElse", 
		"controlFlowStatement", "functionDeclaration", "functionArguments", "expression", 
		"functionCall", "parameterList", "element", "array"
	]

	private static let _LITERAL_NAMES: [String?] = [
		nil, "';'", "'if'", "'{'", "'}'", "'else'", "'while'", "'for'", "'in'", 
		"'from'", "'to'", "'by'", "'func'", "'('", "')'", "','", "'['", "']'", 
		"'^'", "'*'", "'/'", "'%'", "'+'", "'-'", "'<'", "'<='", "'>'", "'>='", 
		"'=='", "'!='", "'and'", "'or'", "'!'", "'TRUE'", "'FALSE'", "'='", "'*='", 
		"'/='", "'%='", "'+='", "'-='", "'return'", "'break'", "'continue'"
	]
	private static let _SYMBOLIC_NAMES: [String?] = [
		nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 
		nil, nil, nil, nil, "EXP", "MUL", "DIV", "MOD", "PLUS", "MINUS", "LT", 
		"LTE", "GT", "GTE", "EQUAL", "DIF", "AND", "OR", "NOT", "TRUE", "FALSE", 
		"ASSIGN", "MUL_ASSIGN", "DIV_ASSIGN", "MOD_ASSIGN", "ADD_ASSIGN", "SUB_ASSIGN", 
		"RETURN", "BREAK", "CONTINUE", "ID", "FLOAT", "INT", "STRING", "NEWLINE", 
		"WS", "COMMENT", "COMMENT_LONG"
	]
	public
	static let VOCABULARY = Vocabulary(_LITERAL_NAMES, _SYMBOLIC_NAMES)

	override open
	func getGrammarFileName() -> String { return "Plato.g4" }

	override open
	func getRuleNames() -> [String] { return PlatoParser.ruleNames }

	override open
	func getSerializedATN() -> [Int] { return PlatoParser._serializedATN }

	override open
	func getATN() -> ATN { return PlatoParser._ATN }


	override open
	func getVocabulary() -> Vocabulary {
	    return PlatoParser.VOCABULARY
	}

	override public
	init(_ input:TokenStream) throws {
	    RuntimeMetaData.checkVersion("4.13.1", RuntimeMetaData.VERSION)
		try super.init(input)
		_interp = ParserATNSimulator(self,PlatoParser._ATN,PlatoParser._decisionToDFA, PlatoParser._sharedContextCache)
	}


	public class ProgramContext: ParserRuleContext {
			open
			func statements() -> StatementsContext? {
				return getRuleContext(StatementsContext.self, 0)
			}
			open
			func EOF() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.EOF.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return PlatoParser.RULE_program
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitProgram(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitProgram(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func program() throws -> ProgramContext {
		var _localctx: ProgramContext
		_localctx = ProgramContext(_ctx, getState())
		try enterRule(_localctx, 0, PlatoParser.RULE_program)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(34)
		 	try statements()
		 	setState(35)
		 	try match(PlatoParser.Tokens.EOF.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class StatementsContext: ParserRuleContext {
			open
			func statement() -> [StatementContext] {
				return getRuleContexts(StatementContext.self)
			}
			open
			func statement(_ i: Int) -> StatementContext? {
				return getRuleContext(StatementContext.self, i)
			}
			open
			func NEWLINE() -> [TerminalNode] {
				return getTokens(PlatoParser.Tokens.NEWLINE.rawValue)
			}
			open
			func NEWLINE(_ i:Int) -> TerminalNode? {
				return getToken(PlatoParser.Tokens.NEWLINE.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return PlatoParser.RULE_statements
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitStatements(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitStatements(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func statements() throws -> StatementsContext {
		var _localctx: StatementsContext
		_localctx = StatementsContext(_ctx, getState())
		try enterRule(_localctx, 2, PlatoParser.RULE_statements)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	try enterOuterAlt(_localctx, 1)
		 	setState(43)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,1,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(38)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 			if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 279306030887108) != 0)) {
		 				setState(37)
		 				try statement()

		 			}

		 			setState(40)
		 			_la = try _input.LA(1)
		 			if (!(_la == PlatoParser.Tokens.T__0.rawValue || _la == PlatoParser.Tokens.NEWLINE.rawValue)) {
		 			try _errHandler.recoverInline(self)
		 			}
		 			else {
		 				_errHandler.reportMatch(self)
		 				try consume()
		 			}

		 	 
		 		}
		 		setState(45)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,1,_ctx)
		 	}
		 	setState(47)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 279306030887108) != 0)) {
		 		setState(46)
		 		try statement()

		 	}


		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class StatementContext: ParserRuleContext {
			open
			func assignmentStatement() -> AssignmentStatementContext? {
				return getRuleContext(AssignmentStatementContext.self, 0)
			}
			open
			func selectionStatement() -> SelectionStatementContext? {
				return getRuleContext(SelectionStatementContext.self, 0)
			}
			open
			func controlFlowStatement() -> ControlFlowStatementContext? {
				return getRuleContext(ControlFlowStatementContext.self, 0)
			}
			open
			func functionDeclaration() -> FunctionDeclarationContext? {
				return getRuleContext(FunctionDeclarationContext.self, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
			open
			func breakStatement() -> BreakStatementContext? {
				return getRuleContext(BreakStatementContext.self, 0)
			}
			open
			func continueStatement() -> ContinueStatementContext? {
				return getRuleContext(ContinueStatementContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return PlatoParser.RULE_statement
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitStatement(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitStatement(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func statement() throws -> StatementContext {
		var _localctx: StatementContext
		_localctx = StatementContext(_ctx, getState())
		try enterRule(_localctx, 4, PlatoParser.RULE_statement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(56)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,3, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(49)
		 		try assignmentStatement()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(50)
		 		try selectionStatement()

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(51)
		 		try controlFlowStatement()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(52)
		 		try functionDeclaration()

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(53)
		 		try expression(0)

		 		break
		 	case 6:
		 		try enterOuterAlt(_localctx, 6)
		 		setState(54)
		 		try breakStatement()

		 		break
		 	case 7:
		 		try enterOuterAlt(_localctx, 7)
		 		setState(55)
		 		try continueStatement()

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class BreakStatementContext: ParserRuleContext {
			open
			func BREAK() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.BREAK.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return PlatoParser.RULE_breakStatement
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitBreakStatement(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitBreakStatement(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func breakStatement() throws -> BreakStatementContext {
		var _localctx: BreakStatementContext
		_localctx = BreakStatementContext(_ctx, getState())
		try enterRule(_localctx, 6, PlatoParser.RULE_breakStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(58)
		 	try match(PlatoParser.Tokens.BREAK.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ContinueStatementContext: ParserRuleContext {
			open
			func CONTINUE() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.CONTINUE.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return PlatoParser.RULE_continueStatement
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitContinueStatement(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitContinueStatement(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func continueStatement() throws -> ContinueStatementContext {
		var _localctx: ContinueStatementContext
		_localctx = ContinueStatementContext(_ctx, getState())
		try enterRule(_localctx, 8, PlatoParser.RULE_continueStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(60)
		 	try match(PlatoParser.Tokens.CONTINUE.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class AssignmentStatementContext: ParserRuleContext {
		open var op: Token!
			open
			func ID() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.ID.rawValue, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
			open
			func ASSIGN() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.ASSIGN.rawValue, 0)
			}
			open
			func MUL_ASSIGN() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.MUL_ASSIGN.rawValue, 0)
			}
			open
			func DIV_ASSIGN() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.DIV_ASSIGN.rawValue, 0)
			}
			open
			func MOD_ASSIGN() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.MOD_ASSIGN.rawValue, 0)
			}
			open
			func ADD_ASSIGN() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.ADD_ASSIGN.rawValue, 0)
			}
			open
			func SUB_ASSIGN() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.SUB_ASSIGN.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return PlatoParser.RULE_assignmentStatement
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitAssignmentStatement(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitAssignmentStatement(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func assignmentStatement() throws -> AssignmentStatementContext {
		var _localctx: AssignmentStatementContext
		_localctx = AssignmentStatementContext(_ctx, getState())
		try enterRule(_localctx, 10, PlatoParser.RULE_assignmentStatement)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(62)
		 	try match(PlatoParser.Tokens.ID.rawValue)
		 	setState(63)
		 	_localctx.castdown(AssignmentStatementContext.self).op = try _input.LT(1)
		 	_la = try _input.LA(1)
		 	if (!(((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 2164663517184) != 0))) {
		 		_localctx.castdown(AssignmentStatementContext.self).op = try _errHandler.recoverInline(self) as Token
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}
		 	setState(64)
		 	try expression(0)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class SelectionStatementContext: ParserRuleContext {
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
			open
			func statements() -> StatementsContext? {
				return getRuleContext(StatementsContext.self, 0)
			}
			open
			func selectionElseIf() -> [SelectionElseIfContext] {
				return getRuleContexts(SelectionElseIfContext.self)
			}
			open
			func selectionElseIf(_ i: Int) -> SelectionElseIfContext? {
				return getRuleContext(SelectionElseIfContext.self, i)
			}
			open
			func selectionElse() -> SelectionElseContext? {
				return getRuleContext(SelectionElseContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return PlatoParser.RULE_selectionStatement
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitSelectionStatement(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitSelectionStatement(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func selectionStatement() throws -> SelectionStatementContext {
		var _localctx: SelectionStatementContext
		_localctx = SelectionStatementContext(_ctx, getState())
		try enterRule(_localctx, 12, PlatoParser.RULE_selectionStatement)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	try enterOuterAlt(_localctx, 1)
		 	setState(66)
		 	try match(PlatoParser.Tokens.T__1.rawValue)
		 	setState(67)
		 	try expression(0)
		 	setState(68)
		 	try match(PlatoParser.Tokens.T__2.rawValue)
		 	setState(69)
		 	try statements()
		 	setState(70)
		 	try match(PlatoParser.Tokens.T__3.rawValue)
		 	setState(74)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,4,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(71)
		 			try selectionElseIf()

		 	 
		 		}
		 		setState(76)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,4,_ctx)
		 	}
		 	setState(78)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == PlatoParser.Tokens.T__4.rawValue) {
		 		setState(77)
		 		try selectionElse()

		 	}


		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class SelectionElseIfContext: ParserRuleContext {
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
			open
			func statements() -> StatementsContext? {
				return getRuleContext(StatementsContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return PlatoParser.RULE_selectionElseIf
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitSelectionElseIf(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitSelectionElseIf(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func selectionElseIf() throws -> SelectionElseIfContext {
		var _localctx: SelectionElseIfContext
		_localctx = SelectionElseIfContext(_ctx, getState())
		try enterRule(_localctx, 14, PlatoParser.RULE_selectionElseIf)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(80)
		 	try match(PlatoParser.Tokens.T__4.rawValue)
		 	setState(81)
		 	try match(PlatoParser.Tokens.T__1.rawValue)
		 	setState(82)
		 	try expression(0)
		 	setState(83)
		 	try match(PlatoParser.Tokens.T__2.rawValue)
		 	setState(84)
		 	try statements()
		 	setState(85)
		 	try match(PlatoParser.Tokens.T__3.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class SelectionElseContext: ParserRuleContext {
			open
			func statements() -> StatementsContext? {
				return getRuleContext(StatementsContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return PlatoParser.RULE_selectionElse
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitSelectionElse(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitSelectionElse(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func selectionElse() throws -> SelectionElseContext {
		var _localctx: SelectionElseContext
		_localctx = SelectionElseContext(_ctx, getState())
		try enterRule(_localctx, 16, PlatoParser.RULE_selectionElse)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(87)
		 	try match(PlatoParser.Tokens.T__4.rawValue)
		 	setState(88)
		 	try match(PlatoParser.Tokens.T__2.rawValue)
		 	setState(89)
		 	try statements()
		 	setState(90)
		 	try match(PlatoParser.Tokens.T__3.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ControlFlowStatementContext: ParserRuleContext {
		override open
		func getRuleIndex() -> Int {
			return PlatoParser.RULE_controlFlowStatement
		}
	}
	public class WhileStatementContext: ControlFlowStatementContext {
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
			open
			func statements() -> StatementsContext? {
				return getRuleContext(StatementsContext.self, 0)
			}

		public
		init(_ ctx: ControlFlowStatementContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitWhileStatement(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitWhileStatement(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class ForInStatementContext: ControlFlowStatementContext {
			open
			func ID() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.ID.rawValue, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
			open
			func statements() -> StatementsContext? {
				return getRuleContext(StatementsContext.self, 0)
			}

		public
		init(_ ctx: ControlFlowStatementContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitForInStatement(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitForInStatement(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class ForFromToByStatementContext: ControlFlowStatementContext {
			open
			func ID() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.ID.rawValue, 0)
			}
			open
			func expression() -> [ExpressionContext] {
				return getRuleContexts(ExpressionContext.self)
			}
			open
			func expression(_ i: Int) -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, i)
			}
			open
			func statements() -> StatementsContext? {
				return getRuleContext(StatementsContext.self, 0)
			}

		public
		init(_ ctx: ControlFlowStatementContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitForFromToByStatement(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitForFromToByStatement(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func controlFlowStatement() throws -> ControlFlowStatementContext {
		var _localctx: ControlFlowStatementContext
		_localctx = ControlFlowStatementContext(_ctx, getState())
		try enterRule(_localctx, 18, PlatoParser.RULE_controlFlowStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(118)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,6, _ctx)) {
		 	case 1:
		 		_localctx =  WhileStatementContext(_localctx);
		 		try enterOuterAlt(_localctx, 1)
		 		setState(92)
		 		try match(PlatoParser.Tokens.T__5.rawValue)
		 		setState(93)
		 		try expression(0)
		 		setState(94)
		 		try match(PlatoParser.Tokens.T__2.rawValue)
		 		setState(95)
		 		try statements()
		 		setState(96)
		 		try match(PlatoParser.Tokens.T__3.rawValue)

		 		break
		 	case 2:
		 		_localctx =  ForInStatementContext(_localctx);
		 		try enterOuterAlt(_localctx, 2)
		 		setState(98)
		 		try match(PlatoParser.Tokens.T__6.rawValue)
		 		setState(99)
		 		try match(PlatoParser.Tokens.ID.rawValue)
		 		setState(100)
		 		try match(PlatoParser.Tokens.T__7.rawValue)
		 		setState(101)
		 		try expression(0)
		 		setState(102)
		 		try match(PlatoParser.Tokens.T__2.rawValue)
		 		setState(103)
		 		try statements()
		 		setState(104)
		 		try match(PlatoParser.Tokens.T__3.rawValue)

		 		break
		 	case 3:
		 		_localctx =  ForFromToByStatementContext(_localctx);
		 		try enterOuterAlt(_localctx, 3)
		 		setState(106)
		 		try match(PlatoParser.Tokens.T__6.rawValue)
		 		setState(107)
		 		try match(PlatoParser.Tokens.ID.rawValue)
		 		setState(108)
		 		try match(PlatoParser.Tokens.T__8.rawValue)
		 		setState(109)
		 		try expression(0)
		 		setState(110)
		 		try match(PlatoParser.Tokens.T__9.rawValue)
		 		setState(111)
		 		try expression(0)
		 		setState(112)
		 		try match(PlatoParser.Tokens.T__10.rawValue)
		 		setState(113)
		 		try expression(0)
		 		setState(114)
		 		try match(PlatoParser.Tokens.T__2.rawValue)
		 		setState(115)
		 		try statements()
		 		setState(116)
		 		try match(PlatoParser.Tokens.T__3.rawValue)

		 		break
		 	default: break
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class FunctionDeclarationContext: ParserRuleContext {
			open
			func ID() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.ID.rawValue, 0)
			}
			open
			func statements() -> StatementsContext? {
				return getRuleContext(StatementsContext.self, 0)
			}
			open
			func functionArguments() -> FunctionArgumentsContext? {
				return getRuleContext(FunctionArgumentsContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return PlatoParser.RULE_functionDeclaration
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitFunctionDeclaration(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitFunctionDeclaration(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func functionDeclaration() throws -> FunctionDeclarationContext {
		var _localctx: FunctionDeclarationContext
		_localctx = FunctionDeclarationContext(_ctx, getState())
		try enterRule(_localctx, 20, PlatoParser.RULE_functionDeclaration)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(120)
		 	try match(PlatoParser.Tokens.T__11.rawValue)
		 	setState(121)
		 	try match(PlatoParser.Tokens.ID.rawValue)
		 	setState(122)
		 	try match(PlatoParser.Tokens.T__12.rawValue)
		 	setState(124)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == PlatoParser.Tokens.ID.rawValue) {
		 		setState(123)
		 		try functionArguments()

		 	}

		 	setState(126)
		 	try match(PlatoParser.Tokens.T__13.rawValue)
		 	setState(127)
		 	try match(PlatoParser.Tokens.T__2.rawValue)
		 	setState(128)
		 	try statements()
		 	setState(129)
		 	try match(PlatoParser.Tokens.T__3.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class FunctionArgumentsContext: ParserRuleContext {
			open
			func ID() -> [TerminalNode] {
				return getTokens(PlatoParser.Tokens.ID.rawValue)
			}
			open
			func ID(_ i:Int) -> TerminalNode? {
				return getToken(PlatoParser.Tokens.ID.rawValue, i)
			}
		override open
		func getRuleIndex() -> Int {
			return PlatoParser.RULE_functionArguments
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitFunctionArguments(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitFunctionArguments(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func functionArguments() throws -> FunctionArgumentsContext {
		var _localctx: FunctionArgumentsContext
		_localctx = FunctionArgumentsContext(_ctx, getState())
		try enterRule(_localctx, 22, PlatoParser.RULE_functionArguments)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(131)
		 	try match(PlatoParser.Tokens.ID.rawValue)
		 	setState(136)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == PlatoParser.Tokens.T__14.rawValue) {
		 		setState(132)
		 		try match(PlatoParser.Tokens.T__14.rawValue)
		 		setState(133)
		 		try match(PlatoParser.Tokens.ID.rawValue)


		 		setState(138)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}


	public class ExpressionContext: ParserRuleContext {
		override open
		func getRuleIndex() -> Int {
			return PlatoParser.RULE_expression
		}
	}
	public class ParenthesesExpresionContext: ExpressionContext {
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}

		public
		init(_ ctx: ExpressionContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitParenthesesExpresion(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitParenthesesExpresion(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class AndExpresionContext: ExpressionContext {
			open
			func expression() -> [ExpressionContext] {
				return getRuleContexts(ExpressionContext.self)
			}
			open
			func expression(_ i: Int) -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, i)
			}
			open
			func AND() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.AND.rawValue, 0)
			}

		public
		init(_ ctx: ExpressionContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitAndExpresion(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitAndExpresion(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class OrExpresionContext: ExpressionContext {
			open
			func expression() -> [ExpressionContext] {
				return getRuleContexts(ExpressionContext.self)
			}
			open
			func expression(_ i: Int) -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, i)
			}
			open
			func OR() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.OR.rawValue, 0)
			}

		public
		init(_ ctx: ExpressionContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitOrExpresion(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitOrExpresion(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class ReturnExpresionContext: ExpressionContext {
			open
			func RETURN() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.RETURN.rawValue, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}

		public
		init(_ ctx: ExpressionContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitReturnExpresion(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitReturnExpresion(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class MulExpresionContext: ExpressionContext {
		public var op: Token!
			open
			func expression() -> [ExpressionContext] {
				return getRuleContexts(ExpressionContext.self)
			}
			open
			func expression(_ i: Int) -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, i)
			}
			open
			func MUL() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.MUL.rawValue, 0)
			}
			open
			func DIV() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.DIV.rawValue, 0)
			}
			open
			func MOD() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.MOD.rawValue, 0)
			}

		public
		init(_ ctx: ExpressionContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitMulExpresion(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitMulExpresion(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class TypeExpresionContext: ExpressionContext {
			open
			func element() -> ElementContext? {
				return getRuleContext(ElementContext.self, 0)
			}

		public
		init(_ ctx: ExpressionContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitTypeExpresion(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitTypeExpresion(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class FunctionCallExpresionContext: ExpressionContext {
			open
			func functionCall() -> FunctionCallContext? {
				return getRuleContext(FunctionCallContext.self, 0)
			}

		public
		init(_ ctx: ExpressionContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitFunctionCallExpresion(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitFunctionCallExpresion(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class EqualityExpresionContext: ExpressionContext {
		public var op: Token!
			open
			func expression() -> [ExpressionContext] {
				return getRuleContexts(ExpressionContext.self)
			}
			open
			func expression(_ i: Int) -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, i)
			}
			open
			func EQUAL() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.EQUAL.rawValue, 0)
			}
			open
			func DIF() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.DIF.rawValue, 0)
			}

		public
		init(_ ctx: ExpressionContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitEqualityExpresion(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitEqualityExpresion(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class SubscriptExpresionContext: ExpressionContext {
			open
			func expression() -> [ExpressionContext] {
				return getRuleContexts(ExpressionContext.self)
			}
			open
			func expression(_ i: Int) -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, i)
			}
			open
			func ID() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.ID.rawValue, 0)
			}
			open
			func functionCall() -> FunctionCallContext? {
				return getRuleContext(FunctionCallContext.self, 0)
			}
			open
			func array() -> ArrayContext? {
				return getRuleContext(ArrayContext.self, 0)
			}

		public
		init(_ ctx: ExpressionContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitSubscriptExpresion(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitSubscriptExpresion(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class CompareExpresionContext: ExpressionContext {
		public var op: Token!
			open
			func expression() -> [ExpressionContext] {
				return getRuleContexts(ExpressionContext.self)
			}
			open
			func expression(_ i: Int) -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, i)
			}
			open
			func LT() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.LT.rawValue, 0)
			}
			open
			func LTE() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.LTE.rawValue, 0)
			}
			open
			func GT() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.GT.rawValue, 0)
			}
			open
			func GTE() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.GTE.rawValue, 0)
			}
			open
			func EQUAL() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.EQUAL.rawValue, 0)
			}
			open
			func DIF() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.DIF.rawValue, 0)
			}

		public
		init(_ ctx: ExpressionContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitCompareExpresion(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitCompareExpresion(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class ExponentExpresionContext: ExpressionContext {
			open
			func expression() -> [ExpressionContext] {
				return getRuleContexts(ExpressionContext.self)
			}
			open
			func expression(_ i: Int) -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, i)
			}
			open
			func EXP() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.EXP.rawValue, 0)
			}

		public
		init(_ ctx: ExpressionContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitExponentExpresion(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitExponentExpresion(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class UnaryExpresionContext: ExpressionContext {
		public var op: Token!
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
			open
			func PLUS() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.PLUS.rawValue, 0)
			}
			open
			func MINUS() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.MINUS.rawValue, 0)
			}

		public
		init(_ ctx: ExpressionContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitUnaryExpresion(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitUnaryExpresion(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class AddExpresionContext: ExpressionContext {
		public var op: Token!
			open
			func expression() -> [ExpressionContext] {
				return getRuleContexts(ExpressionContext.self)
			}
			open
			func expression(_ i: Int) -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, i)
			}
			open
			func PLUS() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.PLUS.rawValue, 0)
			}
			open
			func MINUS() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.MINUS.rawValue, 0)
			}

		public
		init(_ ctx: ExpressionContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitAddExpresion(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitAddExpresion(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class NotExpresionContext: ExpressionContext {
			open
			func NOT() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.NOT.rawValue, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}

		public
		init(_ ctx: ExpressionContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitNotExpresion(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitNotExpresion(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}

	 public final  func expression( ) throws -> ExpressionContext   {
		return try expression(0)
	}
	@discardableResult
	private func expression(_ _p: Int) throws -> ExpressionContext   {
		let _parentctx: ParserRuleContext? = _ctx
		let _parentState: Int = getState()
		var _localctx: ExpressionContext
		_localctx = ExpressionContext(_ctx, _parentState)
		var _prevctx: ExpressionContext = _localctx
		let _startState: Int = 24
		try enterRecursionRule(_localctx, 24, PlatoParser.RULE_expression, _p)
		var _la: Int = 0
		defer {
	    		try! unrollRecursionContexts(_parentctx)
	    }
		do {
			var _alt: Int
			try enterOuterAlt(_localctx, 1)
			setState(169)
			try _errHandler.sync(self)
			switch(try getInterpreter().adaptivePredict(_input,11, _ctx)) {
			case 1:
				_localctx = SubscriptExpresionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx

				setState(143)
				try _errHandler.sync(self)
				switch(try getInterpreter().adaptivePredict(_input,9, _ctx)) {
				case 1:
					setState(140)
					try match(PlatoParser.Tokens.ID.rawValue)

					break
				case 2:
					setState(141)
					try functionCall()

					break
				case 3:
					setState(142)
					try array()

					break
				default: break
				}
				setState(145)
				try match(PlatoParser.Tokens.T__15.rawValue)
				setState(146)
				try expression(0)
				setState(147)
				try match(PlatoParser.Tokens.T__16.rawValue)
				setState(154)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,10,_ctx)
				while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
					if ( _alt==1 ) {
						setState(148)
						try match(PlatoParser.Tokens.T__15.rawValue)
						setState(149)
						try expression(0)
						setState(150)
						try match(PlatoParser.Tokens.T__16.rawValue)

				 
					}
					setState(156)
					try _errHandler.sync(self)
					_alt = try getInterpreter().adaptivePredict(_input,10,_ctx)
				}

				break
			case 2:
				_localctx = UnaryExpresionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(157)
				_localctx.castdown(UnaryExpresionContext.self).op = try _input.LT(1)
				_la = try _input.LA(1)
				if (!(_la == PlatoParser.Tokens.PLUS.rawValue || _la == PlatoParser.Tokens.MINUS.rawValue)) {
					_localctx.castdown(UnaryExpresionContext.self).op = try _errHandler.recoverInline(self) as Token
				}
				else {
					_errHandler.reportMatch(self)
					try consume()
				}
				setState(158)
				try expression(12)

				break
			case 3:
				_localctx = NotExpresionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(159)
				try match(PlatoParser.Tokens.NOT.rawValue)
				setState(160)
				try expression(11)

				break
			case 4:
				_localctx = FunctionCallExpresionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(161)
				try functionCall()

				break
			case 5:
				_localctx = ParenthesesExpresionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(162)
				try match(PlatoParser.Tokens.T__12.rawValue)
				setState(163)
				try expression(0)
				setState(164)
				try match(PlatoParser.Tokens.T__13.rawValue)

				break
			case 6:
				_localctx = ReturnExpresionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(166)
				try match(PlatoParser.Tokens.RETURN.rawValue)
				setState(167)
				try expression(2)

				break
			case 7:
				_localctx = TypeExpresionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(168)
				try element()

				break
			default: break
			}
			_ctx!.stop = try _input.LT(-1)
			setState(194)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,13,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
					_prevctx = _localctx
					setState(192)
					try _errHandler.sync(self)
					switch(try getInterpreter().adaptivePredict(_input,12, _ctx)) {
					case 1:
						_localctx = ExponentExpresionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(171)
						if (!(precpred(_ctx, 13))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 13)"))
						}
						setState(172)
						try match(PlatoParser.Tokens.EXP.rawValue)
						setState(173)
						try expression(13)

						break
					case 2:
						_localctx = MulExpresionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(174)
						if (!(precpred(_ctx, 10))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 10)"))
						}
						setState(175)
						_localctx.castdown(MulExpresionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 3670016) != 0))) {
							_localctx.castdown(MulExpresionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(176)
						try expression(11)

						break
					case 3:
						_localctx = AddExpresionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(177)
						if (!(precpred(_ctx, 9))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 9)"))
						}
						setState(178)
						_localctx.castdown(AddExpresionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(_la == PlatoParser.Tokens.PLUS.rawValue || _la == PlatoParser.Tokens.MINUS.rawValue)) {
							_localctx.castdown(AddExpresionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(179)
						try expression(10)

						break
					case 4:
						_localctx = CompareExpresionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(180)
						if (!(precpred(_ctx, 8))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 8)"))
						}
						setState(181)
						_localctx.castdown(CompareExpresionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 1056964608) != 0))) {
							_localctx.castdown(CompareExpresionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(182)
						try expression(9)

						break
					case 5:
						_localctx = EqualityExpresionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(183)
						if (!(precpred(_ctx, 7))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 7)"))
						}
						setState(184)
						_localctx.castdown(EqualityExpresionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(_la == PlatoParser.Tokens.EQUAL.rawValue || _la == PlatoParser.Tokens.DIF.rawValue)) {
							_localctx.castdown(EqualityExpresionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(185)
						try expression(8)

						break
					case 6:
						_localctx = AndExpresionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(186)
						if (!(precpred(_ctx, 6))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 6)"))
						}
						setState(187)
						try match(PlatoParser.Tokens.AND.rawValue)
						setState(188)
						try expression(7)

						break
					case 7:
						_localctx = OrExpresionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(189)
						if (!(precpred(_ctx, 5))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 5)"))
						}
						setState(190)
						try match(PlatoParser.Tokens.OR.rawValue)
						setState(191)
						try expression(6)

						break
					default: break
					}
			 
				}
				setState(196)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,13,_ctx)
			}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx;
	}

	public class FunctionCallContext: ParserRuleContext {
			open
			func ID() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.ID.rawValue, 0)
			}
			open
			func parameterList() -> ParameterListContext? {
				return getRuleContext(ParameterListContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return PlatoParser.RULE_functionCall
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitFunctionCall(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitFunctionCall(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func functionCall() throws -> FunctionCallContext {
		var _localctx: FunctionCallContext
		_localctx = FunctionCallContext(_ctx, getState())
		try enterRule(_localctx, 26, PlatoParser.RULE_functionCall)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(197)
		 	try match(PlatoParser.Tokens.ID.rawValue)
		 	setState(198)
		 	try match(PlatoParser.Tokens.T__12.rawValue)
		 	setState(200)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 266111891349504) != 0)) {
		 		setState(199)
		 		try parameterList()

		 	}

		 	setState(202)
		 	try match(PlatoParser.Tokens.T__13.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ParameterListContext: ParserRuleContext {
			open
			func expression() -> [ExpressionContext] {
				return getRuleContexts(ExpressionContext.self)
			}
			open
			func expression(_ i: Int) -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, i)
			}
		override open
		func getRuleIndex() -> Int {
			return PlatoParser.RULE_parameterList
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitParameterList(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitParameterList(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func parameterList() throws -> ParameterListContext {
		var _localctx: ParameterListContext
		_localctx = ParameterListContext(_ctx, getState())
		try enterRule(_localctx, 28, PlatoParser.RULE_parameterList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(204)
		 	try expression(0)
		 	setState(209)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == PlatoParser.Tokens.T__14.rawValue) {
		 		setState(205)
		 		try match(PlatoParser.Tokens.T__14.rawValue)
		 		setState(206)
		 		try expression(0)


		 		setState(211)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ElementContext: ParserRuleContext {
			open
			func ID() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.ID.rawValue, 0)
			}
			open
			func INT() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.INT.rawValue, 0)
			}
			open
			func FLOAT() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.FLOAT.rawValue, 0)
			}
			open
			func STRING() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.STRING.rawValue, 0)
			}
			open
			func TRUE() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.TRUE.rawValue, 0)
			}
			open
			func FALSE() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.FALSE.rawValue, 0)
			}
			open
			func array() -> ArrayContext? {
				return getRuleContext(ArrayContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return PlatoParser.RULE_element
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitElement(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitElement(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func element() throws -> ElementContext {
		var _localctx: ElementContext
		_localctx = ElementContext(_ctx, getState())
		try enterRule(_localctx, 30, PlatoParser.RULE_element)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(219)
		 	try _errHandler.sync(self)
		 	switch (PlatoParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .ID:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(212)
		 		try match(PlatoParser.Tokens.ID.rawValue)

		 		break

		 	case .INT:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(213)
		 		try match(PlatoParser.Tokens.INT.rawValue)

		 		break

		 	case .FLOAT:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(214)
		 		try match(PlatoParser.Tokens.FLOAT.rawValue)

		 		break

		 	case .STRING:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(215)
		 		try match(PlatoParser.Tokens.STRING.rawValue)

		 		break

		 	case .TRUE:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(216)
		 		try match(PlatoParser.Tokens.TRUE.rawValue)

		 		break

		 	case .FALSE:
		 		try enterOuterAlt(_localctx, 6)
		 		setState(217)
		 		try match(PlatoParser.Tokens.FALSE.rawValue)

		 		break

		 	case .T__15:
		 		try enterOuterAlt(_localctx, 7)
		 		setState(218)
		 		try array()

		 		break
		 	default:
		 		throw ANTLRException.recognition(e: NoViableAltException(self))
		 	}
		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ArrayContext: ParserRuleContext {
			open
			func parameterList() -> ParameterListContext? {
				return getRuleContext(ParameterListContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return PlatoParser.RULE_array
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitArray(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitArray(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func array() throws -> ArrayContext {
		var _localctx: ArrayContext
		_localctx = ArrayContext(_ctx, getState())
		try enterRule(_localctx, 32, PlatoParser.RULE_array)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(221)
		 	try match(PlatoParser.Tokens.T__15.rawValue)
		 	setState(223)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 266111891349504) != 0)) {
		 		setState(222)
		 		try parameterList()

		 	}

		 	setState(225)
		 	try match(PlatoParser.Tokens.T__16.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	override open
	func sempred(_ _localctx: RuleContext?, _ ruleIndex: Int,  _ predIndex: Int)throws -> Bool {
		switch (ruleIndex) {
		case  12:
			return try expression_sempred(_localctx?.castdown(ExpressionContext.self), predIndex)
	    default: return true
		}
	}
	private func expression_sempred(_ _localctx: ExpressionContext!,  _ predIndex: Int) throws -> Bool {
		switch (predIndex) {
		    case 0:return precpred(_ctx, 13)
		    case 1:return precpred(_ctx, 10)
		    case 2:return precpred(_ctx, 9)
		    case 3:return precpred(_ctx, 8)
		    case 4:return precpred(_ctx, 7)
		    case 5:return precpred(_ctx, 6)
		    case 6:return precpred(_ctx, 5)
		    default: return true
		}
	}

	static let _serializedATN:[Int] = [
		4,1,51,228,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,6,2,7,
		7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,2,12,7,12,2,13,7,13,2,14,7,14,
		2,15,7,15,2,16,7,16,1,0,1,0,1,0,1,1,3,1,39,8,1,1,1,5,1,42,8,1,10,1,12,
		1,45,9,1,1,1,3,1,48,8,1,1,2,1,2,1,2,1,2,1,2,1,2,1,2,3,2,57,8,2,1,3,1,3,
		1,4,1,4,1,5,1,5,1,5,1,5,1,6,1,6,1,6,1,6,1,6,1,6,5,6,73,8,6,10,6,12,6,76,
		9,6,1,6,3,6,79,8,6,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,8,1,8,1,8,1,8,1,8,1,9,
		1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,
		9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,3,9,119,8,9,1,10,1,10,1,10,1,10,3,10,125,
		8,10,1,10,1,10,1,10,1,10,1,10,1,11,1,11,1,11,5,11,135,8,11,10,11,12,11,
		138,9,11,1,12,1,12,1,12,1,12,3,12,144,8,12,1,12,1,12,1,12,1,12,1,12,1,
		12,1,12,5,12,153,8,12,10,12,12,12,156,9,12,1,12,1,12,1,12,1,12,1,12,1,
		12,1,12,1,12,1,12,1,12,1,12,1,12,3,12,170,8,12,1,12,1,12,1,12,1,12,1,12,
		1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,
		1,12,1,12,5,12,193,8,12,10,12,12,12,196,9,12,1,13,1,13,1,13,3,13,201,8,
		13,1,13,1,13,1,14,1,14,1,14,5,14,208,8,14,10,14,12,14,211,9,14,1,15,1,
		15,1,15,1,15,1,15,1,15,1,15,3,15,220,8,15,1,16,1,16,3,16,224,8,16,1,16,
		1,16,1,16,0,1,24,17,0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,0,6,
		2,0,1,1,48,48,1,0,35,40,1,0,22,23,1,0,19,21,1,0,24,29,1,0,28,29,250,0,
		34,1,0,0,0,2,43,1,0,0,0,4,56,1,0,0,0,6,58,1,0,0,0,8,60,1,0,0,0,10,62,1,
		0,0,0,12,66,1,0,0,0,14,80,1,0,0,0,16,87,1,0,0,0,18,118,1,0,0,0,20,120,
		1,0,0,0,22,131,1,0,0,0,24,169,1,0,0,0,26,197,1,0,0,0,28,204,1,0,0,0,30,
		219,1,0,0,0,32,221,1,0,0,0,34,35,3,2,1,0,35,36,5,0,0,1,36,1,1,0,0,0,37,
		39,3,4,2,0,38,37,1,0,0,0,38,39,1,0,0,0,39,40,1,0,0,0,40,42,7,0,0,0,41,
		38,1,0,0,0,42,45,1,0,0,0,43,41,1,0,0,0,43,44,1,0,0,0,44,47,1,0,0,0,45,
		43,1,0,0,0,46,48,3,4,2,0,47,46,1,0,0,0,47,48,1,0,0,0,48,3,1,0,0,0,49,57,
		3,10,5,0,50,57,3,12,6,0,51,57,3,18,9,0,52,57,3,20,10,0,53,57,3,24,12,0,
		54,57,3,6,3,0,55,57,3,8,4,0,56,49,1,0,0,0,56,50,1,0,0,0,56,51,1,0,0,0,
		56,52,1,0,0,0,56,53,1,0,0,0,56,54,1,0,0,0,56,55,1,0,0,0,57,5,1,0,0,0,58,
		59,5,42,0,0,59,7,1,0,0,0,60,61,5,43,0,0,61,9,1,0,0,0,62,63,5,44,0,0,63,
		64,7,1,0,0,64,65,3,24,12,0,65,11,1,0,0,0,66,67,5,2,0,0,67,68,3,24,12,0,
		68,69,5,3,0,0,69,70,3,2,1,0,70,74,5,4,0,0,71,73,3,14,7,0,72,71,1,0,0,0,
		73,76,1,0,0,0,74,72,1,0,0,0,74,75,1,0,0,0,75,78,1,0,0,0,76,74,1,0,0,0,
		77,79,3,16,8,0,78,77,1,0,0,0,78,79,1,0,0,0,79,13,1,0,0,0,80,81,5,5,0,0,
		81,82,5,2,0,0,82,83,3,24,12,0,83,84,5,3,0,0,84,85,3,2,1,0,85,86,5,4,0,
		0,86,15,1,0,0,0,87,88,5,5,0,0,88,89,5,3,0,0,89,90,3,2,1,0,90,91,5,4,0,
		0,91,17,1,0,0,0,92,93,5,6,0,0,93,94,3,24,12,0,94,95,5,3,0,0,95,96,3,2,
		1,0,96,97,5,4,0,0,97,119,1,0,0,0,98,99,5,7,0,0,99,100,5,44,0,0,100,101,
		5,8,0,0,101,102,3,24,12,0,102,103,5,3,0,0,103,104,3,2,1,0,104,105,5,4,
		0,0,105,119,1,0,0,0,106,107,5,7,0,0,107,108,5,44,0,0,108,109,5,9,0,0,109,
		110,3,24,12,0,110,111,5,10,0,0,111,112,3,24,12,0,112,113,5,11,0,0,113,
		114,3,24,12,0,114,115,5,3,0,0,115,116,3,2,1,0,116,117,5,4,0,0,117,119,
		1,0,0,0,118,92,1,0,0,0,118,98,1,0,0,0,118,106,1,0,0,0,119,19,1,0,0,0,120,
		121,5,12,0,0,121,122,5,44,0,0,122,124,5,13,0,0,123,125,3,22,11,0,124,123,
		1,0,0,0,124,125,1,0,0,0,125,126,1,0,0,0,126,127,5,14,0,0,127,128,5,3,0,
		0,128,129,3,2,1,0,129,130,5,4,0,0,130,21,1,0,0,0,131,136,5,44,0,0,132,
		133,5,15,0,0,133,135,5,44,0,0,134,132,1,0,0,0,135,138,1,0,0,0,136,134,
		1,0,0,0,136,137,1,0,0,0,137,23,1,0,0,0,138,136,1,0,0,0,139,143,6,12,-1,
		0,140,144,5,44,0,0,141,144,3,26,13,0,142,144,3,32,16,0,143,140,1,0,0,0,
		143,141,1,0,0,0,143,142,1,0,0,0,144,145,1,0,0,0,145,146,5,16,0,0,146,147,
		3,24,12,0,147,154,5,17,0,0,148,149,5,16,0,0,149,150,3,24,12,0,150,151,
		5,17,0,0,151,153,1,0,0,0,152,148,1,0,0,0,153,156,1,0,0,0,154,152,1,0,0,
		0,154,155,1,0,0,0,155,170,1,0,0,0,156,154,1,0,0,0,157,158,7,2,0,0,158,
		170,3,24,12,12,159,160,5,32,0,0,160,170,3,24,12,11,161,170,3,26,13,0,162,
		163,5,13,0,0,163,164,3,24,12,0,164,165,5,14,0,0,165,170,1,0,0,0,166,167,
		5,41,0,0,167,170,3,24,12,2,168,170,3,30,15,0,169,139,1,0,0,0,169,157,1,
		0,0,0,169,159,1,0,0,0,169,161,1,0,0,0,169,162,1,0,0,0,169,166,1,0,0,0,
		169,168,1,0,0,0,170,194,1,0,0,0,171,172,10,13,0,0,172,173,5,18,0,0,173,
		193,3,24,12,13,174,175,10,10,0,0,175,176,7,3,0,0,176,193,3,24,12,11,177,
		178,10,9,0,0,178,179,7,2,0,0,179,193,3,24,12,10,180,181,10,8,0,0,181,182,
		7,4,0,0,182,193,3,24,12,9,183,184,10,7,0,0,184,185,7,5,0,0,185,193,3,24,
		12,8,186,187,10,6,0,0,187,188,5,30,0,0,188,193,3,24,12,7,189,190,10,5,
		0,0,190,191,5,31,0,0,191,193,3,24,12,6,192,171,1,0,0,0,192,174,1,0,0,0,
		192,177,1,0,0,0,192,180,1,0,0,0,192,183,1,0,0,0,192,186,1,0,0,0,192,189,
		1,0,0,0,193,196,1,0,0,0,194,192,1,0,0,0,194,195,1,0,0,0,195,25,1,0,0,0,
		196,194,1,0,0,0,197,198,5,44,0,0,198,200,5,13,0,0,199,201,3,28,14,0,200,
		199,1,0,0,0,200,201,1,0,0,0,201,202,1,0,0,0,202,203,5,14,0,0,203,27,1,
		0,0,0,204,209,3,24,12,0,205,206,5,15,0,0,206,208,3,24,12,0,207,205,1,0,
		0,0,208,211,1,0,0,0,209,207,1,0,0,0,209,210,1,0,0,0,210,29,1,0,0,0,211,
		209,1,0,0,0,212,220,5,44,0,0,213,220,5,46,0,0,214,220,5,45,0,0,215,220,
		5,47,0,0,216,220,5,33,0,0,217,220,5,34,0,0,218,220,3,32,16,0,219,212,1,
		0,0,0,219,213,1,0,0,0,219,214,1,0,0,0,219,215,1,0,0,0,219,216,1,0,0,0,
		219,217,1,0,0,0,219,218,1,0,0,0,220,31,1,0,0,0,221,223,5,16,0,0,222,224,
		3,28,14,0,223,222,1,0,0,0,223,224,1,0,0,0,224,225,1,0,0,0,225,226,5,17,
		0,0,226,33,1,0,0,0,18,38,43,47,56,74,78,118,124,136,143,154,169,192,194,
		200,209,219,223
	]

	public
	static let _ATN = try! ATNDeserializer().deserialize(_serializedATN)
}