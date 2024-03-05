%clc
syms x
disp('Método de Müller')
x0=input('Valor de Xo= ');
x1=input('Valor de X1= ');
x2=input('Valor de X2= ');
f=input('Polinomio F(x): ');
error=input('Precisión: ');
f0=subs(f,x0);
f1=subs(f,x1);
c=subs(f,x2);
a= double(((x1-x2)*(f0-c)-(x0-x2)*(f1-c)) / ((x0-x2)*(x1-x2)*(x0-x1)));
b= double(((x0-x2)^2*(f1-c)-(x1-x2)^2*(f0-c)) / ((x0-x2)*(x1-x2)*(x0-x1)));
x3=double(x2-((2*c)/(b+sign(b)*sqrt(b^2-4*a*c))));
n=1;
paro=abs(x3-x2);
fprintf('TABLA DE ITERACIONES\n n=%2.0f Xo=%9.15f X1=%9.15f X2=%9.15f a=%9.15f b=%9.15f c=%9.15f X3=%9.15f paro=%e\n',double(n),double(x0),double(x1),double(x2),double(a),double(b),double(c),double(x3),double(paro));
while paro>error
    n=n+1;
    x0=x1;
    x1=x2;
    x2=x3;
    f0=subs(f,x0);
    f1=subs(f,x1);
    c=subs(f,x2);
    a= double(((x1-x2)*(f0-c)-(x0-x2)*(f1-c)) / ((x0-x2)*(x1-x2)*(x0-x1)));
    b= double(((x0-x2)^2*(f1-c)-(x1-x2)^2*(f0-c)) / ((x0-x2)*(x1-x2)*(x0-x1)));
    x3=double(x2-((2*c)/(b+sign(b)*sqrt(b^2-4*a*c))));
    paro=abs(x3-x2);
    fprintf(' n=%2.0f Xo=%9.15f X1=%9.15f X2=%9.15f a=%9.15f b=%9.15f c=%9.15f X3=%9.15f paro=%e\n',double(n),double(x0),double(x1),double(x2),double(a),double(b),double(c),double(x3),double(paro));
end
fprintf('\nEl valor aproximado de x es: %9.15f\n',double(x3))