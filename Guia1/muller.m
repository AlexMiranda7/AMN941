disp('-----------------METODO DE MULLER-----------------');
syms x;
%Datos de entrada
f=input('Introduzca la funcion: ');
x0=input('Introduzca el valor de x0: ');
x1=input('Introduzca el valor de x1: ');
x2=input('Introduzca el valor de x2: ');
tol=input('Ingrese la precision deseada: 10^-');
tol=10^-tol;
%Calculos
f0=double(subs(f,x0)); 
f1=double(subs(f,x1)); 
f2=double(subs(f,x2));
cont=1;
a=((f0-f2)*(x1-x2)-(f1-f2)*(x0-x2))/((x0-x2)*(x1-x2)*(x0-x1));
b=((f1-f2)*(x0-x2)^2-(f0-f2)*(x1-x2)^2)/((x0-x2)*(x1-x2)*(x0-x1));
c=f2;
x3=x2-(2*c)/(b+sign(b)*sqrt(b^2-4*a*c));
error=abs(x3-x2);
fprintf('n || x0\t\t\t||  x1\t\t\t\t || x2\t\t\t\t    || x3\t\t\t\t   || a\t\t\t\t  || b\t\t\t\t  || c\t\t\t\t|| error\n');
fprintf('%d  ||  %.15f  ||  %.15f  ||  %.15f  || ||  %.15f ||  %.15f ||  %.15f ||  %.15f  %e\n',cont,double(x0),double(x1),double(x2),double(x3),double(a),double(b),double(c),double(error));
while error>tol
        cont=cont+1;
        x0=x1;
        x1=x2;
        x2=x3;
        f0=double(subs(f,x0)); 
        f1=double(subs(f,x1)); 
        f2=double(subs(f,x2));
        a=((f0-f2)*(x1-x2)-(f1-f2)*(x0-x2))/((x0-x2)*(x1-x2)*(x0-x1));
        b=((f1-f2)*(x0-x2)^2-(f0-f2)*(x1-x2)^2)/((x0-x2)*(x1-x2)*(x0-x1));
        c=f2;
        x3=x2-(2*c)/(b+sign(b)*sqrt(b^2-4*a*c));
        error=abs(x3-x2);
        fprintf('%d  ||  %.15f  ||  %.15f  ||  %.15f  || ||  %.15f ||  %.15f ||  %.15f ||  %.15f  %e\n',cont,double(x0),double(x1),double(x2),double(x3),double(a),double(b),double(c),double(error));
end  %Se cumplio criterio de paro
    fprintf('\nEl valor aproximado de x es: %.15f\n',double(x3));