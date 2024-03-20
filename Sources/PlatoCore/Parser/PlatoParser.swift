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
                 CONTINUE = 44, AT = 45, UNDERSCORE = 46, ID = 47, INT = 48, 
                 DOUBLE = 49, STRING = 50, NEWLINE = 51, WHITESPACE = 52, 
                 COMMENT = 53, COMMENT_MULTILINE = 54
	}

	public
	static let RULE_program = 0, RULE_statements = 1, RULE_statement = 2, RULE_expressionStatement = 3, 
            RULE_breakStatement = 4, RULE_continueStatement = 5, RULE_returnStatement = 6, 
            RULE_assignmentStatement = 7, RULE_idTypeStatement = 8, RULE_selectionStatement = 9, 
            RULE_elseIfStatement = 10, RULE_elseStatement = 11, RULE_controlFlowStatement = 12, 
            RULE_functionDeclaration = 13, RULE_functionArguments = 14, 
            RULE_functionArgument = 15, RULE_expression = 16, RULE_functionCall = 17, 
            RULE_parameterList = 18, RULE_parameter = 19, RULE_element = 20, 
            RULE_array = 21, RULE_expressionList = 22

	public
	static let ruleNames: [String] = [
		"program", "statements", "statement", "expressionStatement", "breakStatement", 
		"continueStatement", "returnStatement", "assignmentStatement", "idTypeStatement", 
		"selectionStatement", "elseIfStatement", "elseStatement", "controlFlowStatement", 
		"functionDeclaration", "functionArguments", "functionArgument", "expression", 
		"functionCall", "parameterList", "parameter", "element", "array", "expressionList"
	]

	private static let _LITERAL_NAMES: [String?] = [
		nil, "';'", "':'", "'if'", "'{'", "'}'", "'else'", "'while'", "'for'", 
		"'in'", "'from'", "'to'", "'by'", "'func'", "'('", "')'", "','", "'['", 
		"']'", "'**'", "'*'", "'/'", "'%'", "'+'", "'-'", "'<'", "'<='", "'>'", 
		"'>='", "'=='", "'!='", "'and'", "'or'", "'not'", "'true'", "'false'", 
		"'='", "'*='", "'/='", "'%='", "'+='", "'-='", "'return'", "'break'", 
		"'continue'", "'at'", "'_'"
	]
	private static let _SYMBOLIC_NAMES: [String?] = [
		nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 
		nil, nil, nil, nil, nil, "EXP", "MUL", "DIV", "MOD", "PLUS", "MINUS", 
		"LT", "LTE", "GT", "GTE", "EQUAL", "DIF", "AND", "OR", "NOT", "TRUE", 
		"FALSE", "ASSIGN", "MUL_ASSIGN", "DIV_ASSIGN", "MOD_ASSIGN", "ADD_ASSIGN", 
		"SUB_ASSIGN", "RETURN", "BREAK", "CONTINUE", "AT", "UNDERSCORE", "ID", 
		"INT", "DOUBLE", "STRING", "NEWLINE", "WHITESPACE", "COMMENT", "COMMENT_MULTILINE"
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
		 	setState(46)
		 	try statements()
		 	setState(47)
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
		 	setState(55)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,1,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(50)
		 			try _errHandler.sync(self)
		 			_la = try _input.LA(1)
		 			if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 2141908805771656) != 0)) {
		 				setState(49)
		 				try statement()

		 			}

		 			setState(52)
		 			_la = try _input.LA(1)
		 			if (!(_la == PlatoParser.Tokens.T__0.rawValue || _la == PlatoParser.Tokens.NEWLINE.rawValue)) {
		 			try _errHandler.recoverInline(self)
		 			}
		 			else {
		 				_errHandler.reportMatch(self)
		 				try consume()
		 			}

		 	 
		 		}
		 		setState(57)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,1,_ctx)
		 	}
		 	setState(59)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 2141908805771656) != 0)) {
		 		setState(58)
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
		 	setState(69)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,3, _ctx)) {
		 	case 1:
		 		try enterOuterAlt(_localctx, 1)
		 		setState(61)
		 		try assignmentStatement()

		 		break
		 	case 2:
		 		try enterOuterAlt(_localctx, 2)
		 		setState(62)
		 		try selectionStatement()

		 		break
		 	case 3:
		 		try enterOuterAlt(_localctx, 3)
		 		setState(63)
		 		try controlFlowStatement()

		 		break
		 	case 4:
		 		try enterOuterAlt(_localctx, 4)
		 		setState(64)
		 		try functionDeclaration()

		 		break
		 	case 5:
		 		try enterOuterAlt(_localctx, 5)
		 		setState(65)
		 		try expressionStatement()

		 		break
		 	case 6:
		 		try enterOuterAlt(_localctx, 6)
		 		setState(66)
		 		try breakStatement()

		 		break
		 	case 7:
		 		try enterOuterAlt(_localctx, 7)
		 		setState(67)
		 		try continueStatement()

		 		break
		 	case 8:
		 		try enterOuterAlt(_localctx, 8)
		 		setState(68)
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
		 	setState(71)
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
		 	setState(73)
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
		 	setState(75)
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
		 	setState(77)
		 	try match(PlatoParser.Tokens.RETURN.rawValue)
		 	setState(79)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 2111122480185344) != 0)) {
		 		setState(78)
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
		 	setState(92)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,5, _ctx)) {
		 	case 1:
		 		_localctx =  VariableAssignmentStatementContext(_localctx);
		 		try enterOuterAlt(_localctx, 1)
		 		setState(81)
		 		try match(PlatoParser.Tokens.ID.rawValue)
		 		setState(82)
		 		try match(PlatoParser.Tokens.ASSIGN.rawValue)
		 		setState(83)
		 		try expression(0)

		 		break
		 	case 2:
		 		_localctx =  VariableTypeAssignmentStatementContext(_localctx);
		 		try enterOuterAlt(_localctx, 2)
		 		setState(84)
		 		try match(PlatoParser.Tokens.ID.rawValue)
		 		setState(85)
		 		try idTypeStatement()
		 		setState(86)
		 		try match(PlatoParser.Tokens.ASSIGN.rawValue)
		 		setState(87)
		 		try expression(0)

		 		break
		 	case 3:
		 		_localctx =  OperationAssignmentStatementContext(_localctx);
		 		try enterOuterAlt(_localctx, 3)
		 		setState(89)
		 		try match(PlatoParser.Tokens.ID.rawValue)
		 		setState(90)
		 		_localctx.castdown(OperationAssignmentStatementContext.self).op = try _input.LT(1)
		 		_la = try _input.LA(1)
		 		if (!(((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 4260607557632) != 0))) {
		 			_localctx.castdown(OperationAssignmentStatementContext.self).op = try _errHandler.recoverInline(self) as Token
		 		}
		 		else {
		 			_errHandler.reportMatch(self)
		 			try consume()
		 		}
		 		setState(91)
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
			open
			func ID() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.ID.rawValue, 0)
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
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(94)
		 	try match(PlatoParser.Tokens.T__1.rawValue)
		 	setState(95)
		 	try match(PlatoParser.Tokens.ID.rawValue)

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
		 	setState(97)
		 	try match(PlatoParser.Tokens.T__2.rawValue)
		 	setState(98)
		 	try expression(0)
		 	setState(99)
		 	try match(PlatoParser.Tokens.T__3.rawValue)
		 	setState(100)
		 	try statements()
		 	setState(101)
		 	try match(PlatoParser.Tokens.T__4.rawValue)
		 	setState(105)
		 	try _errHandler.sync(self)
		 	_alt = try getInterpreter().adaptivePredict(_input,6,_ctx)
		 	while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
		 		if ( _alt==1 ) {
		 			setState(102)
		 			try elseIfStatement()

		 	 
		 		}
		 		setState(107)
		 		try _errHandler.sync(self)
		 		_alt = try getInterpreter().adaptivePredict(_input,6,_ctx)
		 	}
		 	setState(109)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,7,_ctx)) {
		 	case 1:
		 		setState(108)
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
		 	setState(114)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == PlatoParser.Tokens.NEWLINE.rawValue) {
		 		setState(111)
		 		try match(PlatoParser.Tokens.NEWLINE.rawValue)


		 		setState(116)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(117)
		 	try match(PlatoParser.Tokens.T__5.rawValue)
		 	setState(118)
		 	try match(PlatoParser.Tokens.T__2.rawValue)
		 	setState(119)
		 	try expression(0)
		 	setState(120)
		 	try match(PlatoParser.Tokens.T__3.rawValue)
		 	setState(121)
		 	try statements()
		 	setState(122)
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
		 	setState(127)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == PlatoParser.Tokens.NEWLINE.rawValue) {
		 		setState(124)
		 		try match(PlatoParser.Tokens.NEWLINE.rawValue)


		 		setState(129)
		 		try _errHandler.sync(self)
		 		_la = try _input.LA(1)
		 	}
		 	setState(130)
		 	try match(PlatoParser.Tokens.T__5.rawValue)
		 	setState(131)
		 	try match(PlatoParser.Tokens.T__3.rawValue)
		 	setState(132)
		 	try statements()
		 	setState(133)
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
		 	setState(161)
		 	try _errHandler.sync(self)
		 	switch(try getInterpreter().adaptivePredict(_input,10, _ctx)) {
		 	case 1:
		 		_localctx =  WhileStatementContext(_localctx);
		 		try enterOuterAlt(_localctx, 1)
		 		setState(135)
		 		try match(PlatoParser.Tokens.T__6.rawValue)
		 		setState(136)
		 		try expression(0)
		 		setState(137)
		 		try match(PlatoParser.Tokens.T__3.rawValue)
		 		setState(138)
		 		try statements()
		 		setState(139)
		 		try match(PlatoParser.Tokens.T__4.rawValue)

		 		break
		 	case 2:
		 		_localctx =  ForInStatementContext(_localctx);
		 		try enterOuterAlt(_localctx, 2)
		 		setState(141)
		 		try match(PlatoParser.Tokens.T__7.rawValue)
		 		setState(142)
		 		try match(PlatoParser.Tokens.ID.rawValue)
		 		setState(143)
		 		try match(PlatoParser.Tokens.T__8.rawValue)
		 		setState(144)
		 		try expression(0)
		 		setState(145)
		 		try match(PlatoParser.Tokens.T__3.rawValue)
		 		setState(146)
		 		try statements()
		 		setState(147)
		 		try match(PlatoParser.Tokens.T__4.rawValue)

		 		break
		 	case 3:
		 		_localctx =  ForFromToByStatementContext(_localctx);
		 		try enterOuterAlt(_localctx, 3)
		 		setState(149)
		 		try match(PlatoParser.Tokens.T__7.rawValue)
		 		setState(150)
		 		try match(PlatoParser.Tokens.ID.rawValue)
		 		setState(151)
		 		try match(PlatoParser.Tokens.T__9.rawValue)
		 		setState(152)
		 		try expression(0)
		 		setState(153)
		 		try match(PlatoParser.Tokens.T__10.rawValue)
		 		setState(154)
		 		try expression(0)
		 		setState(155)
		 		try match(PlatoParser.Tokens.T__11.rawValue)
		 		setState(156)
		 		try expression(0)
		 		setState(157)
		 		try match(PlatoParser.Tokens.T__3.rawValue)
		 		setState(158)
		 		try statements()
		 		setState(159)
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
		 	setState(163)
		 	try match(PlatoParser.Tokens.T__12.rawValue)
		 	setState(164)
		 	try match(PlatoParser.Tokens.ID.rawValue)
		 	setState(165)
		 	try match(PlatoParser.Tokens.T__13.rawValue)
		 	setState(167)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == PlatoParser.Tokens.AT.rawValue || _la == PlatoParser.Tokens.ID.rawValue) {
		 		setState(166)
		 		try functionArguments()

		 	}

		 	setState(169)
		 	try match(PlatoParser.Tokens.T__14.rawValue)
		 	setState(170)
		 	try match(PlatoParser.Tokens.T__3.rawValue)
		 	setState(171)
		 	try statements()
		 	setState(172)
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
		 	setState(174)
		 	try functionArgument()
		 	setState(179)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == PlatoParser.Tokens.T__15.rawValue) {
		 		setState(175)
		 		try match(PlatoParser.Tokens.T__15.rawValue)
		 		setState(176)
		 		try functionArgument()


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
		 	setState(183)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == PlatoParser.Tokens.AT.rawValue) {
		 		setState(182)
		 		try match(PlatoParser.Tokens.AT.rawValue)

		 	}

		 	setState(185)
		 	try match(PlatoParser.Tokens.ID.rawValue)
		 	setState(187)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (_la == PlatoParser.Tokens.T__1.rawValue) {
		 		setState(186)
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
			setState(200)
			try _errHandler.sync(self)
			switch(try getInterpreter().adaptivePredict(_input,15, _ctx)) {
			case 1:
				_localctx = UnaryExpressionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx

				setState(190)
				_localctx.castdown(UnaryExpressionContext.self).op = try _input.LT(1)
				_la = try _input.LA(1)
				if (!(_la == PlatoParser.Tokens.PLUS.rawValue || _la == PlatoParser.Tokens.MINUS.rawValue)) {
					_localctx.castdown(UnaryExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
				}
				else {
					_errHandler.reportMatch(self)
					try consume()
				}
				setState(191)
				try expression(11)

				break
			case 2:
				_localctx = NotExpressionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(192)
				try match(PlatoParser.Tokens.NOT.rawValue)
				setState(193)
				try expression(10)

				break
			case 3:
				_localctx = FunctionCallExpressionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(194)
				try functionCall()

				break
			case 4:
				_localctx = ParenthesesExpressionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(195)
				try match(PlatoParser.Tokens.T__13.rawValue)
				setState(196)
				try expression(0)
				setState(197)
				try match(PlatoParser.Tokens.T__14.rawValue)

				break
			case 5:
				_localctx = TypeExpressionContext(_localctx)
				_ctx = _localctx
				_prevctx = _localctx
				setState(199)
				try element()

				break
			default: break
			}
			_ctx!.stop = try _input.LT(-1)
			setState(238)
			try _errHandler.sync(self)
			_alt = try getInterpreter().adaptivePredict(_input,18,_ctx)
			while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
				if ( _alt==1 ) {
					if _parseListeners != nil {
					   try triggerExitRuleEvent()
					}
					_prevctx = _localctx
					setState(236)
					try _errHandler.sync(self)
					switch(try getInterpreter().adaptivePredict(_input,17, _ctx)) {
					case 1:
						_localctx = ExponentExpressionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(202)
						if (!(precpred(_ctx, 12))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 12)"))
						}
						setState(203)
						try match(PlatoParser.Tokens.EXP.rawValue)
						setState(204)
						try expression(12)

						break
					case 2:
						_localctx = MulExpressionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(205)
						if (!(precpred(_ctx, 9))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 9)"))
						}
						setState(206)
						_localctx.castdown(MulExpressionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 7340032) != 0))) {
							_localctx.castdown(MulExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(207)
						try expression(10)

						break
					case 3:
						_localctx = AddExpressionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(208)
						if (!(precpred(_ctx, 8))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 8)"))
						}
						setState(209)
						_localctx.castdown(AddExpressionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(_la == PlatoParser.Tokens.PLUS.rawValue || _la == PlatoParser.Tokens.MINUS.rawValue)) {
							_localctx.castdown(AddExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(210)
						try expression(9)

						break
					case 4:
						_localctx = CompareExpressionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(211)
						if (!(precpred(_ctx, 7))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 7)"))
						}
						setState(212)
						_localctx.castdown(CompareExpressionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 503316480) != 0))) {
							_localctx.castdown(CompareExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(213)
						try expression(8)

						break
					case 5:
						_localctx = EqualityExpressionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(214)
						if (!(precpred(_ctx, 6))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 6)"))
						}
						setState(215)
						_localctx.castdown(EqualityExpressionContext.self).op = try _input.LT(1)
						_la = try _input.LA(1)
						if (!(_la == PlatoParser.Tokens.EQUAL.rawValue || _la == PlatoParser.Tokens.DIF.rawValue)) {
							_localctx.castdown(EqualityExpressionContext.self).op = try _errHandler.recoverInline(self) as Token
						}
						else {
							_errHandler.reportMatch(self)
							try consume()
						}
						setState(216)
						try expression(7)

						break
					case 6:
						_localctx = AndExpressionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(217)
						if (!(precpred(_ctx, 5))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 5)"))
						}
						setState(218)
						try match(PlatoParser.Tokens.AND.rawValue)
						setState(219)
						try expression(6)

						break
					case 7:
						_localctx = OrExpressionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(220)
						if (!(precpred(_ctx, 4))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 4)"))
						}
						setState(221)
						try match(PlatoParser.Tokens.OR.rawValue)
						setState(222)
						try expression(5)

						break
					case 8:
						_localctx = SubscriptExpressionContext(  ExpressionContext(_parentctx, _parentState))
						try pushNewRecursionContext(_localctx, _startState, PlatoParser.RULE_expression)
						setState(223)
						if (!(precpred(_ctx, 13))) {
						    throw ANTLRException.recognition(e:FailedPredicateException(self, "precpred(_ctx, 13)"))
						}
						setState(224)
						try match(PlatoParser.Tokens.T__16.rawValue)
						setState(225)
						try expression(0)
						setState(226)
						try match(PlatoParser.Tokens.T__17.rawValue)
						setState(233)
						try _errHandler.sync(self)
						_alt = try getInterpreter().adaptivePredict(_input,16,_ctx)
						while (_alt != 2 && _alt != ATN.INVALID_ALT_NUMBER) {
							if ( _alt==1 ) {
								setState(227)
								try match(PlatoParser.Tokens.T__16.rawValue)
								setState(228)
								try expression(0)
								setState(229)
								try match(PlatoParser.Tokens.T__17.rawValue)

						 
							}
							setState(235)
							try _errHandler.sync(self)
							_alt = try getInterpreter().adaptivePredict(_input,16,_ctx)
						}

						break
					default: break
					}
			 
				}
				setState(240)
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
		 	setState(241)
		 	try match(PlatoParser.Tokens.ID.rawValue)
		 	setState(242)
		 	try match(PlatoParser.Tokens.T__13.rawValue)
		 	setState(244)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 2111122480185344) != 0)) {
		 		setState(243)
		 		try parameterList()

		 	}

		 	setState(246)
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
		try enterRule(_localctx, 36, PlatoParser.RULE_parameterList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(248)
		 	try parameter()
		 	setState(253)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == PlatoParser.Tokens.T__15.rawValue) {
		 		setState(249)
		 		try match(PlatoParser.Tokens.T__15.rawValue)
		 		setState(250)
		 		try parameter()


		 		setState(255)
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
		try enterRule(_localctx, 38, PlatoParser.RULE_parameter)
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(258)
		 	try _errHandler.sync(self)
		 	switch (try getInterpreter().adaptivePredict(_input,21,_ctx)) {
		 	case 1:
		 		setState(256)
		 		try match(PlatoParser.Tokens.ID.rawValue)
		 		setState(257)
		 		try match(PlatoParser.Tokens.T__1.rawValue)

		 		break
		 	default: break
		 	}
		 	setState(260)
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
	public class DoubleElementContext: ElementContext {
			open
			func DOUBLE() -> TerminalNode? {
				return getToken(PlatoParser.Tokens.DOUBLE.rawValue, 0)
			}

		public
		init(_ ctx: ElementContext) {
			super.init()
			copyFrom(ctx)
		}
		override open
		func accept<T>(_ visitor: ParseTreeVisitor<T>) -> T? {
			if let visitor = visitor as? PlatoVisitor {
			    return visitor.visitDoubleElement(self)
			}
			else if let visitor = visitor as? PlatoBaseVisitor {
			    return visitor.visitDoubleElement(self)
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
	@discardableResult
	 open func element() throws -> ElementContext {
		var _localctx: ElementContext
		_localctx = ElementContext(_ctx, getState())
		try enterRule(_localctx, 40, PlatoParser.RULE_element)
		defer {
	    		try! exitRule()
	    }
		do {
		 	setState(269)
		 	try _errHandler.sync(self)
		 	switch (PlatoParser.Tokens(rawValue: try _input.LA(1))!) {
		 	case .ID:
		 		_localctx =  IdElementContext(_localctx);
		 		try enterOuterAlt(_localctx, 1)
		 		setState(262)
		 		try match(PlatoParser.Tokens.ID.rawValue)

		 		break

		 	case .INT:
		 		_localctx =  IntElementContext(_localctx);
		 		try enterOuterAlt(_localctx, 2)
		 		setState(263)
		 		try match(PlatoParser.Tokens.INT.rawValue)

		 		break

		 	case .DOUBLE:
		 		_localctx =  DoubleElementContext(_localctx);
		 		try enterOuterAlt(_localctx, 3)
		 		setState(264)
		 		try match(PlatoParser.Tokens.DOUBLE.rawValue)

		 		break

		 	case .STRING:
		 		_localctx =  StringElementContext(_localctx);
		 		try enterOuterAlt(_localctx, 4)
		 		setState(265)
		 		try match(PlatoParser.Tokens.STRING.rawValue)

		 		break

		 	case .TRUE:
		 		_localctx =  TrueElementContext(_localctx);
		 		try enterOuterAlt(_localctx, 5)
		 		setState(266)
		 		try match(PlatoParser.Tokens.TRUE.rawValue)

		 		break

		 	case .FALSE:
		 		_localctx =  FalseElementContext(_localctx);
		 		try enterOuterAlt(_localctx, 6)
		 		setState(267)
		 		try match(PlatoParser.Tokens.FALSE.rawValue)

		 		break

		 	case .T__16:
		 		_localctx =  ArrayElementContext(_localctx);
		 		try enterOuterAlt(_localctx, 7)
		 		setState(268)
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
		try enterRule(_localctx, 42, PlatoParser.RULE_array)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(271)
		 	try match(PlatoParser.Tokens.T__16.rawValue)
		 	setState(273)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	if (((Int64(_la) & ~0x3f) == 0 && ((Int64(1) << _la) & 2111122480185344) != 0)) {
		 		setState(272)
		 		try expressionList()

		 	}

		 	setState(275)
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
		try enterRule(_localctx, 44, PlatoParser.RULE_expressionList)
		var _la: Int = 0
		defer {
	    		try! exitRule()
	    }
		do {
		 	try enterOuterAlt(_localctx, 1)
		 	setState(277)
		 	try expression(0)
		 	setState(282)
		 	try _errHandler.sync(self)
		 	_la = try _input.LA(1)
		 	while (_la == PlatoParser.Tokens.T__15.rawValue) {
		 		setState(278)
		 		try match(PlatoParser.Tokens.T__15.rawValue)
		 		setState(279)
		 		try expression(0)


		 		setState(284)
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
		4,1,54,286,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,6,2,7,
		7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,2,12,7,12,2,13,7,13,2,14,7,14,
		2,15,7,15,2,16,7,16,2,17,7,17,2,18,7,18,2,19,7,19,2,20,7,20,2,21,7,21,
		2,22,7,22,1,0,1,0,1,0,1,1,3,1,51,8,1,1,1,5,1,54,8,1,10,1,12,1,57,9,1,1,
		1,3,1,60,8,1,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,3,2,70,8,2,1,3,1,3,1,4,1,
		4,1,5,1,5,1,6,1,6,3,6,80,8,6,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,
		7,3,7,93,8,7,1,8,1,8,1,8,1,9,1,9,1,9,1,9,1,9,1,9,5,9,104,8,9,10,9,12,9,
		107,9,9,1,9,3,9,110,8,9,1,10,5,10,113,8,10,10,10,12,10,116,9,10,1,10,1,
		10,1,10,1,10,1,10,1,10,1,10,1,11,5,11,126,8,11,10,11,12,11,129,9,11,1,
		11,1,11,1,11,1,11,1,11,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,
		12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,
		12,1,12,1,12,3,12,162,8,12,1,13,1,13,1,13,1,13,3,13,168,8,13,1,13,1,13,
		1,13,1,13,1,13,1,14,1,14,1,14,5,14,178,8,14,10,14,12,14,181,9,14,1,15,
		3,15,184,8,15,1,15,1,15,3,15,188,8,15,1,16,1,16,1,16,1,16,1,16,1,16,1,
		16,1,16,1,16,1,16,1,16,3,16,201,8,16,1,16,1,16,1,16,1,16,1,16,1,16,1,16,
		1,16,1,16,1,16,1,16,1,16,1,16,1,16,1,16,1,16,1,16,1,16,1,16,1,16,1,16,
		1,16,1,16,1,16,1,16,1,16,1,16,1,16,1,16,5,16,232,8,16,10,16,12,16,235,
		9,16,5,16,237,8,16,10,16,12,16,240,9,16,1,17,1,17,1,17,3,17,245,8,17,1,
		17,1,17,1,18,1,18,1,18,5,18,252,8,18,10,18,12,18,255,9,18,1,19,1,19,3,
		19,259,8,19,1,19,1,19,1,20,1,20,1,20,1,20,1,20,1,20,1,20,3,20,270,8,20,
		1,21,1,21,3,21,274,8,21,1,21,1,21,1,22,1,22,1,22,5,22,281,8,22,10,22,12,
		22,284,9,22,1,22,0,1,32,23,0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,
		32,34,36,38,40,42,44,0,6,2,0,1,1,51,51,1,0,37,41,1,0,23,24,1,0,20,22,1,
		0,25,28,1,0,29,30,309,0,46,1,0,0,0,2,55,1,0,0,0,4,69,1,0,0,0,6,71,1,0,
		0,0,8,73,1,0,0,0,10,75,1,0,0,0,12,77,1,0,0,0,14,92,1,0,0,0,16,94,1,0,0,
		0,18,97,1,0,0,0,20,114,1,0,0,0,22,127,1,0,0,0,24,161,1,0,0,0,26,163,1,
		0,0,0,28,174,1,0,0,0,30,183,1,0,0,0,32,200,1,0,0,0,34,241,1,0,0,0,36,248,
		1,0,0,0,38,258,1,0,0,0,40,269,1,0,0,0,42,271,1,0,0,0,44,277,1,0,0,0,46,
		47,3,2,1,0,47,48,5,0,0,1,48,1,1,0,0,0,49,51,3,4,2,0,50,49,1,0,0,0,50,51,
		1,0,0,0,51,52,1,0,0,0,52,54,7,0,0,0,53,50,1,0,0,0,54,57,1,0,0,0,55,53,
		1,0,0,0,55,56,1,0,0,0,56,59,1,0,0,0,57,55,1,0,0,0,58,60,3,4,2,0,59,58,
		1,0,0,0,59,60,1,0,0,0,60,3,1,0,0,0,61,70,3,14,7,0,62,70,3,18,9,0,63,70,
		3,24,12,0,64,70,3,26,13,0,65,70,3,6,3,0,66,70,3,8,4,0,67,70,3,10,5,0,68,
		70,3,12,6,0,69,61,1,0,0,0,69,62,1,0,0,0,69,63,1,0,0,0,69,64,1,0,0,0,69,
		65,1,0,0,0,69,66,1,0,0,0,69,67,1,0,0,0,69,68,1,0,0,0,70,5,1,0,0,0,71,72,
		3,32,16,0,72,7,1,0,0,0,73,74,5,43,0,0,74,9,1,0,0,0,75,76,5,44,0,0,76,11,
		1,0,0,0,77,79,5,42,0,0,78,80,3,32,16,0,79,78,1,0,0,0,79,80,1,0,0,0,80,
		13,1,0,0,0,81,82,5,47,0,0,82,83,5,36,0,0,83,93,3,32,16,0,84,85,5,47,0,
		0,85,86,3,16,8,0,86,87,5,36,0,0,87,88,3,32,16,0,88,93,1,0,0,0,89,90,5,
		47,0,0,90,91,7,1,0,0,91,93,3,32,16,0,92,81,1,0,0,0,92,84,1,0,0,0,92,89,
		1,0,0,0,93,15,1,0,0,0,94,95,5,2,0,0,95,96,5,47,0,0,96,17,1,0,0,0,97,98,
		5,3,0,0,98,99,3,32,16,0,99,100,5,4,0,0,100,101,3,2,1,0,101,105,5,5,0,0,
		102,104,3,20,10,0,103,102,1,0,0,0,104,107,1,0,0,0,105,103,1,0,0,0,105,
		106,1,0,0,0,106,109,1,0,0,0,107,105,1,0,0,0,108,110,3,22,11,0,109,108,
		1,0,0,0,109,110,1,0,0,0,110,19,1,0,0,0,111,113,5,51,0,0,112,111,1,0,0,
		0,113,116,1,0,0,0,114,112,1,0,0,0,114,115,1,0,0,0,115,117,1,0,0,0,116,
		114,1,0,0,0,117,118,5,6,0,0,118,119,5,3,0,0,119,120,3,32,16,0,120,121,
		5,4,0,0,121,122,3,2,1,0,122,123,5,5,0,0,123,21,1,0,0,0,124,126,5,51,0,
		0,125,124,1,0,0,0,126,129,1,0,0,0,127,125,1,0,0,0,127,128,1,0,0,0,128,
		130,1,0,0,0,129,127,1,0,0,0,130,131,5,6,0,0,131,132,5,4,0,0,132,133,3,
		2,1,0,133,134,5,5,0,0,134,23,1,0,0,0,135,136,5,7,0,0,136,137,3,32,16,0,
		137,138,5,4,0,0,138,139,3,2,1,0,139,140,5,5,0,0,140,162,1,0,0,0,141,142,
		5,8,0,0,142,143,5,47,0,0,143,144,5,9,0,0,144,145,3,32,16,0,145,146,5,4,
		0,0,146,147,3,2,1,0,147,148,5,5,0,0,148,162,1,0,0,0,149,150,5,8,0,0,150,
		151,5,47,0,0,151,152,5,10,0,0,152,153,3,32,16,0,153,154,5,11,0,0,154,155,
		3,32,16,0,155,156,5,12,0,0,156,157,3,32,16,0,157,158,5,4,0,0,158,159,3,
		2,1,0,159,160,5,5,0,0,160,162,1,0,0,0,161,135,1,0,0,0,161,141,1,0,0,0,
		161,149,1,0,0,0,162,25,1,0,0,0,163,164,5,13,0,0,164,165,5,47,0,0,165,167,
		5,14,0,0,166,168,3,28,14,0,167,166,1,0,0,0,167,168,1,0,0,0,168,169,1,0,
		0,0,169,170,5,15,0,0,170,171,5,4,0,0,171,172,3,2,1,0,172,173,5,5,0,0,173,
		27,1,0,0,0,174,179,3,30,15,0,175,176,5,16,0,0,176,178,3,30,15,0,177,175,
		1,0,0,0,178,181,1,0,0,0,179,177,1,0,0,0,179,180,1,0,0,0,180,29,1,0,0,0,
		181,179,1,0,0,0,182,184,5,45,0,0,183,182,1,0,0,0,183,184,1,0,0,0,184,185,
		1,0,0,0,185,187,5,47,0,0,186,188,3,16,8,0,187,186,1,0,0,0,187,188,1,0,
		0,0,188,31,1,0,0,0,189,190,6,16,-1,0,190,191,7,2,0,0,191,201,3,32,16,11,
		192,193,5,33,0,0,193,201,3,32,16,10,194,201,3,34,17,0,195,196,5,14,0,0,
		196,197,3,32,16,0,197,198,5,15,0,0,198,201,1,0,0,0,199,201,3,40,20,0,200,
		189,1,0,0,0,200,192,1,0,0,0,200,194,1,0,0,0,200,195,1,0,0,0,200,199,1,
		0,0,0,201,238,1,0,0,0,202,203,10,12,0,0,203,204,5,19,0,0,204,237,3,32,
		16,12,205,206,10,9,0,0,206,207,7,3,0,0,207,237,3,32,16,10,208,209,10,8,
		0,0,209,210,7,2,0,0,210,237,3,32,16,9,211,212,10,7,0,0,212,213,7,4,0,0,
		213,237,3,32,16,8,214,215,10,6,0,0,215,216,7,5,0,0,216,237,3,32,16,7,217,
		218,10,5,0,0,218,219,5,31,0,0,219,237,3,32,16,6,220,221,10,4,0,0,221,222,
		5,32,0,0,222,237,3,32,16,5,223,224,10,13,0,0,224,225,5,17,0,0,225,226,
		3,32,16,0,226,233,5,18,0,0,227,228,5,17,0,0,228,229,3,32,16,0,229,230,
		5,18,0,0,230,232,1,0,0,0,231,227,1,0,0,0,232,235,1,0,0,0,233,231,1,0,0,
		0,233,234,1,0,0,0,234,237,1,0,0,0,235,233,1,0,0,0,236,202,1,0,0,0,236,
		205,1,0,0,0,236,208,1,0,0,0,236,211,1,0,0,0,236,214,1,0,0,0,236,217,1,
		0,0,0,236,220,1,0,0,0,236,223,1,0,0,0,237,240,1,0,0,0,238,236,1,0,0,0,
		238,239,1,0,0,0,239,33,1,0,0,0,240,238,1,0,0,0,241,242,5,47,0,0,242,244,
		5,14,0,0,243,245,3,36,18,0,244,243,1,0,0,0,244,245,1,0,0,0,245,246,1,0,
		0,0,246,247,5,15,0,0,247,35,1,0,0,0,248,253,3,38,19,0,249,250,5,16,0,0,
		250,252,3,38,19,0,251,249,1,0,0,0,252,255,1,0,0,0,253,251,1,0,0,0,253,
		254,1,0,0,0,254,37,1,0,0,0,255,253,1,0,0,0,256,257,5,47,0,0,257,259,5,
		2,0,0,258,256,1,0,0,0,258,259,1,0,0,0,259,260,1,0,0,0,260,261,3,32,16,
		0,261,39,1,0,0,0,262,270,5,47,0,0,263,270,5,48,0,0,264,270,5,49,0,0,265,
		270,5,50,0,0,266,270,5,34,0,0,267,270,5,35,0,0,268,270,3,42,21,0,269,262,
		1,0,0,0,269,263,1,0,0,0,269,264,1,0,0,0,269,265,1,0,0,0,269,266,1,0,0,
		0,269,267,1,0,0,0,269,268,1,0,0,0,270,41,1,0,0,0,271,273,5,17,0,0,272,
		274,3,44,22,0,273,272,1,0,0,0,273,274,1,0,0,0,274,275,1,0,0,0,275,276,
		5,18,0,0,276,43,1,0,0,0,277,282,3,32,16,0,278,279,5,16,0,0,279,281,3,32,
		16,0,280,278,1,0,0,0,281,284,1,0,0,0,282,280,1,0,0,0,282,283,1,0,0,0,283,
		45,1,0,0,0,284,282,1,0,0,0,25,50,55,59,69,79,92,105,109,114,127,161,167,
		179,183,187,200,233,236,238,244,253,258,269,273,282
	]

	public
	static let _ATN = try! ATNDeserializer().deserialize(_serializedATN)
}