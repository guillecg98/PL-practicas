extern FILE *yyin;

%{
#include <stdio.h>

int total_words = 0;
int word = 0;
char concrete_word[64];
%}


/*{concrete_word} {word++; REJECT;}*/

%%
[a-zA-ZáÁéÉíÍóÓúÚñN]+   {
                            total_words++;
                            if(strcmp(yytext,concrete_word) == 0){
                                word++;
                            }
                        }
[:num:] {ECHO;}
.|\n    {ECHO;}
%%

extern FILE *yyin, *yyout;
int  main(int argc, char *argv[])
{

 switch(argc)
  {
        case 2:
            yyin=fopen(argv[1],"r");
            if(yyin == NULL){
                printf("Error al abrir el archivo <%s>\n",argv[1]);
                exit(-1);
            }
            yylex();
            printf("El total de palabras es: %d\n",total_words);
        break;
        case 3:
            yyin=fopen(argv[1],"r");
            if(yyin == NULL){
                printf("Error al abrir el archivo <%s>\n",argv[1]);
                exit(-1);
            }
            strcpy(concrete_word,argv[2]);
            yylex();
            printf("El total de palabras es: %d. Y la palabra <%s> aparece %d veces\n",total_words,concrete_word,word);
        break;
  }

  return 0;
}
