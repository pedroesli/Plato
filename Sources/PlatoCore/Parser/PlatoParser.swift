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
                 T__17 = 18, EXP = 19, MUL = 20, DIV = 21, MOD = 22, PLUS = 23, 
                 MINUS = 24, LT = 25, LTE = 26, GT = 27, GTE = 28, EQUAL = 29, 
                 DIF = 30, AND = 31, OR = 32, NOT = 33, TRUE = 34, FALSE = 35, 
                 ASSIGN = 36, MUL_ASSIGN = 37, DIV_ASSIGN = 38, MOD_ASSIGN = 39, 
                 ADD_ASSIGN = 40, SUB_ASSIGN = 41, RETURN = 42, BREAK = 43, 
                 CONTINUE = 44, ANY_TYPE = 45, BOOL_TYPE = 46, INT_TYPE = 47, 
                 FLOAT_TYPE = 48, NUMBER_TYPE = 49, STRING_TYPE = 50, ARRAY_TYPE = 51, 
                 ID = 52, FLOAT = 53, INT = 54, STRING = 55, NEWLINE = 56, 
                 WS = 57, COMMENT = 58, COMMENT_LONG = 59
	}

	public
	static let RULE_program = 0, RULE_statements = 1, RULE_statement = 2, RULE_expressionStatement = 3, 
            RULE_breakStatement = 4, RULE_continueStatement = 5, RULE_returnStatement = 6, 
            RULE_assignmentStatement = 7, RULE_idStatement = 8, RULE_selectionStatement = 9, 
            RULE_elseIfStatement = 10, RULE_elseStatement = 11, RULE_controlFlowStatement = 12, 
            RULE_functionDeclaration = 13, RULE_functionArguments = 14, 
            RULE_expression = 15, RULE_functionCall = 16, RULE_parameterList = 17, 
            RULE_element = 18, RULE_array = 19, RULE_idType = 20

	public
	static let ruleNames: [String] = [
		"program", "statements", "statement", "expressionStatement", "breakStatement", 
		"continueStatement", "returnStatement", "assignmentStatement", "idStatement", 
		"selectionStatement", "elseIfStatement", "elseStatement", "controlFlowStatement", 
		"functionDeclaration", "functionArguments", "expression", "functionCall", 
		"parameterList", "element", "array", "idType"
	]

	private static let _LITERAL_NAMES: [String?] = [
		nil, "';'", "'if'", "'{'", "'}'", "'else'", "'while'", "'for'", "'in'", 
		"'from'", "'to'", "'by'", "'func'", "'('", "')'", "','", "'['", "']'", 
		"':'", "'^'", "'*'", "'/'", "'%'", "'+'", "'-'", "'<'", "'<='", "'>'", 
		"'>='", "'=='", "'!='", "'and'", "'or'", "'!'", "'true'", "'false'", "'='", 
		"'*='", "'/='", "'%='", "'+='", "'-='", "'return'", "'break'", "'continue'", 
		"'any'", "'bool'", "'int'", "'float'", "'number'", "'string'", "'array'"
	]
	private static let _SYMBOLIC_NAMES: [String?] = [
		nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 
		nil, nil, nil, nil, nil, "EXP", "MUL", "DIV", "MOD", "PLUS", "MINUS", 
		"LT", "LTE", "GT", "GTE", "EQUAL", "DIF", "AND", "OR", "NOT", "TRUE", 
		"FALSE", "ASSIGN", "MUL_ASSIGN", "DIV_ASSIGN", "MOD_ASSIGN", "ADD_ASSIGN", 
		"SUB_ASSIGN", "RETURN", "BREAK", "CONTINUE", "ANY_TYPE", "BOOL_TYPE", 
		"INT_TYPE", "FLOAT_TYPE", "NUMBER_TYPE", "STRING_TYPE", "ARRAY_TYPE", 
		"ID", "FLOAT", "INT", "STRING", "NEWLINE", "WS", "COMMENT", "COMMENT_LONG"
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
		 	setState(42)
		 	try statements()
		 	setState(43)
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
		 	setState(51)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,1,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(46)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 			if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 67584840890921156) != 0)) {
		 				setState(45)
		 				try statement()

		 			}

		 			setState(48)
		 			_la = try _input.LA(1)
		 			if (!(_la == PlatoParser.Tokens.T__0.rawValue || _la == PlatoParser.Tokens.NEWLINE.rawValue)) {
		 			try _errHandler.recoverInline(self)
		 			}
		 			else {
		 				_errHandler.reportMatch(self)
		 				try consume()
		 			}

		 	 
		 		}
		 		setState(53)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,1,_ctx)
		 	}
		 	setState(55)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 67584840890921156) != 0)) {
		 		setState(54)
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
			func expressionStatement() -> ExpressionStatementContext? {
				return getRuleContext(ExpressionStatementContext.self, 0)
			}
			open
			func breakStatement() -> BreakStatementContext? {
				return getRuleContext(BreakStatementContext.self, 0)
			}
			open
			func continueStatement() -> ContinueStatementContext? {
				return getRuleContext(ContinueStatementContext.self, 0)
			}
			open
			func returnStatement() -> ReturnStatementContext? {
				return getRuleContext(ReturnStatementContext.self, 0)
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
		 	setState(65)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,3, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(57)
		 		try assignmentStatement()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(58)
		 		try selectionStatement()

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(59)
		 		try controlFlowStatement()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(60)
		 		try functionDeclaration()

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(61)
		 		try expressionStatement()

		 		break
		 	case 6:
		 		try enterOuterAlt(_localctx, 6)
		 		setState(62)
		 		try breakStatement()

		 		break
		 	case 7:
		 		try enterOuterAlt(_localctx, 7)
		 		setState(63)
		 		try continueStatement()

		 		break
		 	case 8:
		 		try enterOuterAlt(_localctx, 8)
		 		setState(64)
		 		try returnStatement()

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

	public class ExpressionStatementContext: ParserRuleContext {
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return PlatoParser.RULE_expressionStatement
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitExpressionStatement(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitExpressionStatement(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func expressionStatement() throws -> ExpressionStatementContext {
		var _localctx: ExpressionStatementContext
		_localctx = ExpressionStatementContext(_ctx, getState())
		try enterRule(_localctx, 6, PlatoParser.RULE_expressionStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(67)
		 	try expression(0)

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
		try enterRule(_localctx, 8, PlatoParser.RULE_breakStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(69)
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
		try enterRule(_localctx, 10, PlatoParser.RULE_continueStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(71)
		 	try match(PlatoParser.Tokens.CONTINUE.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ReturnStatementContext: ParserRuleContext {
			open
			func RETURN() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.RETURN.rawValue, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return PlatoParser.RULE_returnStatement
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitReturnStatement(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitReturnStatement(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func returnStatement() throws -> ReturnStatementContext {
		var _localctx: ReturnStatementContext
		_localctx = ReturnStatementContext(_ctx, getState())
		try enterRule(_localctx, 12, PlatoParser.RULE_returnStatement)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(73)
		 	try match(PlatoParser.Tokens.RETURN.rawValue)
		 	setState(75)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 67554054565339136) != 0)) {
		 		setState(74)
		 		try expression(0)

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
		override open
		func getRuleIndex() -> Int {
			return PlatoParser.RULE_assignmentStatement
		}
	}
	public class OperationAssignmentStatementContext: AssignmentStatementContext {
		public var op: Token!
			open
			func ID() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.ID.rawValue, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
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

		public
		init(_ ctx: AssignmentStatementContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitOperationAssignmentStatement(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitOperationAssignmentStatement(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class VariableAssignmentStatementContext: AssignmentStatementContext {
			open
			func idStatement() -> IdStatementContext? {
				return getRuleContext(IdStatementContext.self, 0)
			}
			open
			func ASSIGN() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.ASSIGN.rawValue, 0)
			}
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}

		public
		init(_ ctx: AssignmentStatementContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitVariableAssignmentStatement(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitVariableAssignmentStatement(self)
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
		try enterRule(_localctx, 14, PlatoParser.RULE_assignmentStatement)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(84)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,5, _ctx)) {
		 	case 1:
		 		_localctx =  VariableAssignmentStatementContext(_localctx);
		 		try enterOuterAlt(_localctx, 1)
		 		setState(77)
		 		try idStatement()
		 		setState(78)
		 		try match(PlatoParser.Tokens.ASSIGN.rawValue)
		 		setState(79)
		 		try expression(0)

		 		break
		 	case 2:
		 		_localctx =  OperationAssignmentStatementContext(_localctx);
		 		try enterOuterAlt(_localctx, 2)
		 		setState(81)
		 		try match(PlatoParser.Tokens.ID.rawValue)
		 		setState(82)
		 		_localctx.castdown(OperationAssignmentStatementContext.self).op = try _input.LT(1)
		 		_la = try _input.LA(1)
		 		if (!(((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4260607557632) != 0))) {
		 			_localctx.castdown(OperationAssignmentStatementContext.self).op = try _errHandler.recoverInline(self) as Token
		 		}
		 		else {
		 			_errHandler.reportMatch(self)
		 			try consume()
		 		}
		 		setState(83)
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

	public class IdStatementContext: ParserRuleContext {
			open
			func ID() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.ID.rawValue, 0)
			}
			open
			func idType() -> IdTypeContext? {
				return getRuleContext(IdTypeContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return PlatoParser.RULE_idStatement
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitIdStatement(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitIdStatement(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func idStatement() throws -> IdStatementContext {
		var _localctx: IdStatementContext
		_localctx = IdStatementContext(_ctx, getState())
		try enterRule(_localctx, 16, PlatoParser.RULE_idStatement)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(86)
		 	try match(PlatoParser.Tokens.ID.rawValue)
		 	setState(88)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == PlatoParser.Tokens.T__17.rawValue) {
		 		setState(87)
		 		try idType()

		 	}


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
			func elseIfStatement() -> [ElseIfStatementContext] {
				return getRuleContexts(ElseIfStatementContext.self)
			}
			open
			func elseIfStatement(_ i: Int) -> ElseIfStatementContext? {
				return getRuleContext(ElseIfStatementContext.self, i)
			}
			open
			func elseStatement() -> ElseStatementContext? {
				return getRuleContext(ElseStatementContext.self, 0)
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
		try enterRule(_localctx, 18, PlatoParser.RULE_selectionStatement)
		defer {
	    		try! exitRule()
	    }
		do {
			var _alt:Int
		 	try enterOuterAlt(_localctx, 1)
		 	setState(90)
		 	try match(PlatoParser.Tokens.T__1.rawValue)
		 	setState(91)
		 	try expression(0)
		 	setState(92)
		 	try match(PlatoParser.Tokens.T__2.rawValue)
		 	setState(93)
		 	try statements()
		 	setState(94)
		 	try match(PlatoParser.Tokens.T__3.rawValue)
		 	setState(98)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,7,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(95)
		 			try elseIfStatement()

		 	 
		 		}
		 		setState(100)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,7,_ctx)
		 	}
		 	setState(102)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,8,_ctx)) {
		 	case 1:
		 		setState(101)
		 		try elseStatement()

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

	public class ElseIfStatementContext: ParserRuleContext {
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
			open
			func statements() -> StatementsContext? {
				return getRuleContext(StatementsContext.self, 0)
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
			return PlatoParser.RULE_elseIfStatement
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitElseIfStatement(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitElseIfStatement(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func elseIfStatement() throws -> ElseIfStatementContext {
		var _localctx: ElseIfStatementContext
		_localctx = ElseIfStatementContext(_ctx, getState())
		try enterRule(_localctx, 20, PlatoParser.RULE_elseIfStatement)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(107)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == PlatoParser.Tokens.NEWLINE.rawValue) {
		 		setState(104)
		 		try match(PlatoParser.Tokens.NEWLINE.rawValue)


		 		setState(109)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(110)
		 	try match(PlatoParser.Tokens.T__4.rawValue)
		 	setState(111)
		 	try match(PlatoParser.Tokens.T__1.rawValue)
		 	setState(112)
		 	try expression(0)
		 	setState(113)
		 	try match(PlatoParser.Tokens.T__2.rawValue)
		 	setState(114)
		 	try statements()
		 	setState(115)
		 	try match(PlatoParser.Tokens.T__3.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ElseStatementContext: ParserRuleContext {
			open
			func statements() -> StatementsContext? {
				return getRuleContext(StatementsContext.self, 0)
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
			return PlatoParser.RULE_elseStatement
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitElseStatement(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitElseStatement(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func elseStatement() throws -> ElseStatementContext {
		var _localctx: ElseStatementContext
		_localctx = ElseStatementContext(_ctx, getState())
		try enterRule(_localctx, 22, PlatoParser.RULE_elseStatement)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(120)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == PlatoParser.Tokens.NEWLINE.rawValue) {
		 		setState(117)
		 		try match(PlatoParser.Tokens.NEWLINE.rawValue)


		 		setState(122)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(123)
		 	try match(PlatoParser.Tokens.T__4.rawValue)
		 	setState(124)
		 	try match(PlatoParser.Tokens.T__2.rawValue)
		 	setState(125)
		 	try statements()
		 	setState(126)
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
		try enterRule(_localctx, 24, PlatoParser.RULE_controlFlowStatement)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(154)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,11, _ctx)) {
		 	case 1:
		 		_localctx =  WhileStatementContext(_localctx);
		 		try enterOuterAlt(_localctx, 1)
		 		setState(128)
		 		try match(PlatoParser.Tokens.T__5.rawValue)
		 		setState(129)
		 		try expression(0)
		 		setState(130)
		 		try match(PlatoParser.Tokens.T__2.rawValue)
		 		setState(131)
		 		try statements()
		 		setState(132)
		 		try match(PlatoParser.Tokens.T__3.rawValue)

		 		break
		 	case 2:
		 		_localctx =  ForInStatementContext(_localctx);
		 		try enterOuterAlt(_localctx, 2)
		 		setState(134)
		 		try match(PlatoParser.Tokens.T__6.rawValue)
		 		setState(135)
		 		try match(PlatoParser.Tokens.ID.rawValue)
		 		setState(136)
		 		try match(PlatoParser.Tokens.T__7.rawValue)
		 		setState(137)
		 		try expression(0)
		 		setState(138)
		 		try match(PlatoParser.Tokens.T__2.rawValue)
		 		setState(139)
		 		try statements()
		 		setState(140)
		 		try match(PlatoParser.Tokens.T__3.rawValue)

		 		break
		 	case 3:
		 		_localctx =  ForFromToByStatementContext(_localctx);
		 		try enterOuterAlt(_localctx, 3)
		 		setState(142)
		 		try match(PlatoParser.Tokens.T__6.rawValue)
		 		setState(143)
		 		try match(PlatoParser.Tokens.ID.rawValue)
		 		setState(144)
		 		try match(PlatoParser.Tokens.T__8.rawValue)
		 		setState(145)
		 		try expression(0)
		 		setState(146)
		 		try match(PlatoParser.Tokens.T__9.rawValue)
		 		setState(147)
		 		try expression(0)
		 		setState(148)
		 		try match(PlatoParser.Tokens.T__10.rawValue)
		 		setState(149)
		 		try expression(0)
		 		setState(150)
		 		try match(PlatoParser.Tokens.T__2.rawValue)
		 		setState(151)
		 		try statements()
		 		setState(152)
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
		try enterRule(_localctx, 26, PlatoParser.RULE_functionDeclaration)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(156)
		 	try match(PlatoParser.Tokens.T__11.rawValue)
		 	setState(157)
		 	try match(PlatoParser.Tokens.ID.rawValue)
		 	setState(158)
		 	try match(PlatoParser.Tokens.T__12.rawValue)
		 	setState(160)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == PlatoParser.Tokens.ID.rawValue) {
		 		setState(159)
		 		try functionArguments()

		 	}

		 	setState(162)
		 	try match(PlatoParser.Tokens.T__13.rawValue)
		 	setState(163)
		 	try match(PlatoParser.Tokens.T__2.rawValue)
		 	setState(164)
		 	try statements()
		 	setState(165)
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
			func idStatement() -> [IdStatementContext] {
				return getRuleContexts(IdStatementContext.self)
			}
			open
			func idStatement(_ i: Int) -> IdStatementContext? {
				return getRuleContext(IdStatementContext.self, i)
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
		try enterRule(_localctx, 28, PlatoParser.RULE_functionArguments)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(167)
		 	try idStatement()
		 	setState(172)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == PlatoParser.Tokens.T__14.rawValue) {
		 		setState(168)
		 		try match(PlatoParser.Tokens.T__14.rawValue)
		 		setState(169)
		 		try idStatement()


		 		setState(174)
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
	public class ExponentExpressionContext: ExpressionContext {
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
			    return visitor.visitExponentExpression(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitExponentExpression(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class SubscriptExpressionContext: ExpressionContext {
			open
			func expression() -> [ExpressionContext] {
				return getRuleContexts(ExpressionContext.self)
			}
			open
			func expression(_ i: Int) -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, i)
			}

		public
		init(_ ctx: ExpressionContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitSubscriptExpression(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitSubscriptExpression(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class NotExpressionContext: ExpressionContext {
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
			    return visitor.visitNotExpression(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitNotExpression(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class CompareExpressionContext: ExpressionContext {
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

		public
		init(_ ctx: ExpressionContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitCompareExpression(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitCompareExpression(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class OrExpressionContext: ExpressionContext {
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
			    return visitor.visitOrExpression(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitOrExpression(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class ParenthesesExpressionContext: ExpressionContext {
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
			    return visitor.visitParenthesesExpression(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitParenthesesExpression(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class AndExpressionContext: ExpressionContext {
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
			    return visitor.visitAndExpression(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitAndExpression(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class AddExpressionContext: ExpressionContext {
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
			    return visitor.visitAddExpression(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitAddExpression(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class EqualityExpressionContext: ExpressionContext {
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
			    return visitor.visitEqualityExpression(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitEqualityExpression(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class FunctionCallExpressionContext: ExpressionContext {
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
			    return visitor.visitFunctionCallExpression(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitFunctionCallExpression(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class UnaryExpressionContext: ExpressionContext {
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
			    return visitor.visitUnaryExpression(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitUnaryExpression(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class TypeExpressionContext: ExpressionContext {
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
			    return visitor.visitTypeExpression(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitTypeExpression(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class MulExpressionContext: ExpressionContext {
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
			    return visitor.visitMulExpression(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitMulExpression(self)
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
		let _startState: Int = 30
		try enterRecursionRule(_localctx, 30, PlatoParser.RULE_expression, _p)
		var _la: Int = 0
		defer {
	    		try! unrollRecursionContexts(_parentctx)
	    }
		do {
			var _alt: Int
			try enterOuterAlt(_localctx, 1)
			setState(186)
			try _errHandler.sync(self)
			switch(try getInterpreter().adaptivePredict(_input,14, _ctx)) {
			case 1:
				_localctx = UnaryExpressionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx

				setState(176)
				_localctx.castdown(UnaryExpressionContext.self).op = try _input.LT(1)
				_la = try _input.LA(1)
				if (!(_la == PlatoParser.Tokens.PLUS.rawValue || _la == PlatoParser.Tokens.MINUS.rawValue)) {
					_localctx.castdown(UnaryExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
				}
				else {
					_errHandler.reportMatch(self)
					try consume()
				}
				setState(177)
				try expression(11)

				break
			case 2:
				_localctx = NotExpressionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(178)
				try match(PlatoParser.Tokens.NOT.rawValue)
				setState(179)
				try expression(10)

				break
			case 3:
				_localctx = FunctionCallExpressionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(180)
				try functionCall()

				break
			case 4:
				_localctx = ParenthesesExpressionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(181)
				try match(PlatoParser.Tokens.T__12.rawValue)
				setState(182)
				try expression(0)
				setState(183)
				try match(PlatoParser.Tokens.T__13.rawValue)

				break
			case 5:
				_localctx = TypeExpressionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(185)
				try element()

				break
			default: break
			}
			_ctx!.stop = try _input.LT(-1)
			setState(224)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,17,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
					_prevctx = _localctx
					setState(222)
					try _errHandler.sync(self)
					switch(try getInterpreter().adaptivePredict(_input,16, _ctx)) {
					case 1:
						_localctx = ExponentExpressionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(188)
						if (!(precpred(_ctx, 12))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 12)"))
						}
						setState(189)
						try match(PlatoParser.Tokens.EXP.rawValue)
						setState(190)
						try expression(12)

						break
					case 2:
						_localctx = MulExpressionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(191)
						if (!(precpred(_ctx, 9))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 9)"))
						}
						setState(192)
						_localctx.castdown(MulExpressionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 7340032) != 0))) {
							_localctx.castdown(MulExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(193)
						try expression(10)

						break
					case 3:
						_localctx = AddExpressionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(194)
						if (!(precpred(_ctx, 8))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 8)"))
						}
						setState(195)
						_localctx.castdown(AddExpressionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(_la == PlatoParser.Tokens.PLUS.rawValue || _la == PlatoParser.Tokens.MINUS.rawValue)) {
							_localctx.castdown(AddExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(196)
						try expression(9)

						break
					case 4:
						_localctx = CompareExpressionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(197)
						if (!(precpred(_ctx, 7))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 7)"))
						}
						setState(198)
						_localctx.castdown(CompareExpressionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 503316480) != 0))) {
							_localctx.castdown(CompareExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(199)
						try expression(8)

						break
					case 5:
						_localctx = EqualityExpressionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(200)
						if (!(precpred(_ctx, 6))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 6)"))
						}
						setState(201)
						_localctx.castdown(EqualityExpressionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(_la == PlatoParser.Tokens.EQUAL.rawValue || _la == PlatoParser.Tokens.DIF.rawValue)) {
							_localctx.castdown(EqualityExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(202)
						try expression(7)

						break
					case 6:
						_localctx = AndExpressionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(203)
						if (!(precpred(_ctx, 5))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 5)"))
						}
						setState(204)
						try match(PlatoParser.Tokens.AND.rawValue)
						setState(205)
						try expression(6)

						break
					case 7:
						_localctx = OrExpressionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(206)
						if (!(precpred(_ctx, 4))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 4)"))
						}
						setState(207)
						try match(PlatoParser.Tokens.OR.rawValue)
						setState(208)
						try expression(5)

						break
					case 8:
						_localctx = SubscriptExpressionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(209)
						if (!(precpred(_ctx, 13))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 13)"))
						}
						setState(210)
						try match(PlatoParser.Tokens.T__15.rawValue)
						setState(211)
						try expression(0)
						setState(212)
						try match(PlatoParser.Tokens.T__16.rawValue)
						setState(219)
						try _errHandler.sync(self)
						_alt = try getInterpreter().adaptivePredict(_input,15,_ctx)
						while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
							if ( _alt==1 ) {
								setState(213)
								try match(PlatoParser.Tokens.T__15.rawValue)
								setState(214)
								try expression(0)
								setState(215)
								try match(PlatoParser.Tokens.T__16.rawValue)

						 
							}
							setState(221)
							try _errHandler.sync(self)
							_alt = try getInterpreter().adaptivePredict(_input,15,_ctx)
						}

						break
					default: break
					}
			 
				}
				setState(226)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,17,_ctx)
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
		try enterRule(_localctx, 32, PlatoParser.RULE_functionCall)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(227)
		 	try match(PlatoParser.Tokens.ID.rawValue)
		 	setState(228)
		 	try match(PlatoParser.Tokens.T__12.rawValue)
		 	setState(230)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 67554054565339136) != 0)) {
		 		setState(229)
		 		try parameterList()

		 	}

		 	setState(232)
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
		try enterRule(_localctx, 34, PlatoParser.RULE_parameterList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(234)
		 	try expression(0)
		 	setState(239)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == PlatoParser.Tokens.T__14.rawValue) {
		 		setState(235)
		 		try match(PlatoParser.Tokens.T__14.rawValue)
		 		setState(236)
		 		try expression(0)


		 		setState(241)
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
		override open
		func getRuleIndex() -> Int {
			return PlatoParser.RULE_element
		}
	}
	public class TrueElementContext: ElementContext {
			open
			func TRUE() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.TRUE.rawValue, 0)
			}

		public
		init(_ ctx: ElementContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitTrueElement(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitTrueElement(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class ArrayElementContext: ElementContext {
			open
			func array() -> ArrayContext? {
				return getRuleContext(ArrayContext.self, 0)
			}

		public
		init(_ ctx: ElementContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitArrayElement(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitArrayElement(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class FalseElementContext: ElementContext {
			open
			func FALSE() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.FALSE.rawValue, 0)
			}

		public
		init(_ ctx: ElementContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitFalseElement(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitFalseElement(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class IdElementContext: ElementContext {
			open
			func ID() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.ID.rawValue, 0)
			}

		public
		init(_ ctx: ElementContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitIdElement(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitIdElement(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class StringElementContext: ElementContext {
			open
			func STRING() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.STRING.rawValue, 0)
			}

		public
		init(_ ctx: ElementContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitStringElement(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitStringElement(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class IntElementContext: ElementContext {
			open
			func INT() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.INT.rawValue, 0)
			}

		public
		init(_ ctx: ElementContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitIntElement(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitIntElement(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class FloatElementContext: ElementContext {
			open
			func FLOAT() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.FLOAT.rawValue, 0)
			}

		public
		init(_ ctx: ElementContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitFloatElement(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitFloatElement(self)
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
		try enterRule(_localctx, 36, PlatoParser.RULE_element)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(249)
		 	try _errHandler.sync(self)
		 	switch (PlatoParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .ID:
		 		_localctx =  IdElementContext(_localctx);
		 		try enterOuterAlt(_localctx, 1)
		 		setState(242)
		 		try match(PlatoParser.Tokens.ID.rawValue)

		 		break

		 	case .INT:
		 		_localctx =  IntElementContext(_localctx);
		 		try enterOuterAlt(_localctx, 2)
		 		setState(243)
		 		try match(PlatoParser.Tokens.INT.rawValue)

		 		break

		 	case .FLOAT:
		 		_localctx =  FloatElementContext(_localctx);
		 		try enterOuterAlt(_localctx, 3)
		 		setState(244)
		 		try match(PlatoParser.Tokens.FLOAT.rawValue)

		 		break

		 	case .STRING:
		 		_localctx =  StringElementContext(_localctx);
		 		try enterOuterAlt(_localctx, 4)
		 		setState(245)
		 		try match(PlatoParser.Tokens.STRING.rawValue)

		 		break

		 	case .TRUE:
		 		_localctx =  TrueElementContext(_localctx);
		 		try enterOuterAlt(_localctx, 5)
		 		setState(246)
		 		try match(PlatoParser.Tokens.TRUE.rawValue)

		 		break

		 	case .FALSE:
		 		_localctx =  FalseElementContext(_localctx);
		 		try enterOuterAlt(_localctx, 6)
		 		setState(247)
		 		try match(PlatoParser.Tokens.FALSE.rawValue)

		 		break

		 	case .T__15:
		 		_localctx =  ArrayElementContext(_localctx);
		 		try enterOuterAlt(_localctx, 7)
		 		setState(248)
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
		try enterRule(_localctx, 38, PlatoParser.RULE_array)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(251)
		 	try match(PlatoParser.Tokens.T__15.rawValue)
		 	setState(253)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 67554054565339136) != 0)) {
		 		setState(252)
		 		try parameterList()

		 	}

		 	setState(255)
		 	try match(PlatoParser.Tokens.T__16.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class IdTypeContext: ParserRuleContext {
		open var type: Token!
			open
			func ANY_TYPE() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.ANY_TYPE.rawValue, 0)
			}
			open
			func BOOL_TYPE() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.BOOL_TYPE.rawValue, 0)
			}
			open
			func INT_TYPE() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.INT_TYPE.rawValue, 0)
			}
			open
			func FLOAT_TYPE() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.FLOAT_TYPE.rawValue, 0)
			}
			open
			func NUMBER_TYPE() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.NUMBER_TYPE.rawValue, 0)
			}
			open
			func STRING_TYPE() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.STRING_TYPE.rawValue, 0)
			}
			open
			func ARRAY_TYPE() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.ARRAY_TYPE.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return PlatoParser.RULE_idType
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitIdType(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitIdType(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func idType() throws -> IdTypeContext {
		var _localctx: IdTypeContext
		_localctx = IdTypeContext(_ctx, getState())
		try enterRule(_localctx, 40, PlatoParser.RULE_idType)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(257)
		 	try match(PlatoParser.Tokens.T__17.rawValue)
		 	setState(258)
		 	_localctx.castdown(IdTypeContext.self).type = try _input.LT(1)
		 	_la = try _input.LA(1)
		 	if (!(((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4468415255281664) != 0))) {
		 		_localctx.castdown(IdTypeContext.self).type = try _errHandler.recoverInline(self) as Token
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}

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
		case  15:
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
		    case 7:return precpred(_ctx, 13)
		    default: return true
		}
	}

	static let _serializedATN:[Int] = [
		4,1,59,261,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,6,2,7,
		7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,2,12,7,12,2,13,7,13,2,14,7,14,
		2,15,7,15,2,16,7,16,2,17,7,17,2,18,7,18,2,19,7,19,2,20,7,20,1,0,1,0,1,
		0,1,1,3,1,47,8,1,1,1,5,1,50,8,1,10,1,12,1,53,9,1,1,1,3,1,56,8,1,1,2,1,
		2,1,2,1,2,1,2,1,2,1,2,1,2,3,2,66,8,2,1,3,1,3,1,4,1,4,1,5,1,5,1,6,1,6,3,
		6,76,8,6,1,7,1,7,1,7,1,7,1,7,1,7,1,7,3,7,85,8,7,1,8,1,8,3,8,89,8,8,1,9,
		1,9,1,9,1,9,1,9,1,9,5,9,97,8,9,10,9,12,9,100,9,9,1,9,3,9,103,8,9,1,10,
		5,10,106,8,10,10,10,12,10,109,9,10,1,10,1,10,1,10,1,10,1,10,1,10,1,10,
		1,11,5,11,119,8,11,10,11,12,11,122,9,11,1,11,1,11,1,11,1,11,1,11,1,12,
		1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,
		1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,3,12,155,8,12,1,
		13,1,13,1,13,1,13,3,13,161,8,13,1,13,1,13,1,13,1,13,1,13,1,14,1,14,1,14,
		5,14,171,8,14,10,14,12,14,174,9,14,1,15,1,15,1,15,1,15,1,15,1,15,1,15,
		1,15,1,15,1,15,1,15,3,15,187,8,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,
		15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,
		15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,5,15,218,8,15,10,15,12,15,221,9,
		15,5,15,223,8,15,10,15,12,15,226,9,15,1,16,1,16,1,16,3,16,231,8,16,1,16,
		1,16,1,17,1,17,1,17,5,17,238,8,17,10,17,12,17,241,9,17,1,18,1,18,1,18,
		1,18,1,18,1,18,1,18,3,18,250,8,18,1,19,1,19,3,19,254,8,19,1,19,1,19,1,
		20,1,20,1,20,1,20,0,1,30,21,0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,
		32,34,36,38,40,0,7,2,0,1,1,56,56,1,0,37,41,1,0,23,24,1,0,20,22,1,0,25,
		28,1,0,29,30,1,0,45,51,282,0,42,1,0,0,0,2,51,1,0,0,0,4,65,1,0,0,0,6,67,
		1,0,0,0,8,69,1,0,0,0,10,71,1,0,0,0,12,73,1,0,0,0,14,84,1,0,0,0,16,86,1,
		0,0,0,18,90,1,0,0,0,20,107,1,0,0,0,22,120,1,0,0,0,24,154,1,0,0,0,26,156,
		1,0,0,0,28,167,1,0,0,0,30,186,1,0,0,0,32,227,1,0,0,0,34,234,1,0,0,0,36,
		249,1,0,0,0,38,251,1,0,0,0,40,257,1,0,0,0,42,43,3,2,1,0,43,44,5,0,0,1,
		44,1,1,0,0,0,45,47,3,4,2,0,46,45,1,0,0,0,46,47,1,0,0,0,47,48,1,0,0,0,48,
		50,7,0,0,0,49,46,1,0,0,0,50,53,1,0,0,0,51,49,1,0,0,0,51,52,1,0,0,0,52,
		55,1,0,0,0,53,51,1,0,0,0,54,56,3,4,2,0,55,54,1,0,0,0,55,56,1,0,0,0,56,
		3,1,0,0,0,57,66,3,14,7,0,58,66,3,18,9,0,59,66,3,24,12,0,60,66,3,26,13,
		0,61,66,3,6,3,0,62,66,3,8,4,0,63,66,3,10,5,0,64,66,3,12,6,0,65,57,1,0,
		0,0,65,58,1,0,0,0,65,59,1,0,0,0,65,60,1,0,0,0,65,61,1,0,0,0,65,62,1,0,
		0,0,65,63,1,0,0,0,65,64,1,0,0,0,66,5,1,0,0,0,67,68,3,30,15,0,68,7,1,0,
		0,0,69,70,5,43,0,0,70,9,1,0,0,0,71,72,5,44,0,0,72,11,1,0,0,0,73,75,5,42,
		0,0,74,76,3,30,15,0,75,74,1,0,0,0,75,76,1,0,0,0,76,13,1,0,0,0,77,78,3,
		16,8,0,78,79,5,36,0,0,79,80,3,30,15,0,80,85,1,0,0,0,81,82,5,52,0,0,82,
		83,7,1,0,0,83,85,3,30,15,0,84,77,1,0,0,0,84,81,1,0,0,0,85,15,1,0,0,0,86,
		88,5,52,0,0,87,89,3,40,20,0,88,87,1,0,0,0,88,89,1,0,0,0,89,17,1,0,0,0,
		90,91,5,2,0,0,91,92,3,30,15,0,92,93,5,3,0,0,93,94,3,2,1,0,94,98,5,4,0,
		0,95,97,3,20,10,0,96,95,1,0,0,0,97,100,1,0,0,0,98,96,1,0,0,0,98,99,1,0,
		0,0,99,102,1,0,0,0,100,98,1,0,0,0,101,103,3,22,11,0,102,101,1,0,0,0,102,
		103,1,0,0,0,103,19,1,0,0,0,104,106,5,56,0,0,105,104,1,0,0,0,106,109,1,
		0,0,0,107,105,1,0,0,0,107,108,1,0,0,0,108,110,1,0,0,0,109,107,1,0,0,0,
		110,111,5,5,0,0,111,112,5,2,0,0,112,113,3,30,15,0,113,114,5,3,0,0,114,
		115,3,2,1,0,115,116,5,4,0,0,116,21,1,0,0,0,117,119,5,56,0,0,118,117,1,
		0,0,0,119,122,1,0,0,0,120,118,1,0,0,0,120,121,1,0,0,0,121,123,1,0,0,0,
		122,120,1,0,0,0,123,124,5,5,0,0,124,125,5,3,0,0,125,126,3,2,1,0,126,127,
		5,4,0,0,127,23,1,0,0,0,128,129,5,6,0,0,129,130,3,30,15,0,130,131,5,3,0,
		0,131,132,3,2,1,0,132,133,5,4,0,0,133,155,1,0,0,0,134,135,5,7,0,0,135,
		136,5,52,0,0,136,137,5,8,0,0,137,138,3,30,15,0,138,139,5,3,0,0,139,140,
		3,2,1,0,140,141,5,4,0,0,141,155,1,0,0,0,142,143,5,7,0,0,143,144,5,52,0,
		0,144,145,5,9,0,0,145,146,3,30,15,0,146,147,5,10,0,0,147,148,3,30,15,0,
		148,149,5,11,0,0,149,150,3,30,15,0,150,151,5,3,0,0,151,152,3,2,1,0,152,
		153,5,4,0,0,153,155,1,0,0,0,154,128,1,0,0,0,154,134,1,0,0,0,154,142,1,
		0,0,0,155,25,1,0,0,0,156,157,5,12,0,0,157,158,5,52,0,0,158,160,5,13,0,
		0,159,161,3,28,14,0,160,159,1,0,0,0,160,161,1,0,0,0,161,162,1,0,0,0,162,
		163,5,14,0,0,163,164,5,3,0,0,164,165,3,2,1,0,165,166,5,4,0,0,166,27,1,
		0,0,0,167,172,3,16,8,0,168,169,5,15,0,0,169,171,3,16,8,0,170,168,1,0,0,
		0,171,174,1,0,0,0,172,170,1,0,0,0,172,173,1,0,0,0,173,29,1,0,0,0,174,172,
		1,0,0,0,175,176,6,15,-1,0,176,177,7,2,0,0,177,187,3,30,15,11,178,179,5,
		33,0,0,179,187,3,30,15,10,180,187,3,32,16,0,181,182,5,13,0,0,182,183,3,
		30,15,0,183,184,5,14,0,0,184,187,1,0,0,0,185,187,3,36,18,0,186,175,1,0,
		0,0,186,178,1,0,0,0,186,180,1,0,0,0,186,181,1,0,0,0,186,185,1,0,0,0,187,
		224,1,0,0,0,188,189,10,12,0,0,189,190,5,19,0,0,190,223,3,30,15,12,191,
		192,10,9,0,0,192,193,7,3,0,0,193,223,3,30,15,10,194,195,10,8,0,0,195,196,
		7,2,0,0,196,223,3,30,15,9,197,198,10,7,0,0,198,199,7,4,0,0,199,223,3,30,
		15,8,200,201,10,6,0,0,201,202,7,5,0,0,202,223,3,30,15,7,203,204,10,5,0,
		0,204,205,5,31,0,0,205,223,3,30,15,6,206,207,10,4,0,0,207,208,5,32,0,0,
		208,223,3,30,15,5,209,210,10,13,0,0,210,211,5,16,0,0,211,212,3,30,15,0,
		212,219,5,17,0,0,213,214,5,16,0,0,214,215,3,30,15,0,215,216,5,17,0,0,216,
		218,1,0,0,0,217,213,1,0,0,0,218,221,1,0,0,0,219,217,1,0,0,0,219,220,1,
		0,0,0,220,223,1,0,0,0,221,219,1,0,0,0,222,188,1,0,0,0,222,191,1,0,0,0,
		222,194,1,0,0,0,222,197,1,0,0,0,222,200,1,0,0,0,222,203,1,0,0,0,222,206,
		1,0,0,0,222,209,1,0,0,0,223,226,1,0,0,0,224,222,1,0,0,0,224,225,1,0,0,
		0,225,31,1,0,0,0,226,224,1,0,0,0,227,228,5,52,0,0,228,230,5,13,0,0,229,
		231,3,34,17,0,230,229,1,0,0,0,230,231,1,0,0,0,231,232,1,0,0,0,232,233,
		5,14,0,0,233,33,1,0,0,0,234,239,3,30,15,0,235,236,5,15,0,0,236,238,3,30,
		15,0,237,235,1,0,0,0,238,241,1,0,0,0,239,237,1,0,0,0,239,240,1,0,0,0,240,
		35,1,0,0,0,241,239,1,0,0,0,242,250,5,52,0,0,243,250,5,54,0,0,244,250,5,
		53,0,0,245,250,5,55,0,0,246,250,5,34,0,0,247,250,5,35,0,0,248,250,3,38,
		19,0,249,242,1,0,0,0,249,243,1,0,0,0,249,244,1,0,0,0,249,245,1,0,0,0,249,
		246,1,0,0,0,249,247,1,0,0,0,249,248,1,0,0,0,250,37,1,0,0,0,251,253,5,16,
		0,0,252,254,3,34,17,0,253,252,1,0,0,0,253,254,1,0,0,0,254,255,1,0,0,0,
		255,256,5,17,0,0,256,39,1,0,0,0,257,258,5,18,0,0,258,259,7,6,0,0,259,41,
		1,0,0,0,22,46,51,55,65,75,84,88,98,102,107,120,154,160,172,186,219,222,
		224,230,239,249,253
	]

	public
	static let _ATN = try! ATNDeserializer().deserialize(_serializedATN)
}