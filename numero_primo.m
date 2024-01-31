%Elaborar un programa que lea un número natural n desde teclado y determine si  este es primo
n= input('Ingrese el valor de n: ');
div=0; %Contador de divisores
for i=1:n %Iterando de 1 a n
    if rem(n,1)==0 %Si el residuo de la division es 0
        div=div+1;
    end
end
if  div==2 %Si n tiene 2 divisores
    fprintf('El numero %d es primo \n', n);
else
    fprintf('El numero %d NO es primo \n',n);
end