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
id_error  ({letra}|{digito})+(\_\_)+({letra}+|{digito}+)?
numero  {digito}+(\.{digito}+)?(E[+\-]?{digito}+)?
%x ESTADO_CADENA
%x ESTADO_PARENTESIS
%x ESTADO_COMENTARIO_LINEA
%x Q1 Q2 Q3 Q4
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

{identificador} {printf("\n Identificador: %s --> token %d\n",yytext,ID);}
{id_error}  {printf("\n Identificador incorrecto: %s --> token %d\n",yytext,ERROR);}
{numero}    {printf("\n Numero: %s --> token %d\n",yytext,NUMERO);}

"'" {
        BEGIN ESTADO_CADENA;
    }
<ESTADO_CADENA>"'"  {
                        BEGIN 0;
                        yytext[yyleng-1]='\0';
                        printf("\n Cadena: %s --> token %d\n",yytext,CADENA);
                    }
<ESTADO_CADENA>"\\\'"   {yymore();}
<ESTADO_CADENA>.    {yymore();}
<ESTADO_CADENA>\n    {yymore();}

"#" {
        BEGIN ESTADO_COMENTARIO_LINEA;
    }
<ESTADO_COMENTARIO_LINEA>.* {
                                BEGIN 0;
                                printf("\n Comentario de una linea: %s --> token %d\n", yytext,LINE_COMMENT);
                            }

"(*" {
    yymore();
    BEGIN(Q2);
    }
<Q2>[^*)]   {
                yymore();
            }
<Q2>"*" {
            yymore();
            BEGIN(Q3);
        }
<Q2>")" {
            yymore();
            BEGIN(Q4);
        }
<Q3>"*" {
            yymore();
        }
<Q3>[^*)]   {
                yymore();
                BEGIN(Q2);
            }
<Q3>")" {
            printf("\n Comentario: %s --> token %d\n",yytext,COMMENT);
            BEGIN(INITIAL);
        }
<Q4>[^*]    {
				yymore();
				BEGIN(Q2); /* change to Q2 */
			}
<Q4>"*" {
		    printf("\nError: comentario anidado:%s\n", yytext);
			BEGIN(INITIAL);
		}

":="  {printf("\n Operador Asignación: %s --> token %d\n",yytext,ASIGNACION);}
"+"   {printf("\n Operador Aritmético: %s --> token %d\n",yytext,ARITMETICO);}
"-"   {printf("\n Operador Aritmético: %s --> token %d\n",yytext,ARITMETICO);}
"*"   {printf("\n Operador Aritmético: %s --> token %d\n",yytext,ARITMETICO);}
"/"   {printf("\n Operador Aritmético: %s --> token %d\n",yytext,ARITMETICO);}
"__mod"   {printf("\n Operador Aritmético: %s --> token %d\n",yytext,ARITMETICO);}
"**"   {printf("\n Operador Aritmético: %s --> token %d\n",yytext,ARITMETICO);}
"||"  {printf("\n Operador Alfanumérico (Concatenacion): %s --> token %d\n",yytext,ALFANUM);}
"<" {printf("\n Operador Relacional: %s --> token %d\n",yytext,RELACIONAL);}
"<="    {printf("\n Operador Relacional: %s --> token %d\n",yytext,RELACIONAL);}
">" {printf("\n Operador Relacional: %s --> token %d\n",yytext,RELACIONAL);}
">="    {printf("\n Operador Relacional: %s --> token %d\n",yytext,RELACIONAL);}
"=="    {printf("\n Operador Relacional: %s --> token %d\n",yytext,RELACIONAL);}
"<>"    {printf("\n Operador Relacional: %s --> token %d\n",yytext,RELACIONAL);}
".o."   {printf("\n Operador Relacional: %s --> token %d\n",yytext,RELACIONAL);}
".y."   {printf("\n Operador Relacional: %s --> token %d\n",yytext,RELACIONAL);}
".no."  {printf("\n Operador Relacional: %s --> token %d\n",yytext,RELACIONAL);}

"("    {printf("\n Parentesis de apertura: %s --> token %d\n",yytext,OTROS);}
")"    {printf("\n Parentesis de cierre: %s --> token %d\n",yytext,OTROS);}
;$ {printf("\n Final de sentencia: %s --> token %d\n",yytext,OTROS);}

"?" {printf("\n ERROR: %s simbolo no permitido --> token %d\n",yytext,ERROR);}
"¿" {printf("\n ERROR: %s simbolo no permitido --> token %d\n",yytext,ERROR);}
"!=" {printf("\n ERROR: %s simbolo no permitido --> token %d \n Quizás quisite poner <>\n",yytext,ERROR);}
"!" {printf("\n ERROR: %s simbolo no permitido --> token %d \n Quizás quisite poner .no.\n",yytext,ERROR);}
"&&" {printf("\n ERROR: %s simbolo no permitido --> token %d \n Quizás quisite poner .y.\n",yytext,ERROR);}
"=" {printf("\n ERROR: %s simbolo no permitido --> token %d \n Quizás quisite poner :=\n",yytext,ERROR);}
":" {printf("\n ERROR: %s simbolo no permitido --> token %d \n Quizás quisite poner ;\n",yytext,ERROR);}

.|\n   ECHO;
%%

extern FILE *yyin;
int  main(int argc, char *argv[])
{

    switch(argc){
        case 2:
            yyin=fopen(argv[1],"r");
            if(yyin == NULL){
                printf("Error al abrir el archivo <%s>\n",argv[1]);
                exit(-1);
            }
            yylex();
        break;
    }
    return 0;
}

