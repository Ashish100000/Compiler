%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%token NUM

%%

start : expr '\n'   { printf("Result = %d\n", $1); }
      ;

expr  : expr '+' expr   { $$ = $1 + $3; }
      | expr '-' expr   { $$ = $1 - $3; }
      | expr '*' expr   { $$ = $1 * $3; }
      | expr '/' expr   { 
                            if ($3 == 0) {
                                yyerror("Division by zero!");
                                exit(1);
                            }
                            $$ = $1 / $3;
                         }
      | '(' expr ')'     { $$ = $2; }
      | NUM              { $$ = $1; }
      ;

%%

void yyerror(const char *s)
{
    printf("Error: %s\n", s);
}

int main()
{
    printf("Enter Expression: ");
    yyparse();
    return 0;
}
