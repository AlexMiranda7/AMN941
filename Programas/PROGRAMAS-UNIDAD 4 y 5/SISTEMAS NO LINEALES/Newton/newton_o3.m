clear all
clc;
syms x y z
disp('Newton Orden 3');
Gx(1) = input('Ingrese la función 1: ');
Gx(2) = input('Ingrese la función 2: ');
Gx(3) = input('Ingrese la función 3: ');
xo(1,:) = input('Ingrese los valores iniciales [x, y, z]: ');
t = input('Ingrese el valor de precisión: ');

%Jacobiano en funcion de variables
J(1,1) = diff(Gx(1),x);
J(2,1) = diff(Gx(2),x);
J(3,1) = diff(Gx(3),x);
J(1,2) = diff(Gx(1),y);
J(2,2) = diff(Gx(2),y);
J(3,2) = diff(Gx(3),y);
J(1,3) = diff(Gx(1),z);
J(2,3) = diff(Gx(2),z);
J(3,3) = diff(Gx(3),z);

fprintf('Jacobiano en función de variables\n');
J;

i=1;
n = 2;
fprintf('Iteracion 0\n');
F = double(subs(Gx,{x,y,z},{xo(1,1),xo(1,2),xo(1,3)}));
Fi = F';
Ji = double(subs(J,{x,y,z},{xo(1,1),xo(1,2),xo(1,3)}))
inv(Ji)
X = xo(1,:)' - inv(Ji)*Fi;
xo(2,:) = X';
error = norm(X - xo(1,:)',inf);
fprintf('');
while error > t 
    fprintf('Iteracion %1.0f\n', double(i));
    F = double(subs(Gx,{x,y,z},{xo(n,1),xo(n,2),xo(n,3)}));
    Fi = F';
    Ji = double(subs(J,{x,y,z},{xo(n,1),xo(n,2),xo(n,3)}))
    inv(Ji)
    X = xo(n,:)' - inv(Ji)*Fi;
    xo(n+1,:) = X';
    error = norm(X - xo(n,:)',xinf)
    n = n + 1;
    i = i + 1;
end