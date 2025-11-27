%{
#include <stdio.h>

int vowels = 0;
int consonants = 0;
%}

%option noyywrap

%%
[aeiouAEIOU]      { vowels++; }
[a-zA-Z]          { consonants++; }
.|\n              ;    /* ignore other characters */
%%

int main() {
    yylex();
    printf("Total Vowels: %d\n", vowels);
    printf("Total Consonants: %d\n", consonants);
    return 0;
}
