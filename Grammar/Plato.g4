grammar Plato;
import Lexer;

options {
    language = Swift;
}

program
    : statements EOF
    ;

statements
    : (statement? (';' | NEWLINE))* statement?
    ;

statement
    : assignmentStatement
    | selectionStatement
    | controlFlowStatement
    | functionDeclaration
    | expressionStatement
    | breakStatement
    | continueStatement
    | returnStatement
    ;

// Print statement line that only has an expression
expressionStatement
    : expression
    ;

breakStatement
    : BREAK
    ;

continueStatement
    : CONTINUE
    ;

returnStatement
    : RETURN expression?
    ;

assignmentStatement
    : idStatement ASSIGN expression                                                              #variableAssignmentStatement
    | ID op=(MUL_ASSIGN | DIV_ASSIGN | MOD_ASSIGN | ADD_ASSIGN | SUB_ASSIGN) expression     #operationAssignmentStatement
    ;

idStatement
    : ID (idType)?
    ;

selectionStatement
    : 'if' expression '{' statements '}' elseIfStatement* elseStatement?
    ;

elseIfStatement
    : NEWLINE* 'else' 'if' expression '{' statements '}'
    ;

elseStatement
    : NEWLINE* 'else' '{' statements '}'
    ;

controlFlowStatement
    : 'while' expression '{' statements '}'                                              #whileStatement
    | 'for' ID 'in' expression '{' statements '}'                                        #forInStatement
    | 'for' ID 'from' expression 'to' expression 'by' expression '{' statements '}'      #forFromToByStatement
    ;

functionDeclaration
    : 'func' ID '(' functionArguments? ')' '{' statements '}'
    ;

functionArguments
    : idStatement (',' idStatement)*
    ;

expression
    : expression '[' expression ']' ('[' expression ']')*                          #subscriptExpression
    |<assoc=right> expression EXP expression                                       #exponentExpression
    | op=(PLUS | MINUS) expression                                                 #unaryExpression
    | NOT expression                                                               #notExpression
    | expression op=(MUL | DIV | MOD) expression                                   #mulExpression
    | expression op=(PLUS | MINUS) expression                                      #addExpression
    | expression op=(LT | LTE | GT | GTE) expression                               #compareExpression
    | expression op=(EQUAL | DIF) expression                                       #equalityExpression
    | expression AND expression                                                    #andExpression
    | expression OR expression                                                     #orExpression
    | functionCall                                                                 #functionCallExpression
    | '(' expression ')'                                                           #parenthesesExpression
    | element                                                                      #typeExpression
    ;

functionCall
    : ID '(' parameterList? ')'
    ;

parameterList
    : expression (',' expression)*
    ;

element
    : ID            #idElement
    | INT           #intElement
    | FLOAT         #floatElement
    | STRING        #stringElement
    | TRUE          #trueElement
    | FALSE         #falseElement
    | array         #arrayElement
    ;

array
    : '[' parameterList? ']'
    ;

idType
    : ':' type=(ANY_TYPE | BOOL_TYPE | INT_TYPE | FLOAT_TYPE | NUMBER_TYPE | STRING_TYPE | ARRAY_TYPE)
    ;