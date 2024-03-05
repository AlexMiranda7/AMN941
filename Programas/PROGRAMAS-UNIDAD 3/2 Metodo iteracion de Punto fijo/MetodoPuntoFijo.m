% MÉTODO DE PUNTO FIJO
%clear all
%clc
format long
syms x
disp('Método del Punto Fijo')

% Seccion de introduccion de datos de trabajo
% Para la funcion de trabajo, esta debe estar en el formato g(x)=x
g=input('Introduzca la funcion g(x): ');
po=input('Introduzca el punto inicial po: ');
error=input('Introduzca el valor de presicion: ');

% Seccion de evaluaciones del método (1/2)
p1 = subs(g,po);
cont = 1;
tol = abs(p1 - po);

% Mostrar los valores solicitados en pantalla
fprintf('n \t\t p0 \t\t p1 \t \t error \n')
fprintf('%3.0f \t %2.15f \t %2.15f \t %e \n',double(cont),double(po),double(p1),double(tol))

while(abs(p1 - po) > error)
    cont = cont + 1;
    po = p1;
    p1 = subs(g,po);
    tol = abs(p1 - po);
    fprintf('%3.0f \t %2.15f \t %2.15f \t %e \n',double(cont),double(po),double(p1),double(tol))
end

% Mostrar respuesta aproximada en pantalla
fprintf('\n')
fprintf('El valor aproximado de x es: %2.15f\n', double(p1))
fprintf('\n')