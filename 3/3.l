%{
    #include<stdio.h>
    int single=0,multi=0,mlines=0,flag=0,flag2=0;
%}
%%
"/*"    {flag=1;}
"*/"    {if(flag==1){flag=0;multi++;mlines++;}}
"//"[^\n*]*  {if(flag==0)single++;flag2=1;}
\n      {if(flag==1){mlines++;}flag2=0;}
.       {if(flag==0 && flag2==0)ECHO;}
%%
int main()
{
    yyin=fopen("inp.txt","r");
    yyout=fopen("out.txt","w");
    yylex();
    printf("Single: %d\nMulti: %d\nMlines: %d\n",single,multi,mlines);
    return 0;
}
int yywrap()
{
    return 1;
}