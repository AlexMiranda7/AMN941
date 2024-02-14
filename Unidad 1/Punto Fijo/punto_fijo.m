fprintf('------------METODO DEL PUNTO FIJO--------------\n');
syms x
g=input('Ingrese g(x): ');
x0=input('Ingrese x0: ');;
tol=input('Ingrese el margen de error: 10^-');
tol=10^-tol;
x1=subs(g,x0);
cont=1;
error=abs(x1-x0);
fprintf('n\t |x0\t\t\t\t |x1\t\t\t\t error');
fprintf('\n%d\t |%.15f\t |%.15f\t |%e',cont,double(x0),double(x1),double(error));
while (error>tol && cont<100)
    x0=x1;
    x1=double(subs(g,x0));
    cont=cont+1;
    error=double(abs(x1-x0));
    fprintf('\n%d\t %.15f\t | %.15f \t | %e',cont,double(x0),double(x1),double(error));
end
fprintf('\nEl valor aproximado de x es: %.15f\n', double(x1));