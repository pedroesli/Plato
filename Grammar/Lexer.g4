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

// Types
ANY_TYPE    : 'Any';
BOOL_TYPE   : 'Bool';
INT_TYPE    : 'Int';
FLOAT_TYPE  : 'Float';
NUMBER_TYPE : 'Number';
STRING_TYPE : 'String';
ARRAY_TYPE  : 'Array';

AT_SIGN     : '@';
UNDERSCORE  : '_';

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

NEWLINE: '\r'? '\n';
WS      : [ \t] -> skip;

// Comments
COMMENT             : '#' ~[\r\n]* -> skip;
COMMENT_MULTILINE   : '##' .*? '##' -> skip;
