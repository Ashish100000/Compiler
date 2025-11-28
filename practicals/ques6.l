//  6. Write a Lex program to count the number of words, characters, blank spaces and 
// lines in a C file.

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

//this is how to run the code :- run these 3 commands in cmd 
//make a text file named input.txt and put some text in it
//win_flex exp6.l
//gcc lex.yy.c -o exp6.exe
//exp6.exe < input.txt