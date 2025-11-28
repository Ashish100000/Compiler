// 8. A program in Lex to recognize a valid arithmetic expression.

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

//this is how to run the code :- run these 3 commands in cmd
//win_flex ques8.l
//gcc lex.yy.c -o ques8.exe 
//ques8.exe 
//(a+b)*10 - c - it should be valid expression
//(a+b)*10 - c$ - it should be invalid expression
