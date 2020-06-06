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

writestring ('--------------------\nA := \'Hola mundo\';');
writestring (A);

writestring ('--------------------\nwritestring ( \'¡\' || A || \'!\');');
writestring ( '¡' || A || '!');

@Asignación de números
writestring ('--------------------\nA := 15 quotient 4;');
A := 15 quotient 4;
write (A);

writestring ('--------------------\nA := 15 % 4;');
A := 15 % 4;
write (A);

writestring ('--------------------\nA +:= 2;');
A +:= 2;
write (A);

writestring ('--------------------\nA -:= 2;');
A -:= 2;
write (A);

writestring ('--------------------\nA++;');
A++;
write (A);

writestring ('--------------------\nA--;');
A--;
write (A);

@Asignación de lógicos
writestring ('--------------------\nA := ( true and true );');
A := ( true and true );
write (A);

writestring ('--------------------\nA := ( true and false);');
A := ( true and false);
write (A);

writestring ('--------------------\nA := ( true or false);');
A := ( true or false);
write (A);

writestring ('--------------------\nA := ( not A );');
A := ( not A );
write (A);

writestring ('--------------------\nA := ( \'HOLA\' < \'MUNDO\' );');
A := ( 'HOLA' < 'MUNDO' );
write (A);

writestring ('--------------------\nA := ( \'HOLA\' <= \'MUNDO\' );');
A := ( 'HOLA' <= 'MUNDO' );
write (A);

writestring ('--------------------\nA := ( \'HOLA\' > \'MUNDO\' );');
A := ( 'HOLA' > 'MUNDO' );
write (A);

writestring ('--------------------\nA := ( \'HOLA\' >= \'MUNDO\' );');
A := ( 'HOLA' >= 'MUNDO' );
write (A);

writestring ('--------------------\nA := ( \'HOLA\' <> \'MUNDO\' );');
A := ( 'HOLA' <> 'MUNDO' );
write (A);


