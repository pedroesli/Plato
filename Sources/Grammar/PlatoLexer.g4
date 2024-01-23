lexer grammar PlatoLexer;

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
TRUE    : 'TRUE';
FALSE   : 'FALSE';

// Assignment Operators
ASSIGN     : '=';
MUL_ASSIGN : '*=';
DIV_ASSIGN : '/=';
MOD_ASSIGN : '%=';
ADD_ASSIGN : '+=';
SUB_ASSIGN : '-=';

// Types
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