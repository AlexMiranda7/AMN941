fprintf('-------------METODO DE LA SECANTE----------------\n');
syms x
f=input('Ingrese f(x): ');
x0=input('Ingrese x0: ');
x1=input('Ingrese x1: ');
tol=input('Ingrese la precision 10^-');
tol=10^-tol;
%Necesitamos evaluar la funcion en 2 puntos diferentes
f0=subs(f,x0);
f1=subs(f,x1);
x2=x1-((f1*(x1-x0))/(f1-f0));
error=abs(x2-x1);
cont=1;
fprintf('\n\t|x0\t\t\t\t\t|x1\t\t\t\t\t|x2\t\t\t\t\t|error');
fprintf('\n%d\t|%.15f\t|%.15f\t|%.15f\t| %e',cont,double(x0),double(x1),double(x2),double(error));
while (error>tol && cont<100)
    x0=x1;
    x1=x2;
    cont=cont+1;
    f0=double(subs(f,x0));
    f1=double(subs(f,x1));
    x2=double(x1-((f1*(x1-x0))/(f1-f0)));
    error=abs(x2-x1);
    fprintf('\n%d\t|%.15f\t|%.15f\t|%.15f\t| %e',cont,double(x0),double(x1),double(x2),double(error));
end
fprintf('\nEl valor aproximado de x es: %.15f\n',double(x2));