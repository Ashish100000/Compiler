%{
#include <stdio.h>
#include <string.h>

char longest[1000] = "";
%}

%option noyywrap

%%
[a-zA-Z]+  {
                if (strlen(yytext) > strlen(longest)) {
                    strcpy(longest, yytext);
                }
            }

.|\n        ;
%%

int main() {
    yylex();
    printf("Longest Word: %s\n", longest);
    printf("Length: %lu\n", strlen(longest));
    return 0;
}
