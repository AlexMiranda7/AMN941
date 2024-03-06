syms x
format long
disp('-------------------METODO DE INTERPOLACION DE LAGRANGE --------------------')
X=input('Ingrese los valores de x: ');
Y=input('Ingrese los valores de y: ');
aprox=input('Ingrese el valor a aproximar: ');
n=length(X);
L=zeros(1,n);
for i=1:n
    numerador=1;
    denominador=1;
    for j=1:n
        if j~=i;
            numerador=numerador*(x-X(j));
            denominador=denominador*(X(i)-X(j));
        end
    end
    L(i)=numerador/denominador;
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
pretty(vpa(pol,1))
ValAprox=subs(pol,aprox);
fprintf('El valor aproximado de la funcion es: %.15f \n\n',double(ValAprox));