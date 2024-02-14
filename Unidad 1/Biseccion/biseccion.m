disp('--------METODO DE BISECCION-----------');
syms x
f=input('Introduzca la funcion: ');
a=input('Introduzca el valor de a: ');
b=input('Introduzca el valor de b: ');
tol=input('Ingrese el margen de error: 10^-');
tol=10^-tol;
fa=subs(f,a); %Evaluando la funcion en a
fb=subs(f,b); %Evaluando funcion en b
if fa*fb<0       %Si hay cambio de sino entre f(a) y f(b)
    c=(a+b)/2;%Calculando el punto medio entre a y b
    fc=subs(f,c);%Evaluando la funcion en c
    cont=1;
    error=abs(fc);
    fprintf('n || a\t\t\t\t\t    ||    b\t\t\t\t    || c\t\t\t\t    || error\n');
    fprintf('%d  ||  %.15f  ||  %.15f  ||  %.15f  ||  %e\n',cont,double(a),double(b),double(c),double(error));
    while error>tol
        cont=cont+1;
        if fa*fc<0 %Hay raiz entre a y c
            b=c;
            c=(a+b)/2;
            error=abs(c-b);
        else
            a=c;
            c=(a+b)/2;
            error=abs(c-a);
        end
        fa=subs(f,a);
        fb=subs(f,b);
        fc=subs(f,c);
        fprintf('%d  ||  %.15f  ||  %.15f  ||  %.15f  ||  %e\n',cont,double(a),double(b),double(c),double(error));
    end  %Se cumplio criterio de paro
    fprintf('\nEl valor aproximado de x es: %.15f\n',double(c));
end