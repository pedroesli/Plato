lexer grammar Lexer;

options {
    language = Swift;
}

// Arithmetic Operators
EXP     : '^';
MUL     : '*';
DIV     : '/';
MOD     : '%';
PLUS    : '+';
MINUS   : '-';

// Relational Operators
LT      : '<';
LTE     : '<=';
GT      : '>';
GTE     : '>=';
EQUAL   : '==';
DIF     : '!=';

// Logical Operators
AND     : 'and';
OR      : 'or';
NOT     : '!';
TRUE    : 'true';
FALSE   : 'false';

// Assignment Operators
ASSIGN      : '=';
MUL_ASSIGN  : '*=';
DIV_ASSIGN  : '/=';
MOD_ASSIGN  : '%=';
ADD_ASSIGN  : '+=';
SUB_ASSIGN  : '-=';

// Control Operators
RETURN      : 'return';
BREAK       : 'break';
CONTINUE    : 'continue';

// Types
ANY_TYPE: 'any';
BOOL_TYPE: 'bool';
INT_TYPE: 'int';
FLOAT_TYPE: 'float';
NUMBER_TYPE: 'number';
STRING_TYPE: 'string';
ARRAY_TYPE: 'array';

ID      : '_'? LETTER (LETTER | DIGIT)*;

fragment
LETTER  : [a-zA-Z];

FLOAT   : INT '.' INT;

INT     : DIGIT ('_'? DIGIT)*;

fragment
DIGIT   : [0-9];

STRING  :  '"' ( ESC | ~[\\"] )*? '"';

fragment
ESC     : '\\' ([abtnfrv]|'"');

NEWLINE: '\r'? '\n';
WS      : [ \t] -> skip;

// Comments
COMMENT         : '#' ~[\r\n]* -> skip;
COMMENT_LONG    : '##' .*? '##' -> skip;
