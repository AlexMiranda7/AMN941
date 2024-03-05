fprintf('-----------------METODO DE LA POSICION FALSA-----------------\n');
syms x
f=input('Ingrese f(x):  ');
x0=input('Ingrese x0:  ');
x1=input('Ingrese x1:  ');
tol=input('Ingree el margen de error: 10^-');
tol=10^-tol;
%Incializamos los valores
fx0=subs(f,x0);
fx1=subs(f,x1);
if fx1*fx0<0
    %Misma formula que en el metodo de la secante
    x2=double(x1-((fx1*(x1-x0))/(fx1-fx0)));
    error=abs(x2-x1);
    cont=1;
    fprintf('\n\t|x0\t\t\t\t\t|x1\t\t\t\t\t|x2\t\t\t\t\t|error');
    fprintf('\n%d\t|%.15f\t|%.15f\t|%.15f\t| %e',cont,double(x0),double(x1),double(x2),double(error));
    while (error>tol)
        cont=cont+1;
        fx2=double(subs(f,x2));
        %Los valores iniciales debenn nde tenesr signos opuestos
        if fx0*fx2<0 %La raiz esta entre x0 y x2
            x1=x2;
        else %La raiz esta entre x2 y x1
            x0=x2;
        end
        fx0=double(subs(f,x0));
        fx1=double(subs(f,x1));
        x2_anterior=x2;
        %Misma formula que en el metodo de la secante
        x2=double(x1-((fx1*(x1-x0))/(fx1-fx0)));
        error=abs(x2-x2_anterior);
        fprintf('\n%d\t|%.15f\t|%.15f\t|%.15f\t| %e',cont,double(x0),double(x1),double(x2),double(error));
    end
end
fprintf('El valor aproximado de x es: %.15f\n',double(x2));