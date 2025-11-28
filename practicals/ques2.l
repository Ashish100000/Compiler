//  2. Lex program to count the number of vowels and consonants in a given string
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

//this is how to run the code :- run these 3 commands in cmd 
//make a text file named input.txt and put some text in it
//win_flex ques2.l
//gcc lex.yy.c -o ques2.exe 
//ques2.exe < input.txt