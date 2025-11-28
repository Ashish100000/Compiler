//  7. Write a Lex specification program that generates a C program which takes a 
// string “abcd” and prints the following output:
//  abcd
//  abc
//  ab
//  a 
%{
#include <stdio.h>
#include <stdlib.h>
%}

%%

. {
    printf("#include <stdio.h>\n");
    printf("int main() {\n");
    printf("    char str[] = \"abcd\";\n");
    printf("    for (int i = 4; i > 0; i--) {\n");
    printf("        for (int j = 0; j < i; j++) {\n");
    printf("            printf(\"%%c\", str[j]);\n");
    printf("        }\n");
    printf("        printf(\"\\n\");\n");
    printf("    }\n");
    printf("    return 0;\n");
    printf("}\n");
    exit(0);
}

%%

int main() {
    yylex();
    return 0;
}

int yywrap() { return 1; }

//this is how to run the code :- run these 3 commands in cmd 
//win_flex exp7.l
//gcc lex.yy.c -o exp7.exe
//exp7.exe
// The output will be a C program that prints the desired pattern.
// You can redirect this output to a file and compile it to see the pattern.