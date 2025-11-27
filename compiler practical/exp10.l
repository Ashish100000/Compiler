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
