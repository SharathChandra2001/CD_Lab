%{
	#include<stdio.h>
	#include<stdlib.h>
%}
%%
S:A B
;
A:'a'A'b'
|
;
B:'b'B'c'
|
;
%%
int main()
{
	printf("Enter the string:\n");
	yyparse();
	printf("Valid string\n");
	return 0;
}
int yyerror()
{
	printf("Invalid string\n");
	exit(0);
}