extern FILE *yyin;

%{
#include "analizador_lexico.h"
%}

/*Definiciones de los componentes lexicos (excepto palabras reservadas)*/
espacio [ \t\n]
espacios    {espacio}+
letra   [a-zA-Z]
digito  [0-9]
identificador   {letra}(\_?({letra}|{digito}))*
numero  {digito}+(\.{digito}+)?(E[+\-]?{digito}+)?

/*Zona de las reglas*/
%%
{espacios}   { /* no se hace nada */ ; }
(?i:inicio) {printf("\n Palabra reservada: %s --> token %d\n", yytext,INICIO);}
(?i:fin)    {printf("\n Palabra reservada: %s --> token %d\n",yytext,FIN);}
(?i:leer)   {printf("\n Palabra reservada: %s --> token %d\n",yytext,LEER);}
(?i:escribir)   {printf("\n Palabra reservada: %s --> token %d\n",yytext,ESCRIBIR);}
(?i:si) {printf("\n Palabra reservada: %s --> token %d\n",yytext,SI);}
(?i:entonces)   {printf("\n Palabra reservada: %s --> token %d\n",yytext,ENTONCES);}
(?i:si_no)  {printf("\n Palabra reservada: %s --> token %d\n",yytext,SI_NO);}
(?i:fin_si) {printf("\n Palabra reservada: %s --> token %d\n",yytext,FIN_SI);}
(?i:mientras)   {printf("\n Palabra reservada: %s --> token %d\n",yytext,MIENTRAS);}
(?i:hacer)  {printf("\n Palabra reservada: %s --> token %d\n",yytext,HACER);}
(?i:fin_mientras)   {printf("\n Palabra reservada: %s --> token %d\n",yytext,FIN_MIENTRAS);}
(?i:repetir)    {printf("\n Palabra reservada: %s --> token %d\n",yytext,REPETIR);}
(?i:hasta_que)  {printf("\n Palabra reservada: %s --> token %d\n",yytext,HASTA_QUE);}
(?i:para)   {printf("\n Palabra reservada: %s --> token %d\n",yytext,PARA);}
(?i:desde)  {printf("\n Palabra reservada: %s --> token %d\n",yytext,DESDE);}
(?i:hasta)  {printf("\n Palabra reservada: %s --> token %d\n",yytext,HASTA);}
(?i:paso)   {printf("\n Palabra reservada: %s --> token %d\n",yytext,PASO);}
(?i:fin_para)   {printf("\n Palabra reservada: %s --> token %d\n",yytext,FIN_PARA);}
{identificador} {printf("\n Identificador %s --> token %d\n",yytext,ID);}
{numero}    {printf("\n Numero %s --> token %d\n",yytext,NUMERO);}

%%

extern FILE *yyin;
int  main(int argc, char *argv[])
{

    switch(argc){
        case 2:
            yyin=fopen(argv[1],"r");
            yylex();
        break;
    }

    return 0;
}

