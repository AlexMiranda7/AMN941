% Metodo de Adams Bashforth de cuatro pasos
% W(i+1) = Wi + (h/24) * [55 * f(ti,wi) - 59 * f(t(i-1),w(i-1)) + 37 * f(t(i-2),w(i-2)) - 9 * f(t(i-3),w(i-3))]
a = input('Ingrese el limite inferior a: ');
b = input('Ingrese el limite superior b: ');
cond_i = input('Ingrese el valor de la condicion inicial: ');
h = input('Ingrese el tama�o de paso h: ');
syms t y
F = input('Ingrese la funci�n de trabajo: ');
ed = input('Ingrese la ED entre comillas simples: ');
c = input('Ingrese la condicion inicial entre comillas (y(a)=x): ');
n = int32(((b-a)/h)+1);
mx = zeros(3,n);
mx(1,1) = a;
mx(1,n) = b;
m = dsolve(ed,c,'t');
pretty(m);
fprintf('\n');
% Estableciendo los ti a partir del limite inferior y el valor de h
for j=2:n-1
    mx(1,j) = mx(1,j-1) + h;
end
% Asignando el valor de la condicion inicial al primer valor aproximado y
% exacto
mx(2,1) = cond_i;
mx(3,1) = cond_i;
% Encontrando la solucion de la ED ordinaria con ayuda de la condicion inicial
s = dsolve(ed,c);
% Encontrando los otros tres valores iniciales necesarios
for i=2:4
    mx(2,i) = subs(s,mx(1,i));
    mx(3,i) = mx(2,i);
end
% Encontrando los valores exactos y aproximados restantes
for i=5:n
    mx(2,i) = mx(2,i-1)+(h/24)*(55*subs(F,[t,y],[mx(1,i-1),mx(2,i-1)])-59*subs(F,[t,y],[mx(1,i-2),mx(2,i-2)])+37*subs(F,[t,y],[mx(1,i-3),mx(2,i-3)])-9*subs(F,[t,y],[mx(1,i-4),mx(2,i-4)]));
    mx(3,i) = subs(s,mx(1,i));
end
% Imprimiendo datos
fprintf('\n       ti               Wi+1               y(t)\n');
for j=1:n
    fprintf('%9.15f %9.15f %9.15f\n\n',double(mx(1,j)),double(mx(2,j)),double(mx(3,j)));
end