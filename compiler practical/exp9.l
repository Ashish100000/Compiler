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
