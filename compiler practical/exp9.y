%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex();
%}

%token VAR NUM

%%

start : expr '\n' { printf("Valid Expression\n"); }
      ;

expr  : expr '+' expr
      | expr '-' expr
      | expr '*' expr
      | expr '/' expr
      | '(' expr ')'
      | VAR
      | NUM
      ;

%%

void yyerror(const char *s)
{
    printf("Invalid Expression\n");
}

int main()
{
    printf("Enter Expression: ");
    yyparse();
    return 0;
}
