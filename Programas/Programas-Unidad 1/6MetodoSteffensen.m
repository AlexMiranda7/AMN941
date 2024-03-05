% MÉTODO DE STEFFENSEN
%clear all
%clc
%4/3(pi)radio al cubo formula volumen de esfera
format long
syms t
syms N
disp('Método de Steffensen')

A=563.429173528851720;
P=91.123889803846893;
% Seccion de introduccion de datos de trabajo
% Para la funcion de trabajo, esta debe estar en el formato f(x)=x
po = input('Introduzca el valor P0: ');
g = input('Introduzca la funcion g(x): ');
error = input('Introduzca el valor de precision: ');


% Sección de evaluaciones del metodo (1/2)
p1 = subs(g,po);
p2 = subs(g,p1);
P = po - ((p1 - po)^2)/(p2 - 2*p1 + po);
tol = abs(P - po);
cont = 1;

% Mostrar los valores solicitados en pantalla
fprintf('n \t\t P0 \t\t\t\t P1 \t\t\t\t P2 \t\t\t\t P  \t\t\t\t\t error \n')
fprintf('%3.0f \t %2.15f \t %2.15f \t %2.15f \t %2.15f \t %e\n',double(cont),double(po),double(p1),double(p2),double(P),double(tol));

% Seccion de corrida del metodo (2/2)
% Verificacion: Mientras no cumpla el criterio de paro, la funcion debe seguir mostrando resultados
while(tol > error)
	cont = cont + 1;
	po = P;
	p1 = subs(g,po);
	p2 = subs(g,p1);
	P = po - ((p1 - po)^2)/(p2 - 2*p1 + po);
	tol = abs(P - po);


	fprintf('%3.0f \t %2.15f \t %2.15f \t %2.15f \t %2.15f \t %e\n',double(cont),double(po),double(p1),double(p2),double(P),double(tol));
end

% Mostrar respuesta aproximada en pantalla
fprintf('\n')
fprintf('El valor aproximado de r es: %e \n', double(P))
fprintf('\n')