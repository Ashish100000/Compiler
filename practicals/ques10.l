// 10. A Program in YACC to evaluate an expression (simple calculator program for 
// addition and subtraction, multiplication, division)

%{
#include "y.tab.h"
%}

%%

[0-9]+         { yylval = atoi(yytext); return NUM; }

[+\-*/()]      { return yytext[0]; }

[ \t]          { /* skip spaces */ }

\n             { return '\n'; }

.              { /* ignore invalid character */ }

%%

int yywrap() { return 1; }
// you have to make one more file  name --> ques10.y
////this is how to run the code :- run these 3 commands in cmd
//win_bison -dy ques10.y -> this will create a {y.tab.c} file
// win_flex ques10.l -> this will create a {lex.yy.c} file
// gcc lex.yy.c y.tab.c -o ques10.exe -> this will create {.exe} file
// ques10.exe