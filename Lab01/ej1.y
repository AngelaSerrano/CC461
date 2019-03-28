%{
#include<stdio.h>
#include<string.h>
#include<ctype.h>
char lexema[255];
void yyerror(char *);
%}

%token MAIL
%%
instruccion: instruccion MAIL;
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
    if(isalnum(c)){//puede comenzar con numeros
        int i=0;
        do{
            lexema[i++]=c;
            c=getchar();
           } while(isalnum(c));//numeros y letras
        if(c!='@') return c;
    	c=getchar();
    	while(isalnum(c)){
            	lexema[i++]=c;
        		c=getchar();
    	}
        if(c!='.') return c;
        c=getchar();
        while(isalnum(c)){
                lexema[i++]=c;
                c=getchar();
        } 
        ungetc(c,stdin);
        lexema[i]=0;
        return MAIL;
     }
     return c;
   }
  
}
int main(){
 if(!yyparse()) printf("CADENA VALIDA \n ");
 else printf (" CADENA INVALIDA \n");
 return 0;
}
