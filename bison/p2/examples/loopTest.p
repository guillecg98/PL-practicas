
repeat
    clear;
    writestring ('Menú de comprobación de bucles');
    writestring ('\t1. Bucle while.\n\t2. Bucle repeat.\n\t3. Bucle for.\n\t4. Salir.\n');
    writestring (' Elige una opción ');
    read (opcion);

    if (opcion = 1) then
        clear;
        writestring (' \t\tComprobando bucle while mediante una variable a \n');
        a := 1;
        while (a < 10) do
            if ( a % 2 = 0 ) then
                writestring ('La variable iteradora toma valor par ' );
            else
                writestring ('La variable iteradora toma valor impar ');
            endif
            write (a);
            a++;
        endwhile
    endif

    if (opcion = 2) then
        clear;
        writestring (' \t\tComprobando bucle repeat-until mediante la concatenación de cadenas\n');
        writestring (' Indica un número de palabras a concatenar ');
        read (palabras);
        frase := '';
        repeat 
            writestring (' Escribe una palabra a concatenar ');
            readstring (temp);
            frase := frase || ' ' || temp;
            palabras--;
        until (palabras = 0)
        writestring (' \nHas escrito la frase: ' || frase );
    endif

    if ( opcion = 3) then
        clear;
        writestring (' \t\tComprobando bucle for mediante sucesión fibonacci\n');
        writestring (' Indica cuantos números de la sucesión quiere ver ');
        read(cantidad);

        previo := -1;
        resultado := 1;

        for i from 0 to cantidad-1 do 
            suma := resultado + previo;
            previo := resultado;
            resultado := suma;
            write (resultado);
        endfor

    endif

    writestring('\n\n\nPesiona cualquier tecla para continuar...');
    readstring (pause);
    
until(opcion = 4)
