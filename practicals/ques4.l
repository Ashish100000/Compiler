// 4. Write a Lex program that finds the longest word (defined as a contiguous string 
// of upper and lower case letters) in the input.

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
//this is how to run the code :- run these 3 commands in cmd 
//make a text file named input.txt and put some text in it
//win_flex ques4.l
//gcc lex.yy.c -o ques4.exe
//ques4.exe < input.txt