%{
#include <stdio.h>
%}

%union {
    int num;
}

%token <num> NUMBER

%type <num> expr term prim

%token ADD SUB MUL DIV LP RP CR

%%
lines
    : lines line
    | line
    ;

line
    : expr CR
    {
        printf("= %d\n", $1);
    }
    ;

expr
    : term
    | expr ADD term
    {
        $$ = $1 + $3;
    }
    | expr SUB term
    {
        $$ = $1 - $3;
    }
    ;

term
    : prim
    | term MUL prim
    {
        $$ = $1 * $3;
    }
    | term DIV prim
    {
        $$ = $1 / $3;
    }
    ;

prim
    : NUMBER
    | LP expr RP
    {
        $$ = $2;
    }
    ;


%%
int yyerror(char const *str)
{
    fprintf(stderr, "error: %s\n", str);
    return 1;
}

int main(void)
{
    return yyparse();
}

