%{
#include <stdio.h>

char shift_char(char c) {
    if (c >= 'a' && c <= 'z') {
        return 'a' + ((c - 'a' + 3) % 26);
    }
    if (c >= 'A' && c <= 'Z') {
        return 'A' + ((c - 'A' + 3) % 26);
    }
    return c;
}
%}

%option noyywrap

%%
[a-zA-Z]   { printf("%c", shift_char(yytext[0])); }
.|\n       { printf("%s", yytext); }
%%

int main() {
    yylex();
    return 0;
}
