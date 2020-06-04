place (1, 1);

@Lectura y escritura de cadenas
readstring (A);
writestring (A);

@Lectura y escritura de numeros y lógicos (cambio dinámico)
read (A);
write (A);

@Asignación de cadenas
A := 'Hola mundo';
writestring (A);
writestring ( '¡' || A || '!');

@Asignación de números
A := 15 quotient 4;
write (A);

A := 15 % 4;
write (A);

A +:= 2;
write (A);

A -:= 2;
write (A);

A++;
write (A);

A--;
write (A);

@Asignación de lógicos
A := ( true and true );
write (A);

A := ( true and false);
write (A);

A := ( true or false);
write (A);

A := ( not A );
write (A);

A := ( 'HOLA' < 'MUNDO' );
write (A);

A := ( 'HOLA' <= 'MUNDO' );
write (A);

A := ( 'HOLA' > 'MUNDO' );
write (A);

A := ( 'HOLA' >= 'MUNDO' );
write (A);

A := ( 'HOLA' <> 'MUNDO' );
write (A);


