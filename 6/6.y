%{
    #include<stdio.h>
    #include<stdlib.h>
    void quadruple();
	char addToTable(char ,char, char); 
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
%token <sym> NUM LET
%type <sym> expr
%left '-' '+'
%right '*' '/'
%%
S: LET '=' expr ';' {addToTable((char)$1,(char)$3,'=');}
|  expr ';'
;
expr: expr '+' expr {$$ = addToTable((char)$1,(char)$3,'+');}
|   expr '-' expr {$$ = addToTable((char)$1,(char)$3,'-');}
|   expr '*' expr {$$ = addToTable((char)$1,(char)$3,'*');}
|   expr '/' expr {$$ = addToTable((char)$1,(char)$3,'/');}
|   '(' expr ')'  {$$ = (char) $2;}
|   NUM {$$ = (char) $1;}
|   LET {$$ = (char) $1;}
;
%%
char addToTable(char opd1, char opd2, char opr)
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
    printf("\t\t\t Quadruple representation\n");
    temp++;
    for(int i=0;i<ind;i++)
    {
        printf("\t%c",code[i].opr);
        if(isalnum(code[i].opd1))
        {
            printf("\t%c",code[i].opd1);
        }
        else
            printf("\t%c",temp);
        if(isalnum(code[i].opd2))
        {
            printf("\t%c",code[i].opd2);
        }
        else
            printf("\t%c",temp);    
        printf("\t%c\n",temp);
        temp++;
    }
}
int main()
{
    printf("Enter the expression:\n");
    yyparse();
    temp = 'A';
    quadruple();
}
int yyerror()
{
    printf("Invalid\n");
    exit(0);
}