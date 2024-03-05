%Si se sabe que y(x)=exp(3/x)+8*x^3-e*cot(x), determine g''(-1.75)
%considere h=1/100; además obtenga el valor exacto y determine el error.
%Emplee quince decimales

disp('Ejemplo Segunda Derivada');
syms x
h=1/100;xo=-1.75;
f=input('Digitar la función: ');
f1=(1/h^2)*(subs(f,xo-h)-2*subs(f,xo)+subs(f,xo+h));
fprintf('El valor aproximado de G^2(-1.75) = %3.15f\n',double(f1));
f2=subs(diff(diff(f)),xo);
fprintf('El valor exacto de G^2(-1.75) = %3.15f\n',double(f2));
fprintf('Error = %e\n\n',double(abs(f2-f1)));