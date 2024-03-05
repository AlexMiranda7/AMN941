%MÉTODO DE LA POSICIÓN FALSA
%clear all
%clc
format long
syms h
disp('Método de la Posición Falsa')

%tangente inversa = atan
% Seccion de introduccion de datos de trabajo
% Debe cumpli cambio de signo
% Para la funcion de trabajo, esta debe estar en el formato f(x)=0
f = input('introduzca la funcion f(x): ');
p0 = input('Introduzca el valor inicial 1: ');
p1 = input('Introduzca el valor inicial 2: ');
error = input('Introduzca el valor del error: ');

if subs(f,p1)*subs(f,p0)>0
    disp('Debe cumplir el cambio de signo')
else
    px = p1-(subs(f,p1)*(p1-p0))/(subs(f,p1)-subs(f,p0));
    err = abs(px-p1);
    xp = 100 - ((pi/2)* px);
    cont = 1;
    disp(' n         yo                     y1                  y2                        error')
    fprintf('%2.0f  %9.15f     %9.15f   %9.15f       %e\n', double(cont),double(p0),double(p1),double(px),double(err))
    
    while err > error
        if subs(f,p1)*subs(f,px)<0
            p0 = p1;
            p1 = px;
        elseif subs(f,p0)*subs(f,px)<0
            p1 = px;
        end
        px = p1-(subs(f,p1)*(p1-p0))/(subs(f,p1)-subs(f,p0));
        err = abs(px-p1);
        xp= 100 - ((pi/2)* px);
        cont = cont+1;
         fprintf('%2.0f  %9.15f     %9.15f   %9.15f       %e\n', double(cont),double(p0),double(p1),double(px),double(err))
    end
    fprintf('\nEl valor aproximado de y: %9.15f\n',double(px))

end
