%{
#include<stdio.h>
#include<string.h>
#include<ctype.h>
char lexema[255];
void yyerror(char *);
%}

%token HEX
%%
instruccion: instruccion HEX;
instruccion: ;
%%

void yyerror(char *mgs){
    printf("Error: %s ",mgs);
    }

int yylex(){
 char c;
 while(1){
    c=getchar();
    if(c=='\n') continue;
    if(c==' ') continue;
    if(isdigit(c) || (c > 64 && c < 71 )){ //Para el alfabeto
        // {0,1,2,..,9,A,B,C..,F}
        int i=0;
        do{
            lexema[i++]=c;
            c=getchar();
           } while(isdigit(c) || (c > 64 && c < 71) );
        ungetc(c,stdin);
        lexema[i]=0;
        return HEX;
     }
     return c;
   }
  
}
int main(){
 if(!yyparse()) printf("CADENA VALIDA \n ");
 else printf (" CADENA INVALIDA \n");
 return 0;
}