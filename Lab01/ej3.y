%{
#include<stdio.h>
#include<string.h>
#include<ctype.h>
char lexema[6];
void yyerror(char *);
%}

%token COD
%%
instruccion: instruccion COD;
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
    if(c > 64 && c < 91 ){ // comience con mayusculas.
        int i=0;
        do{ 
            if(i==5) break;
            lexema[i++]=c;
            c=getchar();
           } while(isalnum(c) || c =='*');
        if(isdigit(c)) return COD;
        ungetc(c,stdin);
        lexema[i]=0;
        return COD;
     }
     return c;
   }
  
}
int main(){
 if(!yyparse()) printf("CADENA VALIDA \n ");
 else printf (" CADENA INVALIDA \n");
 return 0;
}