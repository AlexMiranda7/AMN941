% Metodo de Adams Bashforth de cinco pasos
% W(i+1) = Wi + (h/720) * [1901 * f(ti,wi) - 2774 * f(t(i-1),w(i-1)) + 2616 * f(t(i-2),w(i-2)) - 1274 * f(t(i-3),w(i-3)) + 251 * f(t(i-4),w(i-4))]
a = input('Ingrese el limite inferior a: ');
b = input('Ingrese el limite superior b: ');
cond_i = input('Ingrese el valor de la condicion inicial: ');
h = input('Ingrese el tamaño de paso h: ');
syms t y
F = input('Ingrese la función de trabajo: ');
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
% Encontrando los otros cuatro valores iniciales necesarios
for i=2:5
    mx(2,i) = subs(s,mx(1,i));
    mx(3,i) = mx(2,i);
end
% Encontrando los valores exactos y aproximados restantes
for i=6:n
    mx(2,i) = mx(2,i-1)+(h/720)*(1901*subs(F,[t,y],[mx(1,i-1),mx(2,i-1)])-2774*subs(F,[t,y],[mx(1,i-2),mx(2,i-2)])+2616*subs(F,[t,y],[mx(1,i-3),mx(2,i-3)])-1274*subs(F,[t,y],[mx(1,i-4),mx(2,i-4)])+251*subs(F,[t,y],[mx(1,i-5),mx(2,i-5)]));
    mx(3,i) = subs(s,mx(1,i));
end
% Imprimiendo datos
fprintf('\n       ti               Wi+1               y(t)\n');
for j=1:n
    fprintf('%9.15f %9.15f %9.15f\n\n',double(mx(1,j)),double(mx(2,j)),double(mx(3,j)));
end