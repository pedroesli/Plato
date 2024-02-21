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
                 AT = 52, UNDERSCORE = 53, ID = 54, FLOAT = 55, INT = 56, 
                 STRING = 57, NEWLINE = 58, WHITESPACE = 59, COMMENT = 60, 
                 COMMENT_MULTILINE = 61
	}

	public
	static let RULE_program = 0, RULE_statements = 1, RULE_statement = 2, RULE_expressionStatement = 3, 
            RULE_breakStatement = 4, RULE_continueStatement = 5, RULE_returnStatement = 6, 
            RULE_assignmentStatement = 7, RULE_idTypeStatement = 8, RULE_selectionStatement = 9, 
            RULE_elseIfStatement = 10, RULE_elseStatement = 11, RULE_controlFlowStatement = 12, 
            RULE_functionDeclaration = 13, RULE_functionArguments = 14, 
            RULE_functionArgument = 15, RULE_expression = 16, RULE_functionCall = 17, 
            RULE_typeFunctionCall = 18, RULE_parameterList = 19, RULE_parameter = 20, 
            RULE_element = 21, RULE_array = 22, RULE_expressionList = 23

	public
	static let ruleNames: [String] = [
		"program", "statements", "statement", "expressionStatement", "breakStatement", 
		"continueStatement", "returnStatement", "assignmentStatement", "idTypeStatement", 
		"selectionStatement", "elseIfStatement", "elseStatement", "controlFlowStatement", 
		"functionDeclaration", "functionArguments", "functionArgument", "expression", 
		"functionCall", "typeFunctionCall", "parameterList", "parameter", "element", 
		"array", "expressionList"
	]

	private static let _LITERAL_NAMES: [String?] = [
		nil, "';'", "':'", "'if'", "'{'", "'}'", "'else'", "'while'", "'for'", 
		"'in'", "'from'", "'to'", "'by'", "'func'", "'('", "')'", "','", "'['", 
		"']'", "'**'", "'*'", "'/'", "'%'", "'+'", "'-'", "'<'", "'<='", "'>'", 
		"'>='", "'=='", "'!='", "'and'", "'or'", "'not'", "'true'", "'false'", 
		"'='", "'*='", "'/='", "'%='", "'+='", "'-='", "'return'", "'break'", 
		"'continue'", "'Any'", "'Bool'", "'Int'", "'Float'", "'Number'", "'String'", 
		"'Array'", "'at'", "'_'"
	]
	private static let _SYMBOLIC_NAMES: [String?] = [
		nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 
		nil, nil, nil, nil, nil, "EXP", "MUL", "DIV", "MOD", "PLUS", "MINUS", 
		"LT", "LTE", "GT", "GTE", "EQUAL", "DIF", "AND", "OR", "NOT", "TRUE", 
		"FALSE", "ASSIGN", "MUL_ASSIGN", "DIV_ASSIGN", "MOD_ASSIGN", "ADD_ASSIGN", 
		"SUB_ASSIGN", "RETURN", "BREAK", "CONTINUE", "ANY_TYPE", "BOOL_TYPE", 
		"INT_TYPE", "FLOAT_TYPE", "NUMBER_TYPE", "STRING_TYPE", "ARRAY_TYPE", 
		"AT", "UNDERSCORE", "ID", "FLOAT", "INT", "STRING", "NEWLINE", "WHITESPACE", 
		"COMMENT", "COMMENT_MULTILINE"
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
		 	setState(48)
		 	try statements()
		 	setState(49)
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
		 	setState(57)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,1,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(52)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 			if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 274680055005864328) != 0)) {
		 				setState(51)
		 				try statement()

		 			}

		 			setState(54)
		 			_la = try _input.LA(1)
		 			if (!(_la == PlatoParser.Tokens.T__0.rawValue || _la == PlatoParser.Tokens.NEWLINE.rawValue)) {
		 			try _errHandler.recoverInline(self)
		 			}
		 			else {
		 				_errHandler.reportMatch(self)
		 				try consume()
		 			}

		 	 
		 		}
		 		setState(59)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,1,_ctx)
		 	}
		 	setState(61)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 274680055005864328) != 0)) {
		 		setState(60)
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
		 	setState(71)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,3, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(63)
		 		try assignmentStatement()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(64)
		 		try selectionStatement()

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(65)
		 		try controlFlowStatement()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(66)
		 		try functionDeclaration()

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(67)
		 		try expressionStatement()

		 		break
		 	case 6:
		 		try enterOuterAlt(_localctx, 6)
		 		setState(68)
		 		try breakStatement()

		 		break
		 	case 7:
		 		try enterOuterAlt(_localctx, 7)
		 		setState(69)
		 		try continueStatement()

		 		break
		 	case 8:
		 		try enterOuterAlt(_localctx, 8)
		 		setState(70)
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
		 	setState(73)
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
		 	setState(75)
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
		 	setState(77)
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
		 	setState(79)
		 	try match(PlatoParser.Tokens.RETURN.rawValue)
		 	setState(81)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 274649268680278016) != 0)) {
		 		setState(80)
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
		 	setState(94)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,5, _ctx)) {
		 	case 1:
		 		_localctx =  VariableAssignmentStatementContext(_localctx);
		 		try enterOuterAlt(_localctx, 1)
		 		setState(83)
		 		try match(PlatoParser.Tokens.ID.rawValue)
		 		setState(84)
		 		try match(PlatoParser.Tokens.ASSIGN.rawValue)
		 		setState(85)
		 		try expression(0)

		 		break
		 	case 2:
		 		_localctx =  VariableTypeAssignmentStatementContext(_localctx);
		 		try enterOuterAlt(_localctx, 2)
		 		setState(86)
		 		try match(PlatoParser.Tokens.ID.rawValue)
		 		setState(87)
		 		try idTypeStatement()
		 		setState(88)
		 		try match(PlatoParser.Tokens.ASSIGN.rawValue)
		 		setState(89)
		 		try expression(0)

		 		break
		 	case 3:
		 		_localctx =  OperationAssignmentStatementContext(_localctx);
		 		try enterOuterAlt(_localctx, 3)
		 		setState(91)
		 		try match(PlatoParser.Tokens.ID.rawValue)
		 		setState(92)
		 		_localctx.castdown(OperationAssignmentStatementContext.self).op = try _input.LT(1)
		 		_la = try _input.LA(1)
		 		if (!(((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4260607557632) != 0))) {
		 			_localctx.castdown(OperationAssignmentStatementContext.self).op = try _errHandler.recoverInline(self) as Token
		 		}
		 		else {
		 			_errHandler.reportMatch(self)
		 			try consume()
		 		}
		 		setState(93)
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
		 	setState(96)
		 	try match(PlatoParser.Tokens.T__1.rawValue)
		 	setState(97)
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
		 	setState(99)
		 	try match(PlatoParser.Tokens.T__2.rawValue)
		 	setState(100)
		 	try expression(0)
		 	setState(101)
		 	try match(PlatoParser.Tokens.T__3.rawValue)
		 	setState(102)
		 	try statements()
		 	setState(103)
		 	try match(PlatoParser.Tokens.T__4.rawValue)
		 	setState(107)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,6,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(104)
		 			try elseIfStatement()

		 	 
		 		}
		 		setState(109)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,6,_ctx)
		 	}
		 	setState(111)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,7,_ctx)) {
		 	case 1:
		 		setState(110)
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
		 	setState(116)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == PlatoParser.Tokens.NEWLINE.rawValue) {
		 		setState(113)
		 		try match(PlatoParser.Tokens.NEWLINE.rawValue)


		 		setState(118)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(119)
		 	try match(PlatoParser.Tokens.T__5.rawValue)
		 	setState(120)
		 	try match(PlatoParser.Tokens.T__2.rawValue)
		 	setState(121)
		 	try expression(0)
		 	setState(122)
		 	try match(PlatoParser.Tokens.T__3.rawValue)
		 	setState(123)
		 	try statements()
		 	setState(124)
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
		 	setState(129)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == PlatoParser.Tokens.NEWLINE.rawValue) {
		 		setState(126)
		 		try match(PlatoParser.Tokens.NEWLINE.rawValue)


		 		setState(131)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(132)
		 	try match(PlatoParser.Tokens.T__5.rawValue)
		 	setState(133)
		 	try match(PlatoParser.Tokens.T__3.rawValue)
		 	setState(134)
		 	try statements()
		 	setState(135)
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
		 	setState(163)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,10, _ctx)) {
		 	case 1:
		 		_localctx =  WhileStatementContext(_localctx);
		 		try enterOuterAlt(_localctx, 1)
		 		setState(137)
		 		try match(PlatoParser.Tokens.T__6.rawValue)
		 		setState(138)
		 		try expression(0)
		 		setState(139)
		 		try match(PlatoParser.Tokens.T__3.rawValue)
		 		setState(140)
		 		try statements()
		 		setState(141)
		 		try match(PlatoParser.Tokens.T__4.rawValue)

		 		break
		 	case 2:
		 		_localctx =  ForInStatementContext(_localctx);
		 		try enterOuterAlt(_localctx, 2)
		 		setState(143)
		 		try match(PlatoParser.Tokens.T__7.rawValue)
		 		setState(144)
		 		try match(PlatoParser.Tokens.ID.rawValue)
		 		setState(145)
		 		try match(PlatoParser.Tokens.T__8.rawValue)
		 		setState(146)
		 		try expression(0)
		 		setState(147)
		 		try match(PlatoParser.Tokens.T__3.rawValue)
		 		setState(148)
		 		try statements()
		 		setState(149)
		 		try match(PlatoParser.Tokens.T__4.rawValue)

		 		break
		 	case 3:
		 		_localctx =  ForFromToByStatementContext(_localctx);
		 		try enterOuterAlt(_localctx, 3)
		 		setState(151)
		 		try match(PlatoParser.Tokens.T__7.rawValue)
		 		setState(152)
		 		try match(PlatoParser.Tokens.ID.rawValue)
		 		setState(153)
		 		try match(PlatoParser.Tokens.T__9.rawValue)
		 		setState(154)
		 		try expression(0)
		 		setState(155)
		 		try match(PlatoParser.Tokens.T__10.rawValue)
		 		setState(156)
		 		try expression(0)
		 		setState(157)
		 		try match(PlatoParser.Tokens.T__11.rawValue)
		 		setState(158)
		 		try expression(0)
		 		setState(159)
		 		try match(PlatoParser.Tokens.T__3.rawValue)
		 		setState(160)
		 		try statements()
		 		setState(161)
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
		 	setState(165)
		 	try match(PlatoParser.Tokens.T__12.rawValue)
		 	setState(166)
		 	try match(PlatoParser.Tokens.ID.rawValue)
		 	setState(167)
		 	try match(PlatoParser.Tokens.T__13.rawValue)
		 	setState(169)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == PlatoParser.Tokens.AT.rawValue || _la == PlatoParser.Tokens.ID.rawValue) {
		 		setState(168)
		 		try functionArguments()

		 	}

		 	setState(171)
		 	try match(PlatoParser.Tokens.T__14.rawValue)
		 	setState(172)
		 	try match(PlatoParser.Tokens.T__3.rawValue)
		 	setState(173)
		 	try statements()
		 	setState(174)
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
			func functionArgument() -> [FunctionArgumentContext] {
				return getRuleContexts(FunctionArgumentContext.self)
			}
			open
			func functionArgument(_ i: Int) -> FunctionArgumentContext? {
				return getRuleContext(FunctionArgumentContext.self, i)
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
		 	setState(176)
		 	try functionArgument()
		 	setState(181)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == PlatoParser.Tokens.T__15.rawValue) {
		 		setState(177)
		 		try match(PlatoParser.Tokens.T__15.rawValue)
		 		setState(178)
		 		try functionArgument()


		 		setState(183)
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

	public class FunctionArgumentContext: ParserRuleContext {
			open
			func ID() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.ID.rawValue, 0)
			}
			open
			func AT() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.AT.rawValue, 0)
			}
			open
			func idTypeStatement() -> IdTypeStatementContext? {
				return getRuleContext(IdTypeStatementContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return PlatoParser.RULE_functionArgument
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitFunctionArgument(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitFunctionArgument(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func functionArgument() throws -> FunctionArgumentContext {
		var _localctx: FunctionArgumentContext
		_localctx = FunctionArgumentContext(_ctx, getState())
		try enterRule(_localctx, 30, PlatoParser.RULE_functionArgument)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(185)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == PlatoParser.Tokens.AT.rawValue) {
		 		setState(184)
		 		try match(PlatoParser.Tokens.AT.rawValue)

		 	}

		 	setState(187)
		 	try match(PlatoParser.Tokens.ID.rawValue)
		 	setState(189)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == PlatoParser.Tokens.T__1.rawValue) {
		 		setState(188)
		 		try idTypeStatement()

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
	public class TypeFunctionCallExpressionContext: ExpressionContext {
			open
			func typeFunctionCall() -> TypeFunctionCallContext? {
				return getRuleContext(TypeFunctionCallContext.self, 0)
			}

		public
		init(_ ctx: ExpressionContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitTypeFunctionCallExpression(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitTypeFunctionCallExpression(self)
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
		let _startState: Int = 32
		try enterRecursionRule(_localctx, 32, PlatoParser.RULE_expression, _p)
		var _la: Int = 0
		defer {
	    		try! unrollRecursionContexts(_parentctx)
	    }
		do {
			var _alt: Int
			try enterOuterAlt(_localctx, 1)
			setState(203)
			try _errHandler.sync(self)
			switch(try getInterpreter().adaptivePredict(_input,15, _ctx)) {
			case 1:
				_localctx = UnaryExpressionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx

				setState(192)
				_localctx.castdown(UnaryExpressionContext.self).op = try _input.LT(1)
				_la = try _input.LA(1)
				if (!(_la == PlatoParser.Tokens.PLUS.rawValue || _la == PlatoParser.Tokens.MINUS.rawValue)) {
					_localctx.castdown(UnaryExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
				}
				else {
					_errHandler.reportMatch(self)
					try consume()
				}
				setState(193)
				try expression(12)

				break
			case 2:
				_localctx = NotExpressionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(194)
				try match(PlatoParser.Tokens.NOT.rawValue)
				setState(195)
				try expression(11)

				break
			case 3:
				_localctx = FunctionCallExpressionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(196)
				try functionCall()

				break
			case 4:
				_localctx = TypeFunctionCallExpressionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(197)
				try typeFunctionCall()

				break
			case 5:
				_localctx = ParenthesesExpressionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(198)
				try match(PlatoParser.Tokens.T__13.rawValue)
				setState(199)
				try expression(0)
				setState(200)
				try match(PlatoParser.Tokens.T__14.rawValue)

				break
			case 6:
				_localctx = TypeExpressionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(202)
				try element()

				break
			default: break
			}
			_ctx!.stop = try _input.LT(-1)
			setState(241)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,18,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
					_prevctx = _localctx
					setState(239)
					try _errHandler.sync(self)
					switch(try getInterpreter().adaptivePredict(_input,17, _ctx)) {
					case 1:
						_localctx = ExponentExpressionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(205)
						if (!(precpred(_ctx, 13))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 13)"))
						}
						setState(206)
						try match(PlatoParser.Tokens.EXP.rawValue)
						setState(207)
						try expression(13)

						break
					case 2:
						_localctx = MulExpressionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(208)
						if (!(precpred(_ctx, 10))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 10)"))
						}
						setState(209)
						_localctx.castdown(MulExpressionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 7340032) != 0))) {
							_localctx.castdown(MulExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(210)
						try expression(11)

						break
					case 3:
						_localctx = AddExpressionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(211)
						if (!(precpred(_ctx, 9))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 9)"))
						}
						setState(212)
						_localctx.castdown(AddExpressionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(_la == PlatoParser.Tokens.PLUS.rawValue || _la == PlatoParser.Tokens.MINUS.rawValue)) {
							_localctx.castdown(AddExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(213)
						try expression(10)

						break
					case 4:
						_localctx = CompareExpressionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(214)
						if (!(precpred(_ctx, 8))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 8)"))
						}
						setState(215)
						_localctx.castdown(CompareExpressionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 503316480) != 0))) {
							_localctx.castdown(CompareExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(216)
						try expression(9)

						break
					case 5:
						_localctx = EqualityExpressionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(217)
						if (!(precpred(_ctx, 7))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 7)"))
						}
						setState(218)
						_localctx.castdown(EqualityExpressionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(_la == PlatoParser.Tokens.EQUAL.rawValue || _la == PlatoParser.Tokens.DIF.rawValue)) {
							_localctx.castdown(EqualityExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(219)
						try expression(8)

						break
					case 6:
						_localctx = AndExpressionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(220)
						if (!(precpred(_ctx, 6))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 6)"))
						}
						setState(221)
						try match(PlatoParser.Tokens.AND.rawValue)
						setState(222)
						try expression(7)

						break
					case 7:
						_localctx = OrExpressionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(223)
						if (!(precpred(_ctx, 5))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 5)"))
						}
						setState(224)
						try match(PlatoParser.Tokens.OR.rawValue)
						setState(225)
						try expression(6)

						break
					case 8:
						_localctx = SubscriptExpressionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(226)
						if (!(precpred(_ctx, 14))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 14)"))
						}
						setState(227)
						try match(PlatoParser.Tokens.T__16.rawValue)
						setState(228)
						try expression(0)
						setState(229)
						try match(PlatoParser.Tokens.T__17.rawValue)
						setState(236)
						try _errHandler.sync(self)
						_alt = try getInterpreter().adaptivePredict(_input,16,_ctx)
						while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
							if ( _alt==1 ) {
								setState(230)
								try match(PlatoParser.Tokens.T__16.rawValue)
								setState(231)
								try expression(0)
								setState(232)
								try match(PlatoParser.Tokens.T__17.rawValue)

						 
							}
							setState(238)
							try _errHandler.sync(self)
							_alt = try getInterpreter().adaptivePredict(_input,16,_ctx)
						}

						break
					default: break
					}
			 
				}
				setState(243)
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
		try enterRule(_localctx, 34, PlatoParser.RULE_functionCall)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(244)
		 	try match(PlatoParser.Tokens.ID.rawValue)
		 	setState(245)
		 	try match(PlatoParser.Tokens.T__13.rawValue)
		 	setState(247)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 274649268680278016) != 0)) {
		 		setState(246)
		 		try parameterList()

		 	}

		 	setState(249)
		 	try match(PlatoParser.Tokens.T__14.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class TypeFunctionCallContext: ParserRuleContext {
		open var type: Token!
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
			open
			func parameterList() -> ParameterListContext? {
				return getRuleContext(ParameterListContext.self, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return PlatoParser.RULE_typeFunctionCall
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitTypeFunctionCall(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitTypeFunctionCall(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func typeFunctionCall() throws -> TypeFunctionCallContext {
		var _localctx: TypeFunctionCallContext
		_localctx = TypeFunctionCallContext(_ctx, getState())
		try enterRule(_localctx, 36, PlatoParser.RULE_typeFunctionCall)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(251)
		 	_localctx.castdown(TypeFunctionCallContext.self).type = try _input.LT(1)
		 	_la = try _input.LA(1)
		 	if (!(((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4433230883192832) != 0))) {
		 		_localctx.castdown(TypeFunctionCallContext.self).type = try _errHandler.recoverInline(self) as Token
		 	}
		 	else {
		 		_errHandler.reportMatch(self)
		 		try consume()
		 	}
		 	setState(252)
		 	try match(PlatoParser.Tokens.T__13.rawValue)
		 	setState(254)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 274649268680278016) != 0)) {
		 		setState(253)
		 		try parameterList()

		 	}

		 	setState(256)
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
			func parameter() -> [ParameterContext] {
				return getRuleContexts(ParameterContext.self)
			}
			open
			func parameter(_ i: Int) -> ParameterContext? {
				return getRuleContext(ParameterContext.self, i)
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
		try enterRule(_localctx, 38, PlatoParser.RULE_parameterList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(258)
		 	try parameter()
		 	setState(263)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == PlatoParser.Tokens.T__15.rawValue) {
		 		setState(259)
		 		try match(PlatoParser.Tokens.T__15.rawValue)
		 		setState(260)
		 		try parameter()


		 		setState(265)
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

	public class ParameterContext: ParserRuleContext {
			open
			func expression() -> ExpressionContext? {
				return getRuleContext(ExpressionContext.self, 0)
			}
			open
			func ID() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.ID.rawValue, 0)
			}
		override open
		func getRuleIndex() -> Int {
			return PlatoParser.RULE_parameter
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitParameter(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitParameter(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func parameter() throws -> ParameterContext {
		var _localctx: ParameterContext
		_localctx = ParameterContext(_ctx, getState())
		try enterRule(_localctx, 40, PlatoParser.RULE_parameter)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(268)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,22,_ctx)) {
		 	case 1:
		 		setState(266)
		 		try match(PlatoParser.Tokens.ID.rawValue)
		 		setState(267)
		 		try match(PlatoParser.Tokens.T__1.rawValue)

		 		break
		 	default: break
		 	}
		 	setState(270)
		 	try expression(0)

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
		try enterRule(_localctx, 42, PlatoParser.RULE_element)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(279)
		 	try _errHandler.sync(self)
		 	switch (PlatoParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .ID:
		 		_localctx =  IdElementContext(_localctx);
		 		try enterOuterAlt(_localctx, 1)
		 		setState(272)
		 		try match(PlatoParser.Tokens.ID.rawValue)

		 		break

		 	case .INT:
		 		_localctx =  IntElementContext(_localctx);
		 		try enterOuterAlt(_localctx, 2)
		 		setState(273)
		 		try match(PlatoParser.Tokens.INT.rawValue)

		 		break

		 	case .FLOAT:
		 		_localctx =  FloatElementContext(_localctx);
		 		try enterOuterAlt(_localctx, 3)
		 		setState(274)
		 		try match(PlatoParser.Tokens.FLOAT.rawValue)

		 		break

		 	case .STRING:
		 		_localctx =  StringElementContext(_localctx);
		 		try enterOuterAlt(_localctx, 4)
		 		setState(275)
		 		try match(PlatoParser.Tokens.STRING.rawValue)

		 		break

		 	case .TRUE:
		 		_localctx =  TrueElementContext(_localctx);
		 		try enterOuterAlt(_localctx, 5)
		 		setState(276)
		 		try match(PlatoParser.Tokens.TRUE.rawValue)

		 		break

		 	case .FALSE:
		 		_localctx =  FalseElementContext(_localctx);
		 		try enterOuterAlt(_localctx, 6)
		 		setState(277)
		 		try match(PlatoParser.Tokens.FALSE.rawValue)

		 		break

		 	case .T__16:
		 		_localctx =  ArrayElementContext(_localctx);
		 		try enterOuterAlt(_localctx, 7)
		 		setState(278)
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
			func expressionList() -> ExpressionListContext? {
				return getRuleContext(ExpressionListContext.self, 0)
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
		try enterRule(_localctx, 44, PlatoParser.RULE_array)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(281)
		 	try match(PlatoParser.Tokens.T__16.rawValue)
		 	setState(283)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 274649268680278016) != 0)) {
		 		setState(282)
		 		try expressionList()

		 	}

		 	setState(285)
		 	try match(PlatoParser.Tokens.T__17.rawValue)

		}
		catch ANTLRException.recognition(let re) {
			_localctx.exception = re
			_errHandler.reportError(self, re)
			try _errHandler.recover(self, re)
		}

		return _localctx
	}

	public class ExpressionListContext: ParserRuleContext {
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
			return PlatoParser.RULE_expressionList
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitExpressionList(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitExpressionList(self)
			}
			else {
			     return visitor.visitChildren(self)
			}
		}
	}
	@discardableResult
	 open func expressionList() throws -> ExpressionListContext {
		var _localctx: ExpressionListContext
		_localctx = ExpressionListContext(_ctx, getState())
		try enterRule(_localctx, 46, PlatoParser.RULE_expressionList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(287)
		 	try expression(0)
		 	setState(292)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == PlatoParser.Tokens.T__15.rawValue) {
		 		setState(288)
		 		try match(PlatoParser.Tokens.T__15.rawValue)
		 		setState(289)
		 		try expression(0)


		 		setState(294)
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

	override open
	func sempred(_ _localctx: RuleContext?, _ ruleIndex: Int,  _ predIndex: Int)throws -> Bool {
		switch (ruleIndex) {
		case  16:
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
		    case 7:return precpred(_ctx, 14)
		    default: return true
		}
	}

	static let _serializedATN:[Int] = [
		4,1,61,296,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,6,2,7,
		7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,2,12,7,12,2,13,7,13,2,14,7,14,
		2,15,7,15,2,16,7,16,2,17,7,17,2,18,7,18,2,19,7,19,2,20,7,20,2,21,7,21,
		2,22,7,22,2,23,7,23,1,0,1,0,1,0,1,1,3,1,53,8,1,1,1,5,1,56,8,1,10,1,12,
		1,59,9,1,1,1,3,1,62,8,1,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,3,2,72,8,2,1,3,
		1,3,1,4,1,4,1,5,1,5,1,6,1,6,3,6,82,8,6,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,
		1,7,1,7,1,7,3,7,95,8,7,1,8,1,8,1,8,1,9,1,9,1,9,1,9,1,9,1,9,5,9,106,8,9,
		10,9,12,9,109,9,9,1,9,3,9,112,8,9,1,10,5,10,115,8,10,10,10,12,10,118,9,
		10,1,10,1,10,1,10,1,10,1,10,1,10,1,10,1,11,5,11,128,8,11,10,11,12,11,131,
		9,11,1,11,1,11,1,11,1,11,1,11,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,
		1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,
		1,12,1,12,1,12,1,12,3,12,164,8,12,1,13,1,13,1,13,1,13,3,13,170,8,13,1,
		13,1,13,1,13,1,13,1,13,1,14,1,14,1,14,5,14,180,8,14,10,14,12,14,183,9,
		14,1,15,3,15,186,8,15,1,15,1,15,3,15,190,8,15,1,16,1,16,1,16,1,16,1,16,
		1,16,1,16,1,16,1,16,1,16,1,16,1,16,3,16,204,8,16,1,16,1,16,1,16,1,16,1,
		16,1,16,1,16,1,16,1,16,1,16,1,16,1,16,1,16,1,16,1,16,1,16,1,16,1,16,1,
		16,1,16,1,16,1,16,1,16,1,16,1,16,1,16,1,16,1,16,1,16,5,16,235,8,16,10,
		16,12,16,238,9,16,5,16,240,8,16,10,16,12,16,243,9,16,1,17,1,17,1,17,3,
		17,248,8,17,1,17,1,17,1,18,1,18,1,18,3,18,255,8,18,1,18,1,18,1,19,1,19,
		1,19,5,19,262,8,19,10,19,12,19,265,9,19,1,20,1,20,3,20,269,8,20,1,20,1,
		20,1,21,1,21,1,21,1,21,1,21,1,21,1,21,3,21,280,8,21,1,22,1,22,3,22,284,
		8,22,1,22,1,22,1,23,1,23,1,23,5,23,291,8,23,10,23,12,23,294,9,23,1,23,
		0,1,32,24,0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,
		44,46,0,8,2,0,1,1,58,58,1,0,37,41,1,0,45,51,1,0,23,24,1,0,20,22,1,0,25,
		28,1,0,29,30,1,0,46,51,320,0,48,1,0,0,0,2,57,1,0,0,0,4,71,1,0,0,0,6,73,
		1,0,0,0,8,75,1,0,0,0,10,77,1,0,0,0,12,79,1,0,0,0,14,94,1,0,0,0,16,96,1,
		0,0,0,18,99,1,0,0,0,20,116,1,0,0,0,22,129,1,0,0,0,24,163,1,0,0,0,26,165,
		1,0,0,0,28,176,1,0,0,0,30,185,1,0,0,0,32,203,1,0,0,0,34,244,1,0,0,0,36,
		251,1,0,0,0,38,258,1,0,0,0,40,268,1,0,0,0,42,279,1,0,0,0,44,281,1,0,0,
		0,46,287,1,0,0,0,48,49,3,2,1,0,49,50,5,0,0,1,50,1,1,0,0,0,51,53,3,4,2,
		0,52,51,1,0,0,0,52,53,1,0,0,0,53,54,1,0,0,0,54,56,7,0,0,0,55,52,1,0,0,
		0,56,59,1,0,0,0,57,55,1,0,0,0,57,58,1,0,0,0,58,61,1,0,0,0,59,57,1,0,0,
		0,60,62,3,4,2,0,61,60,1,0,0,0,61,62,1,0,0,0,62,3,1,0,0,0,63,72,3,14,7,
		0,64,72,3,18,9,0,65,72,3,24,12,0,66,72,3,26,13,0,67,72,3,6,3,0,68,72,3,
		8,4,0,69,72,3,10,5,0,70,72,3,12,6,0,71,63,1,0,0,0,71,64,1,0,0,0,71,65,
		1,0,0,0,71,66,1,0,0,0,71,67,1,0,0,0,71,68,1,0,0,0,71,69,1,0,0,0,71,70,
		1,0,0,0,72,5,1,0,0,0,73,74,3,32,16,0,74,7,1,0,0,0,75,76,5,43,0,0,76,9,
		1,0,0,0,77,78,5,44,0,0,78,11,1,0,0,0,79,81,5,42,0,0,80,82,3,32,16,0,81,
		80,1,0,0,0,81,82,1,0,0,0,82,13,1,0,0,0,83,84,5,54,0,0,84,85,5,36,0,0,85,
		95,3,32,16,0,86,87,5,54,0,0,87,88,3,16,8,0,88,89,5,36,0,0,89,90,3,32,16,
		0,90,95,1,0,0,0,91,92,5,54,0,0,92,93,7,1,0,0,93,95,3,32,16,0,94,83,1,0,
		0,0,94,86,1,0,0,0,94,91,1,0,0,0,95,15,1,0,0,0,96,97,5,2,0,0,97,98,7,2,
		0,0,98,17,1,0,0,0,99,100,5,3,0,0,100,101,3,32,16,0,101,102,5,4,0,0,102,
		103,3,2,1,0,103,107,5,5,0,0,104,106,3,20,10,0,105,104,1,0,0,0,106,109,
		1,0,0,0,107,105,1,0,0,0,107,108,1,0,0,0,108,111,1,0,0,0,109,107,1,0,0,
		0,110,112,3,22,11,0,111,110,1,0,0,0,111,112,1,0,0,0,112,19,1,0,0,0,113,
		115,5,58,0,0,114,113,1,0,0,0,115,118,1,0,0,0,116,114,1,0,0,0,116,117,1,
		0,0,0,117,119,1,0,0,0,118,116,1,0,0,0,119,120,5,6,0,0,120,121,5,3,0,0,
		121,122,3,32,16,0,122,123,5,4,0,0,123,124,3,2,1,0,124,125,5,5,0,0,125,
		21,1,0,0,0,126,128,5,58,0,0,127,126,1,0,0,0,128,131,1,0,0,0,129,127,1,
		0,0,0,129,130,1,0,0,0,130,132,1,0,0,0,131,129,1,0,0,0,132,133,5,6,0,0,
		133,134,5,4,0,0,134,135,3,2,1,0,135,136,5,5,0,0,136,23,1,0,0,0,137,138,
		5,7,0,0,138,139,3,32,16,0,139,140,5,4,0,0,140,141,3,2,1,0,141,142,5,5,
		0,0,142,164,1,0,0,0,143,144,5,8,0,0,144,145,5,54,0,0,145,146,5,9,0,0,146,
		147,3,32,16,0,147,148,5,4,0,0,148,149,3,2,1,0,149,150,5,5,0,0,150,164,
		1,0,0,0,151,152,5,8,0,0,152,153,5,54,0,0,153,154,5,10,0,0,154,155,3,32,
		16,0,155,156,5,11,0,0,156,157,3,32,16,0,157,158,5,12,0,0,158,159,3,32,
		16,0,159,160,5,4,0,0,160,161,3,2,1,0,161,162,5,5,0,0,162,164,1,0,0,0,163,
		137,1,0,0,0,163,143,1,0,0,0,163,151,1,0,0,0,164,25,1,0,0,0,165,166,5,13,
		0,0,166,167,5,54,0,0,167,169,5,14,0,0,168,170,3,28,14,0,169,168,1,0,0,
		0,169,170,1,0,0,0,170,171,1,0,0,0,171,172,5,15,0,0,172,173,5,4,0,0,173,
		174,3,2,1,0,174,175,5,5,0,0,175,27,1,0,0,0,176,181,3,30,15,0,177,178,5,
		16,0,0,178,180,3,30,15,0,179,177,1,0,0,0,180,183,1,0,0,0,181,179,1,0,0,
		0,181,182,1,0,0,0,182,29,1,0,0,0,183,181,1,0,0,0,184,186,5,52,0,0,185,
		184,1,0,0,0,185,186,1,0,0,0,186,187,1,0,0,0,187,189,5,54,0,0,188,190,3,
		16,8,0,189,188,1,0,0,0,189,190,1,0,0,0,190,31,1,0,0,0,191,192,6,16,-1,
		0,192,193,7,3,0,0,193,204,3,32,16,12,194,195,5,33,0,0,195,204,3,32,16,
		11,196,204,3,34,17,0,197,204,3,36,18,0,198,199,5,14,0,0,199,200,3,32,16,
		0,200,201,5,15,0,0,201,204,1,0,0,0,202,204,3,42,21,0,203,191,1,0,0,0,203,
		194,1,0,0,0,203,196,1,0,0,0,203,197,1,0,0,0,203,198,1,0,0,0,203,202,1,
		0,0,0,204,241,1,0,0,0,205,206,10,13,0,0,206,207,5,19,0,0,207,240,3,32,
		16,13,208,209,10,10,0,0,209,210,7,4,0,0,210,240,3,32,16,11,211,212,10,
		9,0,0,212,213,7,3,0,0,213,240,3,32,16,10,214,215,10,8,0,0,215,216,7,5,
		0,0,216,240,3,32,16,9,217,218,10,7,0,0,218,219,7,6,0,0,219,240,3,32,16,
		8,220,221,10,6,0,0,221,222,5,31,0,0,222,240,3,32,16,7,223,224,10,5,0,0,
		224,225,5,32,0,0,225,240,3,32,16,6,226,227,10,14,0,0,227,228,5,17,0,0,
		228,229,3,32,16,0,229,236,5,18,0,0,230,231,5,17,0,0,231,232,3,32,16,0,
		232,233,5,18,0,0,233,235,1,0,0,0,234,230,1,0,0,0,235,238,1,0,0,0,236,234,
		1,0,0,0,236,237,1,0,0,0,237,240,1,0,0,0,238,236,1,0,0,0,239,205,1,0,0,
		0,239,208,1,0,0,0,239,211,1,0,0,0,239,214,1,0,0,0,239,217,1,0,0,0,239,
		220,1,0,0,0,239,223,1,0,0,0,239,226,1,0,0,0,240,243,1,0,0,0,241,239,1,
		0,0,0,241,242,1,0,0,0,242,33,1,0,0,0,243,241,1,0,0,0,244,245,5,54,0,0,
		245,247,5,14,0,0,246,248,3,38,19,0,247,246,1,0,0,0,247,248,1,0,0,0,248,
		249,1,0,0,0,249,250,5,15,0,0,250,35,1,0,0,0,251,252,7,7,0,0,252,254,5,
		14,0,0,253,255,3,38,19,0,254,253,1,0,0,0,254,255,1,0,0,0,255,256,1,0,0,
		0,256,257,5,15,0,0,257,37,1,0,0,0,258,263,3,40,20,0,259,260,5,16,0,0,260,
		262,3,40,20,0,261,259,1,0,0,0,262,265,1,0,0,0,263,261,1,0,0,0,263,264,
		1,0,0,0,264,39,1,0,0,0,265,263,1,0,0,0,266,267,5,54,0,0,267,269,5,2,0,
		0,268,266,1,0,0,0,268,269,1,0,0,0,269,270,1,0,0,0,270,271,3,32,16,0,271,
		41,1,0,0,0,272,280,5,54,0,0,273,280,5,56,0,0,274,280,5,55,0,0,275,280,
		5,57,0,0,276,280,5,34,0,0,277,280,5,35,0,0,278,280,3,44,22,0,279,272,1,
		0,0,0,279,273,1,0,0,0,279,274,1,0,0,0,279,275,1,0,0,0,279,276,1,0,0,0,
		279,277,1,0,0,0,279,278,1,0,0,0,280,43,1,0,0,0,281,283,5,17,0,0,282,284,
		3,46,23,0,283,282,1,0,0,0,283,284,1,0,0,0,284,285,1,0,0,0,285,286,5,18,
		0,0,286,45,1,0,0,0,287,292,3,32,16,0,288,289,5,16,0,0,289,291,3,32,16,
		0,290,288,1,0,0,0,291,294,1,0,0,0,292,290,1,0,0,0,292,293,1,0,0,0,293,
		47,1,0,0,0,294,292,1,0,0,0,26,52,57,61,71,81,94,107,111,116,129,163,169,
		181,185,189,203,236,239,241,247,254,263,268,279,283,292
	]

	public
	static let _ATN = try! ATNDeserializer().deserialize(_serializedATN)
}