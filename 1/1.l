%{
    #include<stdio.h>
    int lines=1, words=0, chars=0, spaces=0;
%}
%%
[\n]    {lines++;}
[\t]    {spaces+=4;}
[ ]     {spaces++;}
[^\n\t #]+   {words++;chars+=yyleng;}
[#]       {return 0;}
%%
int main()
{
    printf("Enter the paragraph:\n");
    yylex();
    printf("\nLines: %d\nWords: %d\nChars: %d\nSpaces: %d\n",lines,words,chars,spaces);
}
int yywrap()
{
    return 1;
}
