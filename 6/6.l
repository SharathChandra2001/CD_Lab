%{
    #include "y.tab.h"
%}
%%
[0-9]+  {yylval.sym=(char)yytext[0];return NUM;}
[a-zA-Z]+   {yylval.sym=(char)yytext[0];return LET;}
\n  {return 0;}
.   {return yytext[0];}
%%