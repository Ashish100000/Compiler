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
