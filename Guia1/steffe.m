fprintf('----------------------Metodo de Steffensen---------------------\n')
syms x;
g=input('Ingrese la funcion g(x) = ');
x0=input('Ingrese el punto inicial= ');
tol=input('Ingrese el margen de error: 10^-');
tol=10^-tol;
%Inicializamos valores
x1=subs(g,x0);
x2=subs(g,x1);
x3=double(x0-((x1-x0)^2/(x2-2*x1+x0)));
e=double(abs(x3-x0));
n=1;
fprintf('n\t|Y0\t\t\t\t\t|X1\t\t\t\t\t|X2\t\t\t\t\t|X3\t\t\t\t\t|error');
fprintf('\n%d\t|%.15f\t|%.15f\t|%.15f\t|%.15f\t|%e',n,double(x0),double(x1),double(x2),double(x3),double(e));
while(e>tol && n<100)
    x0=x3;
    x1=subs(g,x0);
    x2=subs(g,x1);
    x3=double(x0-((x1-x0)^2/(x2-2*x1+x0)));
    e=double(abs(x3-x0));
    n=n+1;
    fprintf('\n%d\t|%.15f\t|%.15f\t|%.15f\t|%.15f\t|%e',n,double(x0),double(x1),double(x2),double(x3),double(e));
end
fprintf('\nEl valor de aproximacion de X es= %.15f\n',double(x3));