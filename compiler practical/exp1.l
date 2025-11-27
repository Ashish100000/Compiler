%{
#include <stdio.h>

int lines = 0;
int chars = 0;
%}

%option noyywrap

%%
\n      { lines++; chars++; }
.       { chars++; }
%%

int main() {
    yylex();
    printf("Total Lines: %d\n", lines);
    printf("Total Characters: %d\n", chars);
    return 0;
}
