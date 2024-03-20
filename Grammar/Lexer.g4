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

// Fragments
fragment
DIGIT   : [0-9];
fragment
LETTER  : [a-zA-Z];
fragment
ESC     : '\\' ([abtnfrv]|'"');

// Values
ID      : UNDERSCORE? LETTER (LETTER | DIGIT)*;
INT     : DIGIT (UNDERSCORE? DIGIT)*;
DOUBLE   : INT '.' INT;
STRING  :  '"' ( ESC | ~[\\"] )*? '"';

// Space
NEWLINE     : '\r'? '\n';
WHITESPACE  : [ \t] -> skip;

// Comments
COMMENT             : '#' ~[\r\n]* -> skip;
COMMENT_MULTILINE   : '##' .*? '##' -> skip;
