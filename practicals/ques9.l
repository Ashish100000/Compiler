//  9. Write a YACC program to find the validity of a given expression (for operators + - 
// * and /)A program in YACC which recognizes a valid variable which starts with 
// letter followed by a digit. The letter should be in lowercase only.
%{
#include "y.tab.h"
%}

%%

[0-9]+          { return NUM; }
[a-z][0-9]      { return VAR; }
[+\-*/()]       { return yytext[0]; }
[ \t]           { /* ignore spaces */ }
\n              { return '\n'; }

.               { return 0; }   /* invalid */

%%

int yywrap() { return 1; }

// you have to make one more file  name --> ques9.y
//this is how to run the code :- run these 3 commands in cmd
//win_bison -dy ques9.y -> this will create a {y.tab.c} file
// win_flex ques9.l -> this will create a {lex.yy.c} file
// gcc lex.yy.c y.tab.c -o ques9.exe -> this will create {.exe} file
// ques9.exe