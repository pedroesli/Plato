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
            RULE_assignmentStatement = 7, RULE_idTypeStatement = 8, RULE_selectionStatement = 9, 
            RULE_elseIfStatement = 10, RULE_elseStatement = 11, RULE_controlFlowStatement = 12, 
            RULE_functionDeclaration = 13, RULE_functionArguments = 14, 
            RULE_expression = 15, RULE_functionCall = 16, RULE_parameterList = 17, 
            RULE_element = 18, RULE_array = 19

	public
	static let ruleNames: [String] = [
		"program", "statements", "statement", "expressionStatement", "breakStatement", 
		"continueStatement", "returnStatement", "assignmentStatement", "idTypeStatement", 
		"selectionStatement", "elseIfStatement", "elseStatement", "controlFlowStatement", 
		"functionDeclaration", "functionArguments", "expression", "functionCall", 
		"parameterList", "element", "array"
	]

	private static let _LITERAL_NAMES: [String?] = [
		nil, "';'", "':'", "'if'", "'{'", "'}'", "'else'", "'while'", "'for'", 
		"'in'", "'from'", "'to'", "'by'", "'func'", "'('", "')'", "','", "'['", 
		"']'", "'^'", "'*'", "'/'", "'%'", "'+'", "'-'", "'<'", "'<='", "'>'", 
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
		 	setState(40)
		 	try statements()
		 	setState(41)
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
		 	setState(49)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,1,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(44)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 			if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 67584840890999176) != 0)) {
		 				setState(43)
		 				try statement()

		 			}

		 			setState(46)
		 			_la = try _input.LA(1)
		 			if (!(_la == PlatoParser.Tokens.T__0.rawValue || _la == PlatoParser.Tokens.NEWLINE.rawValue)) {
		 			try _errHandler.recoverInline(self)
		 			}
		 			else {
		 				_errHandler.reportMatch(self)
		 				try consume()
		 			}

		 	 
		 		}
		 		setState(51)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,1,_ctx)
		 	}
		 	setState(53)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 67584840890999176) != 0)) {
		 		setState(52)
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
		 	setState(63)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,3, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(55)
		 		try assignmentStatement()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(56)
		 		try selectionStatement()

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(57)
		 		try controlFlowStatement()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(58)
		 		try functionDeclaration()

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(59)
		 		try expressionStatement()

		 		break
		 	case 6:
		 		try enterOuterAlt(_localctx, 6)
		 		setState(60)
		 		try breakStatement()

		 		break
		 	case 7:
		 		try enterOuterAlt(_localctx, 7)
		 		setState(61)
		 		try continueStatement()

		 		break
		 	case 8:
		 		try enterOuterAlt(_localctx, 8)
		 		setState(62)
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
		 	setState(65)
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
		 	setState(67)
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
		 	setState(69)
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
		 	setState(71)
		 	try match(PlatoParser.Tokens.RETURN.rawValue)
		 	setState(73)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 67554054565412864) != 0)) {
		 		setState(72)
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
	public class VariableTypeAssignmentStatementContext: AssignmentStatementContext {
			open
			func ID() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.ID.rawValue, 0)
			}
			open
			func idTypeStatement() -> IdTypeStatementContext? {
				return getRuleContext(IdTypeStatementContext.self, 0)
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
			    return visitor.visitVariableTypeAssignmentStatement(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitVariableTypeAssignmentStatement(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	public class VariableAssignmentStatementContext: AssignmentStatementContext {
			open
			func ID() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.ID.rawValue, 0)
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
		 	setState(86)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,5, _ctx)) {
		 	case 1:
		 		_localctx =  VariableAssignmentStatementContext(_localctx);
		 		try enterOuterAlt(_localctx, 1)
		 		setState(75)
		 		try match(PlatoParser.Tokens.ID.rawValue)
		 		setState(76)
		 		try match(PlatoParser.Tokens.ASSIGN.rawValue)
		 		setState(77)
		 		try expression(0)

		 		break
		 	case 2:
		 		_localctx =  VariableTypeAssignmentStatementContext(_localctx);
		 		try enterOuterAlt(_localctx, 2)
		 		setState(78)
		 		try match(PlatoParser.Tokens.ID.rawValue)
		 		setState(79)
		 		try idTypeStatement()
		 		setState(80)
		 		try match(PlatoParser.Tokens.ASSIGN.rawValue)
		 		setState(81)
		 		try expression(0)

		 		break
		 	case 3:
		 		_localctx =  OperationAssignmentStatementContext(_localctx);
		 		try enterOuterAlt(_localctx, 3)
		 		setState(83)
		 		try match(PlatoParser.Tokens.ID.rawValue)
		 		setState(84)
		 		_localctx.castdown(OperationAssignmentStatementContext.self).op = try _input.LT(1)
		 		_la = try _input.LA(1)
		 		if (!(((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4260607557632) != 0))) {
		 			_localctx.castdown(OperationAssignmentStatementContext.self).op = try _errHandler.recoverInline(self) as Token
		 		}
		 		else {
		 			_errHandler.reportMatch(self)
		 			try consume()
		 		}
		 		setState(85)
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

	public class IdTypeStatementContext: ParserRuleContext {
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
			return PlatoParser.RULE_idTypeStatement
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitIdTypeStatement(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitIdTypeStatement(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func idTypeStatement() throws -> IdTypeStatementContext {
		var _localctx: IdTypeStatementContext
		_localctx = IdTypeStatementContext(_ctx, getState())
		try enterRule(_localctx, 16, PlatoParser.RULE_idTypeStatement)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(88)
		 	try match(PlatoParser.Tokens.T__1.rawValue)
		 	setState(89)
		 	_localctx.castdown(IdTypeStatementContext.self).type = try _input.LT(1)
		 	_la = try _input.LA(1)
		 	if (!(((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4468415255281664) != 0))) {
		 		_localctx.castdown(IdTypeStatementContext.self).type = try _errHandler.recoverInline(self) as Token
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
		 	setState(91)
		 	try match(PlatoParser.Tokens.T__2.rawValue)
		 	setState(92)
		 	try expression(0)
		 	setState(93)
		 	try match(PlatoParser.Tokens.T__3.rawValue)
		 	setState(94)
		 	try statements()
		 	setState(95)
		 	try match(PlatoParser.Tokens.T__4.rawValue)
		 	setState(99)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,6,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(96)
		 			try elseIfStatement()

		 	 
		 		}
		 		setState(101)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,6,_ctx)
		 	}
		 	setState(103)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,7,_ctx)) {
		 	case 1:
		 		setState(102)
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
		 	setState(108)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == PlatoParser.Tokens.NEWLINE.rawValue) {
		 		setState(105)
		 		try match(PlatoParser.Tokens.NEWLINE.rawValue)


		 		setState(110)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(111)
		 	try match(PlatoParser.Tokens.T__5.rawValue)
		 	setState(112)
		 	try match(PlatoParser.Tokens.T__2.rawValue)
		 	setState(113)
		 	try expression(0)
		 	setState(114)
		 	try match(PlatoParser.Tokens.T__3.rawValue)
		 	setState(115)
		 	try statements()
		 	setState(116)
		 	try match(PlatoParser.Tokens.T__4.rawValue)

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
		 	setState(121)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == PlatoParser.Tokens.NEWLINE.rawValue) {
		 		setState(118)
		 		try match(PlatoParser.Tokens.NEWLINE.rawValue)


		 		setState(123)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(124)
		 	try match(PlatoParser.Tokens.T__5.rawValue)
		 	setState(125)
		 	try match(PlatoParser.Tokens.T__3.rawValue)
		 	setState(126)
		 	try statements()
		 	setState(127)
		 	try match(PlatoParser.Tokens.T__4.rawValue)

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
		 	setState(155)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,10, _ctx)) {
		 	case 1:
		 		_localctx =  WhileStatementContext(_localctx);
		 		try enterOuterAlt(_localctx, 1)
		 		setState(129)
		 		try match(PlatoParser.Tokens.T__6.rawValue)
		 		setState(130)
		 		try expression(0)
		 		setState(131)
		 		try match(PlatoParser.Tokens.T__3.rawValue)
		 		setState(132)
		 		try statements()
		 		setState(133)
		 		try match(PlatoParser.Tokens.T__4.rawValue)

		 		break
		 	case 2:
		 		_localctx =  ForInStatementContext(_localctx);
		 		try enterOuterAlt(_localctx, 2)
		 		setState(135)
		 		try match(PlatoParser.Tokens.T__7.rawValue)
		 		setState(136)
		 		try match(PlatoParser.Tokens.ID.rawValue)
		 		setState(137)
		 		try match(PlatoParser.Tokens.T__8.rawValue)
		 		setState(138)
		 		try expression(0)
		 		setState(139)
		 		try match(PlatoParser.Tokens.T__3.rawValue)
		 		setState(140)
		 		try statements()
		 		setState(141)
		 		try match(PlatoParser.Tokens.T__4.rawValue)

		 		break
		 	case 3:
		 		_localctx =  ForFromToByStatementContext(_localctx);
		 		try enterOuterAlt(_localctx, 3)
		 		setState(143)
		 		try match(PlatoParser.Tokens.T__7.rawValue)
		 		setState(144)
		 		try match(PlatoParser.Tokens.ID.rawValue)
		 		setState(145)
		 		try match(PlatoParser.Tokens.T__9.rawValue)
		 		setState(146)
		 		try expression(0)
		 		setState(147)
		 		try match(PlatoParser.Tokens.T__10.rawValue)
		 		setState(148)
		 		try expression(0)
		 		setState(149)
		 		try match(PlatoParser.Tokens.T__11.rawValue)
		 		setState(150)
		 		try expression(0)
		 		setState(151)
		 		try match(PlatoParser.Tokens.T__3.rawValue)
		 		setState(152)
		 		try statements()
		 		setState(153)
		 		try match(PlatoParser.Tokens.T__4.rawValue)

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
		 	setState(157)
		 	try match(PlatoParser.Tokens.T__12.rawValue)
		 	setState(158)
		 	try match(PlatoParser.Tokens.ID.rawValue)
		 	setState(159)
		 	try match(PlatoParser.Tokens.T__13.rawValue)
		 	setState(161)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == PlatoParser.Tokens.ID.rawValue) {
		 		setState(160)
		 		try functionArguments()

		 	}

		 	setState(163)
		 	try match(PlatoParser.Tokens.T__14.rawValue)
		 	setState(164)
		 	try match(PlatoParser.Tokens.T__3.rawValue)
		 	setState(165)
		 	try statements()
		 	setState(166)
		 	try match(PlatoParser.Tokens.T__4.rawValue)

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
			open
			func idTypeStatement() -> [IdTypeStatementContext] {
				return getRuleContexts(IdTypeStatementContext.self)
			}
			open
			func idTypeStatement(_ i: Int) -> IdTypeStatementContext? {
				return getRuleContext(IdTypeStatementContext.self, i)
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
		 	setState(168)
		 	try match(PlatoParser.Tokens.ID.rawValue)
		 	setState(170)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == PlatoParser.Tokens.T__1.rawValue) {
		 		setState(169)
		 		try idTypeStatement()

		 	}

		 	setState(179)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == PlatoParser.Tokens.T__15.rawValue) {
		 		setState(172)
		 		try match(PlatoParser.Tokens.T__15.rawValue)
		 		setState(173)
		 		try match(PlatoParser.Tokens.ID.rawValue)
		 		setState(175)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 		if (_la == PlatoParser.Tokens.T__1.rawValue) {
		 			setState(174)
		 			try idTypeStatement()

		 		}



		 		setState(181)
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
			setState(193)
			try _errHandler.sync(self)
			switch(try getInterpreter().adaptivePredict(_input,15, _ctx)) {
			case 1:
				_localctx = UnaryExpressionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx

				setState(183)
				_localctx.castdown(UnaryExpressionContext.self).op = try _input.LT(1)
				_la = try _input.LA(1)
				if (!(_la == PlatoParser.Tokens.PLUS.rawValue || _la == PlatoParser.Tokens.MINUS.rawValue)) {
					_localctx.castdown(UnaryExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
				}
				else {
					_errHandler.reportMatch(self)
					try consume()
				}
				setState(184)
				try expression(11)

				break
			case 2:
				_localctx = NotExpressionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(185)
				try match(PlatoParser.Tokens.NOT.rawValue)
				setState(186)
				try expression(10)

				break
			case 3:
				_localctx = FunctionCallExpressionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(187)
				try functionCall()

				break
			case 4:
				_localctx = ParenthesesExpressionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(188)
				try match(PlatoParser.Tokens.T__13.rawValue)
				setState(189)
				try expression(0)
				setState(190)
				try match(PlatoParser.Tokens.T__14.rawValue)

				break
			case 5:
				_localctx = TypeExpressionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(192)
				try element()

				break
			default: break
			}
			_ctx!.stop = try _input.LT(-1)
			setState(231)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,18,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
					_prevctx = _localctx
					setState(229)
					try _errHandler.sync(self)
					switch(try getInterpreter().adaptivePredict(_input,17, _ctx)) {
					case 1:
						_localctx = ExponentExpressionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(195)
						if (!(precpred(_ctx, 12))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 12)"))
						}
						setState(196)
						try match(PlatoParser.Tokens.EXP.rawValue)
						setState(197)
						try expression(12)

						break
					case 2:
						_localctx = MulExpressionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(198)
						if (!(precpred(_ctx, 9))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 9)"))
						}
						setState(199)
						_localctx.castdown(MulExpressionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 7340032) != 0))) {
							_localctx.castdown(MulExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(200)
						try expression(10)

						break
					case 3:
						_localctx = AddExpressionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(201)
						if (!(precpred(_ctx, 8))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 8)"))
						}
						setState(202)
						_localctx.castdown(AddExpressionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(_la == PlatoParser.Tokens.PLUS.rawValue || _la == PlatoParser.Tokens.MINUS.rawValue)) {
							_localctx.castdown(AddExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(203)
						try expression(9)

						break
					case 4:
						_localctx = CompareExpressionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(204)
						if (!(precpred(_ctx, 7))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 7)"))
						}
						setState(205)
						_localctx.castdown(CompareExpressionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 503316480) != 0))) {
							_localctx.castdown(CompareExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(206)
						try expression(8)

						break
					case 5:
						_localctx = EqualityExpressionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(207)
						if (!(precpred(_ctx, 6))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 6)"))
						}
						setState(208)
						_localctx.castdown(EqualityExpressionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(_la == PlatoParser.Tokens.EQUAL.rawValue || _la == PlatoParser.Tokens.DIF.rawValue)) {
							_localctx.castdown(EqualityExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(209)
						try expression(7)

						break
					case 6:
						_localctx = AndExpressionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(210)
						if (!(precpred(_ctx, 5))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 5)"))
						}
						setState(211)
						try match(PlatoParser.Tokens.AND.rawValue)
						setState(212)
						try expression(6)

						break
					case 7:
						_localctx = OrExpressionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(213)
						if (!(precpred(_ctx, 4))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 4)"))
						}
						setState(214)
						try match(PlatoParser.Tokens.OR.rawValue)
						setState(215)
						try expression(5)

						break
					case 8:
						_localctx = SubscriptExpressionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(216)
						if (!(precpred(_ctx, 13))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 13)"))
						}
						setState(217)
						try match(PlatoParser.Tokens.T__16.rawValue)
						setState(218)
						try expression(0)
						setState(219)
						try match(PlatoParser.Tokens.T__17.rawValue)
						setState(226)
						try _errHandler.sync(self)
						_alt = try getInterpreter().adaptivePredict(_input,16,_ctx)
						while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
							if ( _alt==1 ) {
								setState(220)
								try match(PlatoParser.Tokens.T__16.rawValue)
								setState(221)
								try expression(0)
								setState(222)
								try match(PlatoParser.Tokens.T__17.rawValue)

						 
							}
							setState(228)
							try _errHandler.sync(self)
							_alt = try getInterpreter().adaptivePredict(_input,16,_ctx)
						}

						break
					default: break
					}
			 
				}
				setState(233)
				try _errHandler.sync(self)
				_alt = try getInterpreter().adaptivePredict(_input,18,_ctx)
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
		 	setState(234)
		 	try match(PlatoParser.Tokens.ID.rawValue)
		 	setState(235)
		 	try match(PlatoParser.Tokens.T__13.rawValue)
		 	setState(237)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 67554054565412864) != 0)) {
		 		setState(236)
		 		try parameterList()

		 	}

		 	setState(239)
		 	try match(PlatoParser.Tokens.T__14.rawValue)

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
		 	setState(241)
		 	try expression(0)
		 	setState(246)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == PlatoParser.Tokens.T__15.rawValue) {
		 		setState(242)
		 		try match(PlatoParser.Tokens.T__15.rawValue)
		 		setState(243)
		 		try expression(0)


		 		setState(248)
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
		 	setState(256)
		 	try _errHandler.sync(self)
		 	switch (PlatoParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .ID:
		 		_localctx =  IdElementContext(_localctx);
		 		try enterOuterAlt(_localctx, 1)
		 		setState(249)
		 		try match(PlatoParser.Tokens.ID.rawValue)

		 		break

		 	case .INT:
		 		_localctx =  IntElementContext(_localctx);
		 		try enterOuterAlt(_localctx, 2)
		 		setState(250)
		 		try match(PlatoParser.Tokens.INT.rawValue)

		 		break

		 	case .FLOAT:
		 		_localctx =  FloatElementContext(_localctx);
		 		try enterOuterAlt(_localctx, 3)
		 		setState(251)
		 		try match(PlatoParser.Tokens.FLOAT.rawValue)

		 		break

		 	case .STRING:
		 		_localctx =  StringElementContext(_localctx);
		 		try enterOuterAlt(_localctx, 4)
		 		setState(252)
		 		try match(PlatoParser.Tokens.STRING.rawValue)

		 		break

		 	case .TRUE:
		 		_localctx =  TrueElementContext(_localctx);
		 		try enterOuterAlt(_localctx, 5)
		 		setState(253)
		 		try match(PlatoParser.Tokens.TRUE.rawValue)

		 		break

		 	case .FALSE:
		 		_localctx =  FalseElementContext(_localctx);
		 		try enterOuterAlt(_localctx, 6)
		 		setState(254)
		 		try match(PlatoParser.Tokens.FALSE.rawValue)

		 		break

		 	case .T__16:
		 		_localctx =  ArrayElementContext(_localctx);
		 		try enterOuterAlt(_localctx, 7)
		 		setState(255)
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
		 	setState(258)
		 	try match(PlatoParser.Tokens.T__16.rawValue)
		 	setState(260)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 67554054565412864) != 0)) {
		 		setState(259)
		 		try parameterList()

		 	}

		 	setState(262)
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
		4,1,59,265,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,6,2,7,
		7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,2,12,7,12,2,13,7,13,2,14,7,14,
		2,15,7,15,2,16,7,16,2,17,7,17,2,18,7,18,2,19,7,19,1,0,1,0,1,0,1,1,3,1,
		45,8,1,1,1,5,1,48,8,1,10,1,12,1,51,9,1,1,1,3,1,54,8,1,1,2,1,2,1,2,1,2,
		1,2,1,2,1,2,1,2,3,2,64,8,2,1,3,1,3,1,4,1,4,1,5,1,5,1,6,1,6,3,6,74,8,6,
		1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,3,7,87,8,7,1,8,1,8,1,8,1,9,
		1,9,1,9,1,9,1,9,1,9,5,9,98,8,9,10,9,12,9,101,9,9,1,9,3,9,104,8,9,1,10,
		5,10,107,8,10,10,10,12,10,110,9,10,1,10,1,10,1,10,1,10,1,10,1,10,1,10,
		1,11,5,11,120,8,11,10,11,12,11,123,9,11,1,11,1,11,1,11,1,11,1,11,1,12,
		1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,
		1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,3,12,156,8,12,1,
		13,1,13,1,13,1,13,3,13,162,8,13,1,13,1,13,1,13,1,13,1,13,1,14,1,14,3,14,
		171,8,14,1,14,1,14,1,14,3,14,176,8,14,5,14,178,8,14,10,14,12,14,181,9,
		14,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,3,15,194,8,15,
		1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,
		1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,
		1,15,5,15,225,8,15,10,15,12,15,228,9,15,5,15,230,8,15,10,15,12,15,233,
		9,15,1,16,1,16,1,16,3,16,238,8,16,1,16,1,16,1,17,1,17,1,17,5,17,245,8,
		17,10,17,12,17,248,9,17,1,18,1,18,1,18,1,18,1,18,1,18,1,18,3,18,257,8,
		18,1,19,1,19,3,19,261,8,19,1,19,1,19,1,19,0,1,30,20,0,2,4,6,8,10,12,14,
		16,18,20,22,24,26,28,30,32,34,36,38,0,7,2,0,1,1,56,56,1,0,37,41,1,0,45,
		51,1,0,23,24,1,0,20,22,1,0,25,28,1,0,29,30,289,0,40,1,0,0,0,2,49,1,0,0,
		0,4,63,1,0,0,0,6,65,1,0,0,0,8,67,1,0,0,0,10,69,1,0,0,0,12,71,1,0,0,0,14,
		86,1,0,0,0,16,88,1,0,0,0,18,91,1,0,0,0,20,108,1,0,0,0,22,121,1,0,0,0,24,
		155,1,0,0,0,26,157,1,0,0,0,28,168,1,0,0,0,30,193,1,0,0,0,32,234,1,0,0,
		0,34,241,1,0,0,0,36,256,1,0,0,0,38,258,1,0,0,0,40,41,3,2,1,0,41,42,5,0,
		0,1,42,1,1,0,0,0,43,45,3,4,2,0,44,43,1,0,0,0,44,45,1,0,0,0,45,46,1,0,0,
		0,46,48,7,0,0,0,47,44,1,0,0,0,48,51,1,0,0,0,49,47,1,0,0,0,49,50,1,0,0,
		0,50,53,1,0,0,0,51,49,1,0,0,0,52,54,3,4,2,0,53,52,1,0,0,0,53,54,1,0,0,
		0,54,3,1,0,0,0,55,64,3,14,7,0,56,64,3,18,9,0,57,64,3,24,12,0,58,64,3,26,
		13,0,59,64,3,6,3,0,60,64,3,8,4,0,61,64,3,10,5,0,62,64,3,12,6,0,63,55,1,
		0,0,0,63,56,1,0,0,0,63,57,1,0,0,0,63,58,1,0,0,0,63,59,1,0,0,0,63,60,1,
		0,0,0,63,61,1,0,0,0,63,62,1,0,0,0,64,5,1,0,0,0,65,66,3,30,15,0,66,7,1,
		0,0,0,67,68,5,43,0,0,68,9,1,0,0,0,69,70,5,44,0,0,70,11,1,0,0,0,71,73,5,
		42,0,0,72,74,3,30,15,0,73,72,1,0,0,0,73,74,1,0,0,0,74,13,1,0,0,0,75,76,
		5,52,0,0,76,77,5,36,0,0,77,87,3,30,15,0,78,79,5,52,0,0,79,80,3,16,8,0,
		80,81,5,36,0,0,81,82,3,30,15,0,82,87,1,0,0,0,83,84,5,52,0,0,84,85,7,1,
		0,0,85,87,3,30,15,0,86,75,1,0,0,0,86,78,1,0,0,0,86,83,1,0,0,0,87,15,1,
		0,0,0,88,89,5,2,0,0,89,90,7,2,0,0,90,17,1,0,0,0,91,92,5,3,0,0,92,93,3,
		30,15,0,93,94,5,4,0,0,94,95,3,2,1,0,95,99,5,5,0,0,96,98,3,20,10,0,97,96,
		1,0,0,0,98,101,1,0,0,0,99,97,1,0,0,0,99,100,1,0,0,0,100,103,1,0,0,0,101,
		99,1,0,0,0,102,104,3,22,11,0,103,102,1,0,0,0,103,104,1,0,0,0,104,19,1,
		0,0,0,105,107,5,56,0,0,106,105,1,0,0,0,107,110,1,0,0,0,108,106,1,0,0,0,
		108,109,1,0,0,0,109,111,1,0,0,0,110,108,1,0,0,0,111,112,5,6,0,0,112,113,
		5,3,0,0,113,114,3,30,15,0,114,115,5,4,0,0,115,116,3,2,1,0,116,117,5,5,
		0,0,117,21,1,0,0,0,118,120,5,56,0,0,119,118,1,0,0,0,120,123,1,0,0,0,121,
		119,1,0,0,0,121,122,1,0,0,0,122,124,1,0,0,0,123,121,1,0,0,0,124,125,5,
		6,0,0,125,126,5,4,0,0,126,127,3,2,1,0,127,128,5,5,0,0,128,23,1,0,0,0,129,
		130,5,7,0,0,130,131,3,30,15,0,131,132,5,4,0,0,132,133,3,2,1,0,133,134,
		5,5,0,0,134,156,1,0,0,0,135,136,5,8,0,0,136,137,5,52,0,0,137,138,5,9,0,
		0,138,139,3,30,15,0,139,140,5,4,0,0,140,141,3,2,1,0,141,142,5,5,0,0,142,
		156,1,0,0,0,143,144,5,8,0,0,144,145,5,52,0,0,145,146,5,10,0,0,146,147,
		3,30,15,0,147,148,5,11,0,0,148,149,3,30,15,0,149,150,5,12,0,0,150,151,
		3,30,15,0,151,152,5,4,0,0,152,153,3,2,1,0,153,154,5,5,0,0,154,156,1,0,
		0,0,155,129,1,0,0,0,155,135,1,0,0,0,155,143,1,0,0,0,156,25,1,0,0,0,157,
		158,5,13,0,0,158,159,5,52,0,0,159,161,5,14,0,0,160,162,3,28,14,0,161,160,
		1,0,0,0,161,162,1,0,0,0,162,163,1,0,0,0,163,164,5,15,0,0,164,165,5,4,0,
		0,165,166,3,2,1,0,166,167,5,5,0,0,167,27,1,0,0,0,168,170,5,52,0,0,169,
		171,3,16,8,0,170,169,1,0,0,0,170,171,1,0,0,0,171,179,1,0,0,0,172,173,5,
		16,0,0,173,175,5,52,0,0,174,176,3,16,8,0,175,174,1,0,0,0,175,176,1,0,0,
		0,176,178,1,0,0,0,177,172,1,0,0,0,178,181,1,0,0,0,179,177,1,0,0,0,179,
		180,1,0,0,0,180,29,1,0,0,0,181,179,1,0,0,0,182,183,6,15,-1,0,183,184,7,
		3,0,0,184,194,3,30,15,11,185,186,5,33,0,0,186,194,3,30,15,10,187,194,3,
		32,16,0,188,189,5,14,0,0,189,190,3,30,15,0,190,191,5,15,0,0,191,194,1,
		0,0,0,192,194,3,36,18,0,193,182,1,0,0,0,193,185,1,0,0,0,193,187,1,0,0,
		0,193,188,1,0,0,0,193,192,1,0,0,0,194,231,1,0,0,0,195,196,10,12,0,0,196,
		197,5,19,0,0,197,230,3,30,15,12,198,199,10,9,0,0,199,200,7,4,0,0,200,230,
		3,30,15,10,201,202,10,8,0,0,202,203,7,3,0,0,203,230,3,30,15,9,204,205,
		10,7,0,0,205,206,7,5,0,0,206,230,3,30,15,8,207,208,10,6,0,0,208,209,7,
		6,0,0,209,230,3,30,15,7,210,211,10,5,0,0,211,212,5,31,0,0,212,230,3,30,
		15,6,213,214,10,4,0,0,214,215,5,32,0,0,215,230,3,30,15,5,216,217,10,13,
		0,0,217,218,5,17,0,0,218,219,3,30,15,0,219,226,5,18,0,0,220,221,5,17,0,
		0,221,222,3,30,15,0,222,223,5,18,0,0,223,225,1,0,0,0,224,220,1,0,0,0,225,
		228,1,0,0,0,226,224,1,0,0,0,226,227,1,0,0,0,227,230,1,0,0,0,228,226,1,
		0,0,0,229,195,1,0,0,0,229,198,1,0,0,0,229,201,1,0,0,0,229,204,1,0,0,0,
		229,207,1,0,0,0,229,210,1,0,0,0,229,213,1,0,0,0,229,216,1,0,0,0,230,233,
		1,0,0,0,231,229,1,0,0,0,231,232,1,0,0,0,232,31,1,0,0,0,233,231,1,0,0,0,
		234,235,5,52,0,0,235,237,5,14,0,0,236,238,3,34,17,0,237,236,1,0,0,0,237,
		238,1,0,0,0,238,239,1,0,0,0,239,240,5,15,0,0,240,33,1,0,0,0,241,246,3,
		30,15,0,242,243,5,16,0,0,243,245,3,30,15,0,244,242,1,0,0,0,245,248,1,0,
		0,0,246,244,1,0,0,0,246,247,1,0,0,0,247,35,1,0,0,0,248,246,1,0,0,0,249,
		257,5,52,0,0,250,257,5,54,0,0,251,257,5,53,0,0,252,257,5,55,0,0,253,257,
		5,34,0,0,254,257,5,35,0,0,255,257,3,38,19,0,256,249,1,0,0,0,256,250,1,
		0,0,0,256,251,1,0,0,0,256,252,1,0,0,0,256,253,1,0,0,0,256,254,1,0,0,0,
		256,255,1,0,0,0,257,37,1,0,0,0,258,260,5,17,0,0,259,261,3,34,17,0,260,
		259,1,0,0,0,260,261,1,0,0,0,261,262,1,0,0,0,262,263,5,18,0,0,263,39,1,
		0,0,0,23,44,49,53,63,73,86,99,103,108,121,155,161,170,175,179,193,226,
		229,231,237,246,256,260
	]

	public
	static let _ATN = try! ATNDeserializer().deserialize(_serializedATN)
}