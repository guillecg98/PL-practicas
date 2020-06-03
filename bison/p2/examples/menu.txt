#
  Asignatura:    Procesadores de Lenguajes

  Titulación:    Ingeniería Informática
  Especialidad:  Computación
  Curso:         Tercero
  Cuatrimestre:  Segundo

  Departamento:  Informática y Análisis Numérico
  Centro:        Escuela Politécnica Superior de Córdoba
  Universidad de Córdoba
 
  Curso académico: 2019 - 2020

  Fichero de ejemplo de un menú de opciones
#

@ Bienvenida

@ Se borra la pantalla
clear;

@ Coloca el cursor en el lugar 10 10
place(10,10);

writeString('Introduce tu nombre --> ');

readString(nombre);

clear;
place(10,10);

writeString(' Bienvenido/a << ');
writeString(nombre);
writeString(' >> al intérprete de pseudocódigo en inglés:\'pie.exe\'.');

place(40,10);
writeString('Pulsa una tecla for continuar');

readString(pausa);

repeat 

 @ Se muestran las opciones disponibles

 clear;

 place(10,10);
 writeString(' Factorial de un número --> 1 ');

 place(11,10);
 writeString(' Máximo común divisor ----> 2 ');

 place(12,10);
 writeString(' Finalizar ---------------> 0 ');

 place(15,10);
 writeString(' Elige una opcion ');

 read(opcion);

 clear;

 if (opcion = 0)      @ Fin del programa
    then  
        place(10,10);
        writeString(nombre);
        writeString(': gracias por usar el intérprete ipe.exe ');

 else
		@ Factorial de un número
		if (opcion = 1)
			then
				place(10,10);
				writeString(' Factorial de un numero  ');
				place(11,10);
				writeString(' Introduce un numero entero ');
				read(N);

				factorial := 1;

       	for i from 2 to N step 1 do
	      	factorial := factorial * i;
				endfor;

        @ Resultado
	      place(15,10);
				writeString(' El factorial de ');
				write(N);
				writeString(' es ');
				write(factorial);
    
	@ Máximo común divisor
	else 
		if (opcion = 2)
			then
				place(10,10);
				writeString(' Máximo común divisor de dos números ');

				place(11,10);
        writeString(' Algoritmo de Euclides ');

        place(12,10);
        writeString(' Escribe el primer número ');
        read(a);

        place(13,10);
        writeString(' Escribe el segundo número ');
        read(b);

        @ Se ordenan los números
				if (a < b)
					then 
						auxiliar := a;
						a := b;
						b := auxiliar;
				endif;

				@ Se guardan los valores originales
					A1 := a;
					B1 := b;

					@ Se aplica el método de Euclides	
					resto  := a modulo b;

				while (resto <> 0) do
						a :=  b;
						b := resto;
						resto := a modulo b;
				endwhile;
         
				@ Se muestra el resultado
				place(15,10);
				writeString(' Máximo común divisor de ');
				write(A1);
				writeString(' y ');
				write(B1);
				writeString(' es ---> ');
				write(b);

	@ Resto de opciones
	else  
		place(15,10);
		writeString(' Opcion incorrecta ');

	endif;  @ Fin de la opción 2

 endif;  @ Fin de la opción 1 

endif;    @ Fin de la opción 0  

 place(40,10); 
 writeString('\n Pulse una tecla for continuar --> ');
 readString(pausa);
 
until (opcion = 0);   @ Fin del bucle repeat           

@ Despedida final

clear;
place(10,10);
writeString('El programa ha concluido');
