// Generated from Plato.g4 by ANTLR 4.13.1
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
                 T__17 = 18, EXP = 19, MUL = 20, DIV = 21, MOD = 22, PLUS = 23, 
                 MINUS = 24, LT = 25, LTE = 26, GT = 27, GTE = 28, EQUAL = 29, 
                 DIF = 30, AND = 31, OR = 32, NOT = 33, TRUE = 34, FALSE = 35, 
                 ASSIGN = 36, MUL_ASSIGN = 37, DIV_ASSIGN = 38, MOD_ASSIGN = 39, 
                 ADD_ASSIGN = 40, SUB_ASSIGN = 41, ID = 42, FLOAT = 43, 
                 INT = 44, STRING = 45, NEWLINE = 46, WS = 47, COMMENT = 48, 
                 COMMENT_LONG = 49
	}

	public
	static let RULE_program = 0, RULE_statements = 1, RULE_statement = 2, RULE_assignmentStatement = 3, 
            RULE_selectionStatement = 4, RULE_selectionElseIf = 5, RULE_selectionElse = 6, 
            RULE_controlFlowStatement = 7, RULE_functionDeclaration = 8, 
            RULE_functionArguments = 9, RULE_functionStatements = 10, RULE_expression = 11, 
            RULE_functionCall = 12, RULE_parameterList = 13, RULE_element = 14, 
            RULE_array = 15

	public
	static let ruleNames: [String] = [
		"program", "statements", "statement", "assignmentStatement", "selectionStatement", 
		"selectionElseIf", "selectionElse", "controlFlowStatement", "functionDeclaration", 
		"functionArguments", "functionStatements", "expression", "functionCall", 
		"parameterList", "element", "array"
	]

	private static let _LITERAL_NAMES: [String?] = [
		nil, "';'", "'if'", "'{'", "'}'", "'else'", "'while'", "'for'", "'in'", 
		"'from'", "'to'", "'by'", "'func'", "'('", "')'", "','", "'return'", "'['", 
		"']'", "'^'", "'*'", "'/'", "'%'", "'+'", "'-'", "'<'", "'<='", "'>'", 
		"'>='", "'=='", "'!='", "'and'", "'or'", "'!'", "'TRUE'", "'FALSE'", "'='", 
		"'*='", "'/='", "'%='", "'+='", "'-='"
	]
	private static let _SYMBOLIC_NAMES: [String?] = [
		nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 
		nil, nil, nil, nil, nil, "EXP", "MUL", "DIV", "MOD", "PLUS", "MINUS", 
		"LT", "LTE", "GT", "GTE", "EQUAL", "DIF", "AND", "OR", "NOT", "TRUE", 
		"FALSE", "ASSIGN", "MUL_ASSIGN", "DIV_ASSIGN", "MOD_ASSIGN", "ADD_ASSIGN", 
		"SUB_ASSIGN", "ID", "FLOAT", "INT", "STRING", "NEWLINE", "WS", "COMMENT", 
		"COMMENT_LONG"
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
		 	setState(32)
		 	try statements()
		 	setState(33)
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
		 	setState(41)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,1,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(36)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 			if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 66030852518084) != 0)) {
		 				setState(35)
		 				try statement()

		 			}

		 			setState(38)
		 			_la = try _input.LA(1)
		 			if (!(_la == PlatoParser.Tokens.T__0.rawValue || _la == PlatoParser.Tokens.NEWLINE.rawValue)) {
		 			try _errHandler.recoverInline(self)
		 			}
		 			else {
		 				_errHandler.reportMatch(self)
		 				try consume()
		 			}

		 	 
		 		}
		 		setState(43)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,1,_ctx)
		 	}
		 	setState(45)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,2,_ctx)) {
		 	case 1:
		 		setState(44)
		 		try statement()

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
		 	setState(52)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,3, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(47)
		 		try assignmentStatement()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(48)
		 		try selectionStatement()

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(49)
		 		try controlFlowStatement()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(50)
		 		try functionDeclaration()

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(51)
		 		try expression(0)

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
		try enterRule(_localctx, 6, PlatoParser.RULE_assignmentStatement)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(54)
		 	try match(PlatoParser.Tokens.ID.rawValue)
		 	setState(55)
		 	_localctx.castdown(AssignmentStatementContext.self).op = try _input.LT(1)
		 	_la = try _input.LA(1)
		 	if (!(((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4329327034368) != 0))) {
		 		_localctx.castdown(AssignmentStatementContext.self).op = try _errHandler.recoverInline(self) as Token
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}
		 	setState(56)
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
		try enterRule(_localctx, 8, PlatoParser.RULE_selectionStatement)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	try enterOuterAlt(_localctx, 1)
		 	setState(58)
		 	try match(PlatoParser.Tokens.T__1.rawValue)
		 	setState(59)
		 	try expression(0)
		 	setState(60)
		 	try match(PlatoParser.Tokens.T__2.rawValue)
		 	setState(61)
		 	try statements()
		 	setState(62)
		 	try match(PlatoParser.Tokens.T__3.rawValue)
		 	setState(66)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,4,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(63)
		 			try selectionElseIf()

		 	 
		 		}
		 		setState(68)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,4,_ctx)
		 	}
		 	setState(70)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == PlatoParser.Tokens.T__4.rawValue) {
		 		setState(69)
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
		try enterRule(_localctx, 10, PlatoParser.RULE_selectionElseIf)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(72)
		 	try match(PlatoParser.Tokens.T__4.rawValue)
		 	setState(73)
		 	try match(PlatoParser.Tokens.T__1.rawValue)
		 	setState(74)
		 	try expression(0)
		 	setState(75)
		 	try match(PlatoParser.Tokens.T__2.rawValue)
		 	setState(76)
		 	try statements()
		 	setState(77)
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
		try enterRule(_localctx, 12, PlatoParser.RULE_selectionElse)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(79)
		 	try match(PlatoParser.Tokens.T__4.rawValue)
		 	setState(80)
		 	try match(PlatoParser.Tokens.T__2.rawValue)
		 	setState(81)
		 	try statements()
		 	setState(82)
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
		try enterRule(_localctx, 14, PlatoParser.RULE_controlFlowStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(110)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,6, _ctx)) {
		 	case 1:
		 		_localctx =  WhileStatementContext(_localctx);
		 		try enterOuterAlt(_localctx, 1)
		 		setState(84)
		 		try match(PlatoParser.Tokens.T__5.rawValue)
		 		setState(85)
		 		try expression(0)
		 		setState(86)
		 		try match(PlatoParser.Tokens.T__2.rawValue)
		 		setState(87)
		 		try statements()
		 		setState(88)
		 		try match(PlatoParser.Tokens.T__3.rawValue)

		 		break
		 	case 2:
		 		_localctx =  ForInStatementContext(_localctx);
		 		try enterOuterAlt(_localctx, 2)
		 		setState(90)
		 		try match(PlatoParser.Tokens.T__6.rawValue)
		 		setState(91)
		 		try match(PlatoParser.Tokens.ID.rawValue)
		 		setState(92)
		 		try match(PlatoParser.Tokens.T__7.rawValue)
		 		setState(93)
		 		try expression(0)
		 		setState(94)
		 		try match(PlatoParser.Tokens.T__2.rawValue)
		 		setState(95)
		 		try statements()
		 		setState(96)
		 		try match(PlatoParser.Tokens.T__3.rawValue)

		 		break
		 	case 3:
		 		_localctx =  ForFromToByStatementContext(_localctx);
		 		try enterOuterAlt(_localctx, 3)
		 		setState(98)
		 		try match(PlatoParser.Tokens.T__6.rawValue)
		 		setState(99)
		 		try match(PlatoParser.Tokens.ID.rawValue)
		 		setState(100)
		 		try match(PlatoParser.Tokens.T__8.rawValue)
		 		setState(101)
		 		try expression(0)
		 		setState(102)
		 		try match(PlatoParser.Tokens.T__9.rawValue)
		 		setState(103)
		 		try expression(0)
		 		setState(104)
		 		try match(PlatoParser.Tokens.T__10.rawValue)
		 		setState(105)
		 		try expression(0)
		 		setState(106)
		 		try match(PlatoParser.Tokens.T__2.rawValue)
		 		setState(107)
		 		try statements()
		 		setState(108)
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
			func functionStatements() -> FunctionStatementsContext? {
				return getRuleContext(FunctionStatementsContext.self, 0)
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
		try enterRule(_localctx, 16, PlatoParser.RULE_functionDeclaration)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(112)
		 	try match(PlatoParser.Tokens.T__11.rawValue)
		 	setState(113)
		 	try match(PlatoParser.Tokens.ID.rawValue)
		 	setState(114)
		 	try match(PlatoParser.Tokens.T__12.rawValue)
		 	setState(116)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == PlatoParser.Tokens.ID.rawValue) {
		 		setState(115)
		 		try functionArguments()

		 	}

		 	setState(118)
		 	try match(PlatoParser.Tokens.T__13.rawValue)
		 	setState(119)
		 	try match(PlatoParser.Tokens.T__2.rawValue)
		 	setState(120)
		 	try functionStatements()
		 	setState(121)
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
		try enterRule(_localctx, 18, PlatoParser.RULE_functionArguments)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(123)
		 	try match(PlatoParser.Tokens.ID.rawValue)
		 	setState(128)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == PlatoParser.Tokens.T__14.rawValue) {
		 		setState(124)
		 		try match(PlatoParser.Tokens.T__14.rawValue)
		 		setState(125)
		 		try match(PlatoParser.Tokens.ID.rawValue)


		 		setState(130)
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

	public class FunctionStatementsContext: ParserRuleContext {
			open
			func statements() -> StatementsContext? {
				return getRuleContext(StatementsContext.self, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
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
			return PlatoParser.RULE_functionStatements
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitFunctionStatements(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitFunctionStatements(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func functionStatements() throws -> FunctionStatementsContext {
		var _localctx: FunctionStatementsContext
		_localctx = FunctionStatementsContext(_ctx, getState())
		try enterRule(_localctx, 20, PlatoParser.RULE_functionStatements)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(131)
		 	try statements()
		 	setState(133)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == PlatoParser.Tokens.T__15.rawValue) {
		 		setState(132)
		 		try match(PlatoParser.Tokens.T__15.rawValue)

		 	}

		 	setState(136)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 66030852513792) != 0)) {
		 		setState(135)
		 		try expression(0)

		 	}

		 	setState(141)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == PlatoParser.Tokens.NEWLINE.rawValue) {
		 		setState(138)
		 		try match(PlatoParser.Tokens.NEWLINE.rawValue)


		 		setState(143)
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
//		var _prevctx: ExpressionContext = _localctx
		let _startState: Int = 22
		try enterRecursionRule(_localctx, 22, PlatoParser.RULE_expression, _p)
		var _la: Int = 0
		defer {
	    		try! unrollRecursionContexts(_parentctx)
	    }
		do {
			var _alt: Int
			try enterOuterAlt(_localctx, 1)
			setState(172)
			try _errHandler.sync(self)
			switch(try getInterpreter().adaptivePredict(_input,14, _ctx)) {
			case 1:
				_localctx = SubscriptExpresionContext(_localctx)
				_ctx = _localctx
//				_prevctx = _localctx

				setState(148)
				try _errHandler.sync(self)
				switch(try getInterpreter().adaptivePredict(_input,12, _ctx)) {
				case 1:
					setState(145)
					try match(PlatoParser.Tokens.ID.rawValue)

					break
				case 2:
					setState(146)
					try functionCall()

					break
				case 3:
					setState(147)
					try array()

					break
				default: break
				}
				setState(150)
				try match(PlatoParser.Tokens.T__16.rawValue)
				setState(151)
				try expression(0)
				setState(152)
				try match(PlatoParser.Tokens.T__17.rawValue)
				setState(159)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,13,_ctx)
				while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
					if ( _alt==1 ) {
						setState(153)
						try match(PlatoParser.Tokens.T__16.rawValue)
						setState(154)
						try expression(0)
						setState(155)
						try match(PlatoParser.Tokens.T__17.rawValue)

				 
					}
					setState(161)
					try _errHandler.sync(self)
					_alt = try getInterpreter().adaptivePredict(_input,13,_ctx)
				}

				break
			case 2:
				_localctx = UnaryExpresionContext(_localctx)
				_ctx = _localctx
//				_prevctx = _localctx
				setState(162)
				_localctx.castdown(UnaryExpresionContext.self).op = try _input.LT(1)
				_la = try _input.LA(1)
				if (!(_la == PlatoParser.Tokens.PLUS.rawValue || _la == PlatoParser.Tokens.MINUS.rawValue)) {
					_localctx.castdown(UnaryExpresionContext.self).op = try _errHandler.recoverInline(self) as Token
				}
				else {
					_errHandler.reportMatch(self)
					try consume()
				}
				setState(163)
				try expression(11)

				break
			case 3:
				_localctx = NotExpresionContext(_localctx)
				_ctx = _localctx
//				_prevctx = _localctx
				setState(164)
				try match(PlatoParser.Tokens.NOT.rawValue)
				setState(165)
				try expression(10)

				break
			case 4:
				_localctx = FunctionCallExpresionContext(_localctx)
				_ctx = _localctx
//				_prevctx = _localctx
				setState(166)
				try functionCall()

				break
			case 5:
				_localctx = ParenthesesExpresionContext(_localctx)
				_ctx = _localctx
//				_prevctx = _localctx
				setState(167)
				try match(PlatoParser.Tokens.T__12.rawValue)
				setState(168)
				try expression(0)
				setState(169)
				try match(PlatoParser.Tokens.T__13.rawValue)

				break
			case 6:
				_localctx = TypeExpresionContext(_localctx)
				_ctx = _localctx
//				_prevctx = _localctx
				setState(171)
				try element()

				break
			default: break
			}
			_ctx!.stop = try _input.LT(-1)
			setState(197)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,16,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
//					_prevctx = _localctx
					setState(195)
					try _errHandler.sync(self)
					switch(try getInterpreter().adaptivePredict(_input,15, _ctx)) {
					case 1:
						_localctx = ExponentExpresionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(174)
						if (!(precpred(_ctx, 12))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 12)"))
						}
						setState(175)
						try match(PlatoParser.Tokens.EXP.rawValue)
						setState(176)
						try expression(12)

						break
					case 2:
						_localctx = MulExpresionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(177)
						if (!(precpred(_ctx, 9))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 9)"))
						}
						setState(178)
						_localctx.castdown(MulExpresionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 7340032) != 0))) {
							_localctx.castdown(MulExpresionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(179)
						try expression(10)

						break
					case 3:
						_localctx = AddExpresionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(180)
						if (!(precpred(_ctx, 8))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 8)"))
						}
						setState(181)
						_localctx.castdown(AddExpresionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(_la == PlatoParser.Tokens.PLUS.rawValue || _la == PlatoParser.Tokens.MINUS.rawValue)) {
							_localctx.castdown(AddExpresionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(182)
						try expression(9)

						break
					case 4:
						_localctx = CompareExpresionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(183)
						if (!(precpred(_ctx, 7))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 7)"))
						}
						setState(184)
						_localctx.castdown(CompareExpresionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 2113929216) != 0))) {
							_localctx.castdown(CompareExpresionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(185)
						try expression(8)

						break
					case 5:
						_localctx = EqualityExpresionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(186)
						if (!(precpred(_ctx, 6))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 6)"))
						}
						setState(187)
						_localctx.castdown(EqualityExpresionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(_la == PlatoParser.Tokens.EQUAL.rawValue || _la == PlatoParser.Tokens.DIF.rawValue)) {
							_localctx.castdown(EqualityExpresionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(188)
						try expression(7)

						break
					case 6:
						_localctx = AndExpresionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(189)
						if (!(precpred(_ctx, 5))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 5)"))
						}
						setState(190)
						try match(PlatoParser.Tokens.AND.rawValue)
						setState(191)
						try expression(6)

						break
					case 7:
						_localctx = OrExpresionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(192)
						if (!(precpred(_ctx, 4))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 4)"))
						}
						setState(193)
						try match(PlatoParser.Tokens.OR.rawValue)
						setState(194)
						try expression(5)

						break
					default: break
					}
			 
				}
				setState(199)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,16,_ctx)
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
		try enterRule(_localctx, 24, PlatoParser.RULE_functionCall)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(200)
		 	try match(PlatoParser.Tokens.ID.rawValue)
		 	setState(201)
		 	try match(PlatoParser.Tokens.T__12.rawValue)
		 	setState(203)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 66030852513792) != 0)) {
		 		setState(202)
		 		try parameterList()

		 	}

		 	setState(205)
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
		try enterRule(_localctx, 26, PlatoParser.RULE_parameterList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(207)
		 	try expression(0)
		 	setState(212)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == PlatoParser.Tokens.T__14.rawValue) {
		 		setState(208)
		 		try match(PlatoParser.Tokens.T__14.rawValue)
		 		setState(209)
		 		try expression(0)


		 		setState(214)
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
		try enterRule(_localctx, 28, PlatoParser.RULE_element)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(222)
		 	try _errHandler.sync(self)
		 	switch (PlatoParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .ID:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(215)
		 		try match(PlatoParser.Tokens.ID.rawValue)

		 		break

		 	case .INT:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(216)
		 		try match(PlatoParser.Tokens.INT.rawValue)

		 		break

		 	case .FLOAT:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(217)
		 		try match(PlatoParser.Tokens.FLOAT.rawValue)

		 		break

		 	case .STRING:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(218)
		 		try match(PlatoParser.Tokens.STRING.rawValue)

		 		break

		 	case .TRUE:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(219)
		 		try match(PlatoParser.Tokens.TRUE.rawValue)

		 		break

		 	case .FALSE:
		 		try enterOuterAlt(_localctx, 6)
		 		setState(220)
		 		try match(PlatoParser.Tokens.FALSE.rawValue)

		 		break

		 	case .T__16:
		 		try enterOuterAlt(_localctx, 7)
		 		setState(221)
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
		try enterRule(_localctx, 30, PlatoParser.RULE_array)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(224)
		 	try match(PlatoParser.Tokens.T__16.rawValue)
		 	setState(226)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 66030852513792) != 0)) {
		 		setState(225)
		 		try parameterList()

		 	}

		 	setState(228)
		 	try match(PlatoParser.Tokens.T__17.rawValue)

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
		case  11:
			return try expression_sempred(_localctx?.castdown(ExpressionContext.self), predIndex)
	    default: return true
		}
	}
	private func expression_sempred(_ _localctx: ExpressionContext!,  _ predIndex: Int) throws -> Bool {
		switch (predIndex) {
		    case 0:return precpred(_ctx, 12)
		    case 1:return precpred(_ctx, 9)
		    case 2:return precpred(_ctx, 8)
		    case 3:return precpred(_ctx, 7)
		    case 4:return precpred(_ctx, 6)
		    case 5:return precpred(_ctx, 5)
		    case 6:return precpred(_ctx, 4)
		    default: return true
		}
	}

	static let _serializedATN:[Int] = [
		4,1,49,231,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,6,2,7,
		7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,2,12,7,12,2,13,7,13,2,14,7,14,
		2,15,7,15,1,0,1,0,1,0,1,1,3,1,37,8,1,1,1,5,1,40,8,1,10,1,12,1,43,9,1,1,
		1,3,1,46,8,1,1,2,1,2,1,2,1,2,1,2,3,2,53,8,2,1,3,1,3,1,3,1,3,1,4,1,4,1,
		4,1,4,1,4,1,4,5,4,65,8,4,10,4,12,4,68,9,4,1,4,3,4,71,8,4,1,5,1,5,1,5,1,
		5,1,5,1,5,1,5,1,6,1,6,1,6,1,6,1,6,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,
		1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,3,
		7,111,8,7,1,8,1,8,1,8,1,8,3,8,117,8,8,1,8,1,8,1,8,1,8,1,8,1,9,1,9,1,9,
		5,9,127,8,9,10,9,12,9,130,9,9,1,10,1,10,3,10,134,8,10,1,10,3,10,137,8,
		10,1,10,5,10,140,8,10,10,10,12,10,143,9,10,1,11,1,11,1,11,1,11,3,11,149,
		8,11,1,11,1,11,1,11,1,11,1,11,1,11,1,11,5,11,158,8,11,10,11,12,11,161,
		9,11,1,11,1,11,1,11,1,11,1,11,1,11,1,11,1,11,1,11,1,11,3,11,173,8,11,1,
		11,1,11,1,11,1,11,1,11,1,11,1,11,1,11,1,11,1,11,1,11,1,11,1,11,1,11,1,
		11,1,11,1,11,1,11,1,11,1,11,1,11,5,11,196,8,11,10,11,12,11,199,9,11,1,
		12,1,12,1,12,3,12,204,8,12,1,12,1,12,1,13,1,13,1,13,5,13,211,8,13,10,13,
		12,13,214,9,13,1,14,1,14,1,14,1,14,1,14,1,14,1,14,3,14,223,8,14,1,15,1,
		15,3,15,227,8,15,1,15,1,15,1,15,0,1,22,16,0,2,4,6,8,10,12,14,16,18,20,
		22,24,26,28,30,0,6,2,0,1,1,46,46,1,0,36,41,1,0,23,24,1,0,20,22,1,0,25,
		30,1,0,29,30,254,0,32,1,0,0,0,2,41,1,0,0,0,4,52,1,0,0,0,6,54,1,0,0,0,8,
		58,1,0,0,0,10,72,1,0,0,0,12,79,1,0,0,0,14,110,1,0,0,0,16,112,1,0,0,0,18,
		123,1,0,0,0,20,131,1,0,0,0,22,172,1,0,0,0,24,200,1,0,0,0,26,207,1,0,0,
		0,28,222,1,0,0,0,30,224,1,0,0,0,32,33,3,2,1,0,33,34,5,0,0,1,34,1,1,0,0,
		0,35,37,3,4,2,0,36,35,1,0,0,0,36,37,1,0,0,0,37,38,1,0,0,0,38,40,7,0,0,
		0,39,36,1,0,0,0,40,43,1,0,0,0,41,39,1,0,0,0,41,42,1,0,0,0,42,45,1,0,0,
		0,43,41,1,0,0,0,44,46,3,4,2,0,45,44,1,0,0,0,45,46,1,0,0,0,46,3,1,0,0,0,
		47,53,3,6,3,0,48,53,3,8,4,0,49,53,3,14,7,0,50,53,3,16,8,0,51,53,3,22,11,
		0,52,47,1,0,0,0,52,48,1,0,0,0,52,49,1,0,0,0,52,50,1,0,0,0,52,51,1,0,0,
		0,53,5,1,0,0,0,54,55,5,42,0,0,55,56,7,1,0,0,56,57,3,22,11,0,57,7,1,0,0,
		0,58,59,5,2,0,0,59,60,3,22,11,0,60,61,5,3,0,0,61,62,3,2,1,0,62,66,5,4,
		0,0,63,65,3,10,5,0,64,63,1,0,0,0,65,68,1,0,0,0,66,64,1,0,0,0,66,67,1,0,
		0,0,67,70,1,0,0,0,68,66,1,0,0,0,69,71,3,12,6,0,70,69,1,0,0,0,70,71,1,0,
		0,0,71,9,1,0,0,0,72,73,5,5,0,0,73,74,5,2,0,0,74,75,3,22,11,0,75,76,5,3,
		0,0,76,77,3,2,1,0,77,78,5,4,0,0,78,11,1,0,0,0,79,80,5,5,0,0,80,81,5,3,
		0,0,81,82,3,2,1,0,82,83,5,4,0,0,83,13,1,0,0,0,84,85,5,6,0,0,85,86,3,22,
		11,0,86,87,5,3,0,0,87,88,3,2,1,0,88,89,5,4,0,0,89,111,1,0,0,0,90,91,5,
		7,0,0,91,92,5,42,0,0,92,93,5,8,0,0,93,94,3,22,11,0,94,95,5,3,0,0,95,96,
		3,2,1,0,96,97,5,4,0,0,97,111,1,0,0,0,98,99,5,7,0,0,99,100,5,42,0,0,100,
		101,5,9,0,0,101,102,3,22,11,0,102,103,5,10,0,0,103,104,3,22,11,0,104,105,
		5,11,0,0,105,106,3,22,11,0,106,107,5,3,0,0,107,108,3,2,1,0,108,109,5,4,
		0,0,109,111,1,0,0,0,110,84,1,0,0,0,110,90,1,0,0,0,110,98,1,0,0,0,111,15,
		1,0,0,0,112,113,5,12,0,0,113,114,5,42,0,0,114,116,5,13,0,0,115,117,3,18,
		9,0,116,115,1,0,0,0,116,117,1,0,0,0,117,118,1,0,0,0,118,119,5,14,0,0,119,
		120,5,3,0,0,120,121,3,20,10,0,121,122,5,4,0,0,122,17,1,0,0,0,123,128,5,
		42,0,0,124,125,5,15,0,0,125,127,5,42,0,0,126,124,1,0,0,0,127,130,1,0,0,
		0,128,126,1,0,0,0,128,129,1,0,0,0,129,19,1,0,0,0,130,128,1,0,0,0,131,133,
		3,2,1,0,132,134,5,16,0,0,133,132,1,0,0,0,133,134,1,0,0,0,134,136,1,0,0,
		0,135,137,3,22,11,0,136,135,1,0,0,0,136,137,1,0,0,0,137,141,1,0,0,0,138,
		140,5,46,0,0,139,138,1,0,0,0,140,143,1,0,0,0,141,139,1,0,0,0,141,142,1,
		0,0,0,142,21,1,0,0,0,143,141,1,0,0,0,144,148,6,11,-1,0,145,149,5,42,0,
		0,146,149,3,24,12,0,147,149,3,30,15,0,148,145,1,0,0,0,148,146,1,0,0,0,
		148,147,1,0,0,0,149,150,1,0,0,0,150,151,5,17,0,0,151,152,3,22,11,0,152,
		159,5,18,0,0,153,154,5,17,0,0,154,155,3,22,11,0,155,156,5,18,0,0,156,158,
		1,0,0,0,157,153,1,0,0,0,158,161,1,0,0,0,159,157,1,0,0,0,159,160,1,0,0,
		0,160,173,1,0,0,0,161,159,1,0,0,0,162,163,7,2,0,0,163,173,3,22,11,11,164,
		165,5,33,0,0,165,173,3,22,11,10,166,173,3,24,12,0,167,168,5,13,0,0,168,
		169,3,22,11,0,169,170,5,14,0,0,170,173,1,0,0,0,171,173,3,28,14,0,172,144,
		1,0,0,0,172,162,1,0,0,0,172,164,1,0,0,0,172,166,1,0,0,0,172,167,1,0,0,
		0,172,171,1,0,0,0,173,197,1,0,0,0,174,175,10,12,0,0,175,176,5,19,0,0,176,
		196,3,22,11,12,177,178,10,9,0,0,178,179,7,3,0,0,179,196,3,22,11,10,180,
		181,10,8,0,0,181,182,7,2,0,0,182,196,3,22,11,9,183,184,10,7,0,0,184,185,
		7,4,0,0,185,196,3,22,11,8,186,187,10,6,0,0,187,188,7,5,0,0,188,196,3,22,
		11,7,189,190,10,5,0,0,190,191,5,31,0,0,191,196,3,22,11,6,192,193,10,4,
		0,0,193,194,5,32,0,0,194,196,3,22,11,5,195,174,1,0,0,0,195,177,1,0,0,0,
		195,180,1,0,0,0,195,183,1,0,0,0,195,186,1,0,0,0,195,189,1,0,0,0,195,192,
		1,0,0,0,196,199,1,0,0,0,197,195,1,0,0,0,197,198,1,0,0,0,198,23,1,0,0,0,
		199,197,1,0,0,0,200,201,5,42,0,0,201,203,5,13,0,0,202,204,3,26,13,0,203,
		202,1,0,0,0,203,204,1,0,0,0,204,205,1,0,0,0,205,206,5,14,0,0,206,25,1,
		0,0,0,207,212,3,22,11,0,208,209,5,15,0,0,209,211,3,22,11,0,210,208,1,0,
		0,0,211,214,1,0,0,0,212,210,1,0,0,0,212,213,1,0,0,0,213,27,1,0,0,0,214,
		212,1,0,0,0,215,223,5,42,0,0,216,223,5,44,0,0,217,223,5,43,0,0,218,223,
		5,45,0,0,219,223,5,34,0,0,220,223,5,35,0,0,221,223,3,30,15,0,222,215,1,
		0,0,0,222,216,1,0,0,0,222,217,1,0,0,0,222,218,1,0,0,0,222,219,1,0,0,0,
		222,220,1,0,0,0,222,221,1,0,0,0,223,29,1,0,0,0,224,226,5,17,0,0,225,227,
		3,26,13,0,226,225,1,0,0,0,226,227,1,0,0,0,227,228,1,0,0,0,228,229,5,18,
		0,0,229,31,1,0,0,0,21,36,41,45,52,66,70,110,116,128,133,136,141,148,159,
		172,195,197,203,212,222,226
	]

	public
	static let _ATN = try! ATNDeserializer().deserialize(_serializedATN)
}
