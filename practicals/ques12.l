// 12. Program in YACC to recognize the language (an b , n>=10). (output to say input 
// is valid or not) 
%{
#include "y.tab.h"
%}

%%

a       { return 'a'; }
b       { return 'b'; }
\n      { return '\n'; }
[ \t]   { /* ignore spaces */ }

.       { return yytext[0]; }

%%

int yywrap() { return 1; }

// you have to make one more file  name --> ques12.y
////this is how to run the code :- run these 3 commands in cmd
//win_bison -dy ques12.y -> this will create a {y.tab.c} file
// win_flex ques12.l -> this will create a {lex.yy.c} file
// gcc lex.yy.c y.tab.c -o ques12.exe -> this will create {.exe} file
// ques12.exe