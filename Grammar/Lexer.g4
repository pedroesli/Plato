lexer grammar Lexer;

options {
    language = Swift;
}

// Arithmetic Operators
EXP     : '**';
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
NOT     : 'not';
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

// Other Keywords
AT          : 'at';
UNDERSCORE  : '_';

// Elements
ID      : UNDERSCORE? LETTER (LETTER | DIGIT)*;
fragment
LETTER  : [a-zA-Z];

FLOAT   : INT '.' INT;

INT     : DIGIT (UNDERSCORE? DIGIT)*;

fragment
DIGIT   : [0-9];

STRING  :  '"' ( ESC | ~[\\"] )*? '"';
fragment
ESC     : '\\' ([abtnfrv]|'"');

// Space
NEWLINE     : '\r'? '\n';
WHITESPACE  : [ \t] -> skip;

// Comments
COMMENT             : '#' ~[\r\n]* -> skip;
COMMENT_MULTILINE   : '##' .*? '##' -> skip;
