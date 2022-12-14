%{
    #include<stdio.h>
    #include<stdlib.h>
    int p=0,n=0,pf=0,nf=0;
%}
%%
[+]?[0-9]+  p++;
[-][0-9]+   n++;
[+]?[0-9]+[.][0-9]+ pf++;
[-][0-9]+[.][0-9]+  nf++;
[+]?[0-9]+([.][0-9]+)?[/][+]?[0-9]+([.][0-9]+)? pf++;
[-][0-9]+([.][0-9]+)?[/][-][0-9]+([.][0-9]+)?   pf++;
[+]?[0-9]+([.][0-9]+)?[/][-][0-9]+([.][0-9]+)?  nf++;
[-][0-9]+([.][0-9]+)?[/][+]?[0-9]+([.][0-9]+)?  nf++;
[ ] ;
%%
int main()
{
    printf("Enter nos:\n");
    yylex();
    printf("\nPositives: %d\n Negatives: %d\n PFs: %d\n NFs: %d\n",p,n,pf,nf);
    return 0;
}
int yywrap()
{
    return 1;
}