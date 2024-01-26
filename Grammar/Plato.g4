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
    | expression
    | breakStatement
    | continueStatement
    | returnStatement
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
    : (ID | functionCall | array) '[' expression ']' ('[' expression ']')*         #subscriptExpresion
    |<assoc=right> expression EXP expression                                       #exponentExpresion
    | op=(PLUS | MINUS) expression                                                 #unaryExpresion
    | NOT expression                                                               #notExpresion
    | expression op=(MUL | DIV | MOD) expression                                   #mulExpresion
    | expression op=(PLUS | MINUS) expression                                      #addExpresion
    | expression op=(LT | LTE | GT | GTE | EQUAL | DIF) expression                 #compareExpresion
    | expression op=(EQUAL | DIF) expression                                       #equalityExpresion
    | expression AND expression                                                    #andExpresion
    | expression OR expression                                                     #orExpresion
    | functionCall                                                                 #functionCallExpresion
    | '(' expression ')'                                                           #parenthesesExpresion
    | element                                                                      #typeExpresion
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
    : ID
    | INT
    | FLOAT
    | STRING
    | TRUE
    | FALSE
    | array
    ;

array
    : '[' parameterList? ']'
    ;
