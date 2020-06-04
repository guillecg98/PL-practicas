writestring 
('Indica la cantidad de números de la serie de Fibonacci que quiere calcular');

read (cantidad);
previo := -1;
resultado := 1;

for i from 0 to cantidad-1 do 
	suma := resultado + previo;
	previo := resultado;
	resultado := suma;
	write (resultado);
endfor



