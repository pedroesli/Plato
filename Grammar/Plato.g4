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
    : RETURN expression
    ;

assignmentStatement
    : ID op=(ASSIGN | MUL_ASSIGN | DIV_ASSIGN | MOD_ASSIGN | ADD_ASSIGN | SUB_ASSIGN) expression
    ;

selectionStatement
    : 'if' expression '{' statements '}' selectionElseIf* selectionElse?
    ;

selectionElseIf
    : 'else' 'if' expression '{' statements '}'
    ;

selectionElse
    : 'else' '{' statements '}'
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
    : ID (',' ID)*
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

// function_name
//         : 'print'
//         | ('pow'   | 'sqrt')
//         | ('min'   | 'max' )
//         | ('round' | 'ceil' | 'floor' | 'trunc')
//         | ('abs'   | 'sign' | 'signum'  )
//         | ('sin'   | 'cos'  | 'tan'     )
//         | ('acos'  | 'asin' | 'atan'    )
//         | ('exp'   | 'log'  | 'log10'   )
//         ;

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
