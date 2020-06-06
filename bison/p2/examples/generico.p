clear;
place (1, 1);

@Lectura y escritura de cadenas
readstring (A);
writestring (A);

@Lectura y escritura de numeros y lógicos (cambio dinámico)
read (A);
write (A);

@Asignación de cadenas
A := 'Hola mundo';

writestring ('A := \'Hola mundo\';');
writestring (A);

writestring ('writestring ( \'¡\' || A || \'!\');');
writestring ( '¡' || A || '!');

@Asignación de números
writestring ('A := 15 quotient 4;');
A := 15 quotient 4;
write (A);

writestring ('A := 15 % 4;');
A := 15 % 4;
write (A);

writestring ('A +:= 2;');
A +:= 2;
write (A);

writestring ('A -:= 2;');
A -:= 2;
write (A);

writestring ('A++;');
A++;
write (A);

writestring ('A--;');
A--;
write (A);

@Asignación de lógicos
writestring ('A := ( true and true );');
A := ( true and true );
write (A);

writestring ('A := ( true and false);');
A := ( true and false);
write (A);

writestring ('A := ( true or false);');
A := ( true or false);
write (A);

writestring ('A := ( not A );');
A := ( not A );
write (A);

writestring ('A := ( \'HOLA\' < \'MUNDO\' );');
A := ( 'HOLA' < 'MUNDO' );
write (A);

writestring ('A := ( \'HOLA\' <= \'MUNDO\' );');
A := ( 'HOLA' <= 'MUNDO' );
write (A);

writestring ('A := ( \'HOLA\' > \'MUNDO\' );');
A := ( 'HOLA' > 'MUNDO' );
write (A);

writestring ('A := ( \'HOLA\' >= \'MUNDO\' );');
A := ( 'HOLA' >= 'MUNDO' );
write (A);

writestring ('A := ( \'HOLA\' <> \'MUNDO\' );');
A := ( 'HOLA' <> 'MUNDO' );
write (A);


