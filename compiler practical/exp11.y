%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%%

start : S '\n'   { printf("Valid string (a^n b^n)\n"); }
      ;

S : 'a' S 'b'    /* a S b → ensures equal number of a and b */
  | 'a' 'b'      /* base case: ab */
  ;

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
