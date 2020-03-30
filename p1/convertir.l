extern FILE *yyin, *yyout;

%{
#include <stdio.h>
%}

%%

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