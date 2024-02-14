%Desarrollar un programa que lea un numero natural y determine su factorial
n=input('Ingrese el valor de n: ');
prod=1; %Variable para acumular el producto
for i=1:n %Iterando de 1 a n
    prod=prod*i; %Acumulando los productos
end
fprintf('%d  != %d \n', n, prod);