%{
    #include "y.tab.h"
%}
%%
.     {return yytext[0];}
[\n]      {return 0;}
%%
