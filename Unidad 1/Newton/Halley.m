disp('------------METODO DE HALLEY----------');
syms x;
f=input('Ingrese la funcion;  ');
x0=input('Ingrese el punto inicial: ');
tol=input('Ingrese el marge de error 10^-');
tol=10^-tol;
%Iniciamos el calculo, primero derivamos la funcion dada.
df=diff(f);
df2=diff(df);
%Evaluamos la funcion inicial y su derivada en el punto inicial.
fa=double(subs(f,x0));
fb=double(subs(df,x0));
fc=double(subs(df2,x0));
%Formula para el valor aproximado
x1=x0-((2*fa*fb)/(2*(fb)^2-fa*fc));
error=abs(x1-x0);
cont=1;
fprintf('n ||x0\t\t\t\t\t|| x1\t\t\t\t ||  Error\n');
fprintf('%d || %.15f   ||  %.15f  ||  %e\n', cont,double(x0),double(x1),double(error));
while (error>tol && cont<100)
    cont=cont+1;
    %Reasignamos valores
    x0=x1;
    fa=double(subs(f,x0));
    fb=double(subs(df,x0));
    fc=double(subs(df2,x0));
    x1=x0-((2*fa*fb)/(2*(fb)^2-fa*fc));
    error=abs(x1-x0);
    fprintf('%d || %.15f  ||  %.15f  ||  %e\n',cont,double(x0),double(x1),double(error));
end
fprintf('El valor aproximado de X es: %.15f\n', double(x1));