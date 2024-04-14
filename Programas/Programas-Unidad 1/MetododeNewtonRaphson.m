% MÉTODO DE NEWTON-RAPHSON
%clear all
%clc
format long
syms x
disp('Metodo de Newton Raphson')

%Sección de introducción de datos de trabajo
%Para la funcion de trabajo, esta debe estar en el formato f(x)=0
g = input('Introduzca la funcion a evaluar f(x): ');
po = input('Ingrese el valor inicial: ');
error = input('Ingrese el valor del error: ');

% Sección de evaluaciones del método (1/2)
G = diff(g);
f1 = subs(g,po);
f2 = subs(G,po);
P = po - f1/f2;
cont = 1;
tol = abs(P - po);

% Mostrar los valores solicitados en pantalla
fprintf('n \t\t P0  \t\t\t\t P1 \t\t\t\t error \n')
fprintf('%3.0f \t %2.15f \t %2.15f \t %e\n', double(cont), double(po),double(P),double(tol))

% Sección de corrida del metodo (2/2)
% Verificacion: Mientras no cumpla el criterio de paro, la funcion debe seguir mostrando resultados
while(tol > error)
	cont = cont + 1;
	po = P;
	f1 = subs(g,po);
	f2 = subs(G,po);
	P = po - f1/f2;
	tol = abs(P - po);
	
	fprintf('%3.0f \t %2.15f \t %2.15f \t %e\n', double(cont), double(po),double(P),double(tol))
end

% Mostrar respuesta aproximada en pantalla
fprintf('\n')
fprintf('El valor aproximado de x es: %2.15f\n', double(P))
fprintf('\n')