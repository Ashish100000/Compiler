%{
#include <stdio.h>

int chars = 0, words = 0, spaces = 0, lines = 0;
%}
WORD        [a-zA-Z0-9_]+
%%
{WORD}          { words++; chars += yyleng; }
" "             { spaces++; chars++; }
\n              { lines++; chars++; }
.               { chars++; }
%%
int main() {
    yylex();
    printf("Total Characters: %d\n", chars);
    printf("Total Words: %d\n", words);
    printf("Total Blank Spaces: %d\n", spaces);
    printf("Total Lines: %d\n", lines);
    return 0;
}

int yywrap() { return 1; }
