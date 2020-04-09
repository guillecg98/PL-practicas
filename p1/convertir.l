extern FILE *yyin, *yyout;

%{
#include <stdio.h>
%}

%%
[0-9]+"."+[0-9] ECHO;
[0-9]+  {fprintf(yyout, "%.2f", atof(yytext));}
%%

extern FILE *yyin, *yyout;

int main(int argc, char *argv[])
{

 switch(argc)
  {
   case 2:  yyin=fopen(argv[1],"r");
            break;
   case 3:  yyin=fopen(argv[1],"r");
            yyout=fopen(argv[2],"w");
  }
  yylex();
return 0;
}