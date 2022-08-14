%{
    #include<stdio.h>
    #include<stdlib.h>
    char addtotable(char,char,char);
    void assembly();
    int ind=0;
    char temp='A';
    struct incod
    {
        char opr;
        char opd1;
        char opd2;
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
|EXP        {$$=(char)$1;}
|NUM        {$$=(char)$1;}
;
%%
char addtotable(char opd1,char opd2,char opr)
{
    code[ind].opd1=opd1;
    code[ind].opd2=opd2;
    code[ind].opr=opr;
    ind++;
    temp++;
    return temp;
}
void assembly()
{
    printf("\tAssembly code\n");
    temp++;
    for(int i=0;i<ind;i++)
    {
        char a,b,c;
        a=code[i].opd1;
        b=code[i].opd2;
        c=code[i].opr;
        printf("MOV R1, %c\n",a);
        printf("MOV R2, %c\n",b);
        switch(c)
        {
            case '+':
                printf("ADD %c, R1, R2\n",temp);
                break;
            case '-':
                printf("SUB %c, R1, R2\n",temp);
                break;
            case '*':
                printf("MUL %c, R1, R2\n",temp);
                break;
            case '/':
                printf("DIV %c, R1, R2\n",temp);
                break;
            case '=':
                printf("MOV R1,R2\n");
                break;
            default:
                printf("Invalid Expression\n");
                exit(0);
        }
        temp++;
    }
}
int main()
{
    printf("Enter the expression:\n");
    yyparse();
    temp='A';
    assembly();
    return 0;
}
int yyerror()
{
    printf("Invalid expression\n");
    exit(0);
}