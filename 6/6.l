%{
    #include "y.tab.h"
%}
%%
[0-9]+  {yylval.sym=(char)yytext[0];return NUM;}
[a-zA-Z]*   {yylval.sym=(char)yytext[0];return EXP;}
.   {return yytext[0];}
\n  {return 0;}
%%