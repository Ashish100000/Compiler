//  5. Write a Lex program that distinguishes keywords, integers, floats, identifiers, 
// operators, and comments in any simple programming language.

%{
#include <stdio.h>
%}

KEYWORD      (int|float|char|if|else|while|for|return)
IDENTIFIER   [a-zA-Z_][a-zA-Z0-9_]*
NUMBER       [0-9]+(\.[0-9]+)?
OPERATOR     [\+\-\*/=<>]
SPECIAL      [\(\)\{\}\[\];,]

%%

{KEYWORD}      { printf("Keyword: %s\n", yytext); }
{NUMBER}       { printf("Number: %s\n", yytext); }
{IDENTIFIER}   { printf("Identifier: %s\n", yytext); }
{OPERATOR}     { printf("Operator: %s\n", yytext); }
{SPECIAL}      { printf("Special Symbol: %s\n", yytext); }

[ \t\n]+       ;    
.              { printf("Unknown: %s\n", yytext); }

%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}

//this is how to run the code :- run these 3 commands in cmd 
//make a text file named input.txt and put some text in it
//win_flex exp5.l
//gcc lex.yy.c -o exp5.exe
//exp5.exe < input.txt