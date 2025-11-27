/* expression_validator.y */
%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token NUMBER
%left '+' '-'
%left '*' '/'

%%

expression: expression '+' expression
          | expression '-' expression
          | expression '*' expression
          | expression '/' expression
          | '(' expression ')'
          | NUMBER
          ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Invalid expression\n");
}

int main() {
    printf("Enter an arithmetic expression: ");
    if (yyparse() == 0) {
        printf("Valid expression\n");
    }
    return 0;
}

/* Lexical Analyzer */
int yylex() {
    int c;
    
    /* Skip whitespace */
    while ((c = getchar()) == ' ' || c == '\t');
    
    /* Check for end of input */
    if (c == '\n' || c == EOF) {
        return 0;
    }
    
    /* Check for numbers */
    if (isdigit(c)) {
        ungetc(c, stdin);
        return NUMBER;
    }
    
    /* Return operators and parentheses as tokens */
    if (c == '+' || c == '-' || c == '*' || c == '/' || c == '(' || c == ')') {
        return c;
    }
    
    /* Invalid character */
    return c;
}
