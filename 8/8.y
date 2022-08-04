%{
    #include<stdio.h>
    #include<stdlib.h>
    void quadruple();
    void assembly();
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
void assembly()
{
    printf("\t\t\t Assembly Code\n");
    temp++;
    for(int i=0;i<ind;i++)
    {
        char a,b,c;
        if(isalnum(code[i].opd1))
        {
            a=code[i].opd1;
        }
        else
            a=temp;
        if(isalnum(code[i].opd2))
        {
            b=code[i].opd2;
        }
        else
            b=temp;    
        c=temp;
        printf("MOVE R1, %c\n",a);
        printf("MOVE R2, %c\n",b);
        switch(code[i].opr)
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
                printf("MOV R1, R2\n");
            break;
        }
        
        temp++;
    }
}
int main()
{
    printf("Enter the expression:\n");
    yyparse();
    temp = 'A';
    assembly();
}
int yyerror()
{
    printf("Invalid\n");
    exit(0);
}