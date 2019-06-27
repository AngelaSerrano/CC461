%{
#include<stdio.h>
#define YYSTYPE int
extern char *yytext;
int yyerror(char *s);
int yylex();
int flag=0;
%}

%token IF ELSE OP CL OB CB ID MAYOR MENOR EQUAL IG NUM
%type <int> NUM
%%
s:	IF OP condition CL OB listaInstr CB  ELSE OB  listaInstr CB
	| IF OP condition CL OB listaInstr CB;

condition:	NUM
	| NUM MAYOR NUM {if($1 > $3) flag=1;}
	| NUM MENOR NUM {if($1 < $3) printf("Hola");}
	| NUM EQUAL NUM {if($1 ==  $3) flag=1;}
	|;
listaInstr: instruccion listaInstr
	    | ;
instruccion: 	ID IG  NUM 
	   	| ID IG  ID;

%%
#include "lex.yy.c"

int yyerror(char *s){
	printf("%s",s);
}
int main(){
	if(!yyparse()) printf("Todo bien (:\n");
	else printf("Revisa again :c\n");
	printf("valor de flag: %d", flag);
}
