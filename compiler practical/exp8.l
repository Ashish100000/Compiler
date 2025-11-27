%{
#include <stdio.h>
int valid = 1;   // assume expression is valid initially
%}

%%
[0-9]+                  { }     // numbers
[a-zA-Z_][a-zA-Z0-9_]*  { }     // variables / identifiers
[+\-*/]                 { }     // arithmetic operators
"("                     { }
")"                     { }
[ \t\n]+                { }     // ignore whitespace

.                       { valid = 0; }   // any invalid character
%%

int main()
{
    printf("Enter an arithmetic expression:\n");
    yylex();

    if(valid)
        printf("Valid arithmetic expression\n");
    else
        printf("Invalid arithmetic expression\n");

    return 0;
}

int yywrap() { return 1; }
