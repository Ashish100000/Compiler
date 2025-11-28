// 1. Write a Lex program to count the number of lines and characters in the input file.
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

//this is how to run the code :- run these 3 commands in cmd 
//make a text file named input.txt and put some text in it
//win_flex ques1.l
//gcc lex.yy.c -o ques1.exe
//ques1.exe < input.txt