%{
#include <stdio.h>
#include "y.tab.h"
%}

%option noyywrap

%%
"+"         return ADD;
"-"         return SUB;
"*"         return MUL;
"/"         return DIV;
"("         return LP;
")"         return RP;
"\n"        return CR;
[ \t]+      ;
[1-9][0-9]* {
    int val;
    sscanf(yytext, "%d", &val);
    yylval.num = val;
    return NUMBER;
}
%%