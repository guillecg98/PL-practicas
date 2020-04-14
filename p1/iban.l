extern FILE *yyin;

%{
int numero_cuentas = 0;
int numero_cuentas_mismo_pais = 0;
char country_id[64];
%}

letras_id  [A-Z]{2}
numeros_id  [0-9]{2}
%x ESTADO_IBAN

%%
{letras_id}    {
                BEGIN ESTADO_IBAN;
                if(strcmp(yytext,country_id) == 0){
                    numero_cuentas_mismo_pais++;
                }
                }
<ESTADO_IBAN>\n {
                    numero_cuentas++;
                    BEGIN 0;
                }
.|\n    {ECHO;}
%%

extern FILE *yyin;

int  main(int argc, char *argv[])
{

    switch(argc){
        case 2:
            yyin=fopen(argv[1],"r");
            yylex();
            printf("\n El numero total de cuentas en el fichero es: %d\n", numero_cuentas);
        break;
        case 3:
            yyin=fopen(argv[1],"r");
            strcpy(country_id,argv[2]);
            yylex();
            printf("\n El numero de cuentas correspondientes al pais '%s' es: %d\n",country_id,numero_cuentas_mismo_pais);
        break;
    }
    return 0;
}
