extern FILE *yyin;

%{
int numero_cuentas = 0;
int numero_cuentas_mismo_pais = 0;
int numero_cuentas_misma_entidad = 0;
int numero_cuentas_misma_oficina = 0;
char country_id[64];
char entity_id[64];
char office_id[64];
%}

letras_id  [A-Z]{2}
espacio [\s]
numeros_entidad [0-9]{4}
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
<ESTADO_IBAN>{numeros_entidad} {
                                    if(strcmp(yytext,entity_id) == 0){
                                        numero_cuentas_misma_entidad++;
                                    }
                                    yymore();
                                }
<ESTADO_IBAN>{numeros_entidad}  {
                                    if(strcmp(yytext,office_id) == 0){
                                        numero_cuentas_misma_oficina++;
                                    }
                                    yymore();
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
            printf("\n El numero total de cuentas bancarias en el fichero es: %d\n", numero_cuentas);
        break;
        case 3:
            yyin=fopen(argv[1],"r");
            strcpy(country_id,argv[2]);
            yylex();
            printf("\n El numero de cuentas pertenecientes al pais '%s', es: %d\n",country_id,numero_cuentas_mismo_pais);
        break;
        case 4:
            yyin=fopen(argv[1],"r");
            strcpy(country_id,argv[2]);
            strcpy(entity_id,argv[3]);
            yylex();
            printf("\nEl numero de cuentas pertenecientes al pais '%s' y la entidad '%s', es: %d\n",country_id,entity_id,numero_cuentas_misma_entidad);
        break;
        case 5:
            yyin=fopen(argv[1],"r");
            strcpy(country_id,argv[2]);
            strcpy(entity_id,argv[3]);
            strcpy(office_id,argv[4]);
            yylex();
            printf("\nEl numero de cuentas pertenecientes al pais '%s',la entidad '%s' y la oficina '%s', es: %d\n",country_id,entity_id,office_id,numero_cuentas_misma_oficina);
        break;
    }
    return 0;
}
