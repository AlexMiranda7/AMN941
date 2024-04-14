syms x
format long
disp('-------------------METODO DE INTERPOLACION DE LAGRANGE --------------------')
X=input('Ingrese los valores de x: ');
Y=input('Ingrese los valores de y: ');
%f=input('Ingrese la funcion: ');
%El Vector Y se obtiene de evaluar f en el vector x
%Y=subs(y,x);
aprox=input('Ingrese el valor a aproximar: ');
n=length(X);
n=vpa(n);
for i=1:n
    numerador=1;
    numerador=vpa(numerador);
    denominador=1;
    denominador=vpa(denominador);
    for j=1:n
        if j~=i;
            numerador=numerador*(x-X(j));
            denominador=denominador*(X(i)-X(j));
        end
    end
    L(i)=numerador/denominador;
    L(i)=vpa(L(i));
    fprintf('L%d(x)= \n',i-1);
    pretty(L(i));
end
%Construyendo el polinomio
pol=0;
for i=1:n
    pol=pol+double(Y(i)*L(i));
end
%Polinomio de Lagrangggeg y valor aproximado
fprintf('Polinomio de Lagrange resultante: \n');
pretty(vpa(pol,9))
ValAprox=subs(pol,aprox);
exacto=subs(f,aprox);
error=abs(exacto-ValAprox);
fprintf('El valor aproximado de la funcion es: %.9f \n\n',double(ValAprox));
fprintf('El valor exacto de la funcion es: %.9f \n\n',double(exacto));
fprintf('Error: %e \n\n',double(error));