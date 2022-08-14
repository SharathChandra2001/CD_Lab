%{
    #include<stdio.h>
    #include<stdlib.h>
    char addtotable(char,char,char);
    void quadruple();
    int ind=0;
    char temp='A';
    struct incod
    {
        char opd1;
        char opd2;
        char opr;
    }code[20];
%}
%union
{
    char sym;
}
%token <sym> NUM EXP
%type <sym> E
%left '+' '-'
%left '*' '/'
%%
S:EXP'='E';'    {addtotable((char)$1,(char)$3,'=');}
|E';'
;
E:E'+'E     {$$=addtotable((char)$1,(char)$3,'+');}
|E'-'E      {$$=addtotable((char)$1,(char)$3,'-');}
|E'*'E      {$$=addtotable((char)$1,(char)$3,'*');}
|E'/'E      {$$=addtotable((char)$1,(char)$3,'/');}
|'('E')'    {$$=(char)$2;}
|NUM        {$$=(char)$1;}
|EXP        {$$=(char)$1;}
;
%%
char addtotable(char opd1,char opd2,char opr)
{
    code[ind].opd1 = opd1;
    code[ind].opd2 = opd2;
    code[ind].opr = opr;
    ind++;
    temp++;
    return temp;
}
void quadruple()
{
    printf("\t\t\tQuadruple Representation\n");
    printf("\n\tOPR\tOPD1\tOPD2\tRES\n");
    temp++;
    for(int i=0;i<ind;i++)
    {
        printf("\t%c\t%c\t%c\t%c\n",code[i].opr,code[i].opd1,code[i].opd2,temp);
        temp++;
    }
}
int main()
{
    printf("Enter the expression:\n");
    yyparse();
    temp='A';
    quadruple();
}
int yyerror()
{
    printf("Invalid expression\n");
    exit(0);
}