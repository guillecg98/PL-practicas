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

  Fichero de ejemplo de conversión de tipo
#

clear;

place(3,10);
writestring('Ejemplo de cambio del tipo de valo \n');

writestring('Introduce un número --> ');
read(dato);

writestring('El número introducido es -> ');
write(dato);

writestring('Introduce una cadena de caracteres --> ');
readstring(dato);

writestring('La cadena introducida es -> ');
writestring(dato);

place(20,10);
writestring(' Fin del ejemplo de cambio del tipo de valor \n');
