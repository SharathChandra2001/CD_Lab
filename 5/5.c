#include<stdio.h>
#include<stdlib.h>
#include<string.h>
char inp[30],arr[30],stk[30],temp[30];
int i=0,j=0,k=0,l=0,r=0,s=0;
void dispstk()
{
    printf("\n");
    for(k=0;k<strlen(stk);k++)
        printf("%c",stk[k]);
}
void dispinp()
{
    printf("\t\t\t");
    for(k=0;k<strlen(inp);k++)
        printf("%c",inp[k]);
    printf("$");
}
void assign()
{
    stk[++j]=arr[i];
    inp[i]=' ';
    dispstk();
    dispinp();
}
int main()
{
    printf("\t\t\tGrammer : E -> E+E | E-E | E*E | i\n");
    printf("Enter the string:\n");
    gets(inp);
    printf("Stack\t\t\tInput\t\t\tAction\n");
    printf("$");
    dispinp();
    printf("\t\t\tShift\n");
    for(k=0;k<strlen(inp);k++)
        arr[k]=inp[k];
    l=strlen(inp);
    stk[0]='$';
    for(i=0;i<l;i++)
    {
        switch(arr[i])
        {
            case 'i':
                assign();
                printf("\t\t\tReduce by E->i");
                stk[j]='E';
                dispstk();
                dispinp();
                if(arr[i+1]!='\0')
                    printf("\t\t\tShift\n");
                break;
            case '+':
            case '*':
            case '-':
                assign();
                printf("\t\t\tShift");
                break;
            default:
                printf("String not accepted\n");
                return 0;
        }
    }
    l=strlen(stk);
    while(l>2)
    {
        r=0;
        for(k=l-1;k>=l-3;k--)
        {
            temp[r]=stk[k];
            r++;
        }
        if(strcmp(temp,"E+E")==0 || strcmp(temp,"E-E")==0 || strcmp(temp,"E*E")==0)
        {
            for(k=l-1;k>=l-3;k--)
            {
                stk[k]=' ';
            }
            stk[l-3]='E';
            printf("\t\t\tReduce by E->");
            for(k=0;k<strlen(temp);k++)
                printf("%c",temp[k]);
            dispstk();
            dispinp();
            l-=2;
        }
        else
        {
            printf("String not accepted\n");
            return 0;
        }
    }
    printf("\t\t\tAccept");
    printf("\n\nString Accepted\n");
    return 0;
}