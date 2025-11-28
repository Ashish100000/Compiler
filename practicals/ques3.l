//  3. Write a Lex program that implements the Caesar cipher: it replaces every letter 
// with the one three letters after in in alphabetical order, wrapping around at Z. e.g. 
// a is replaced by d, b by e, and so on z by c.
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
//this is how to run the code :- run these 3 commands in cmd 
//make a text file named input.txt and put some text in it
//win_flex ques3.l
//gcc lex.yy.c -o ques3.exe
//ques3.exe < input.txt