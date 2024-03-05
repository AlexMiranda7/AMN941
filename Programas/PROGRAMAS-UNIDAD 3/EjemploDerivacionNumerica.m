%Ejemplo Derivación Numerica
%Dada la función f(x)=sen(3/x)*ln^5(2x+tan(x)), obtenga el valor aproximado
%y exacto de f'(5). Considere h=1/200. Emplee quince decimales.
disp('Ejemplo Derivación Númerica');
syms x
f=input('Ingrese la función: ');
h=input('Ingrese el valor de h: ');
xo=input('Ingrese el valor de aproximación: ');
F=((subs(f,xo+h))-subs(f,xo))/h;
fprintf('El valor de f^1(%1.0f) = %3.15f\n\n',xo,double(F));