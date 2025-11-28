// 11. Program in YACC to recognize the string „abbb‟, „ab‟ „a‟ of the langauge (an b 
// n , n>=1).
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

// you have to make one more file  name --> ques11.y
////this is how to run the code :- run these 3 commands in cmd
//win_bison -dy ques11.y -> this will create a {y.tab.c} file
// win_flex ques11.l -> this will create a {lex.yy.c} file
// gcc lex.yy.c y.tab.c -o ques11.exe -> this will create {.exe} file
// ques11.exe