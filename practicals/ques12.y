%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%%

start : A 'b' '\n'     { printf("Valid string\n"); }
      ;

A : A 'a'              /* keep counting more a’s */
  | a10                /* at least 10 a's initially */
  ;

a10 : 'a''a''a''a''a''a''a''a''a''a'   /* exactly 10 a’s */

%%

void yyerror(const char *s)
{
    printf("Invalid string\n");
}

int main()
{
    printf("Enter string: ");
    yyparse();
    return 0;
}
