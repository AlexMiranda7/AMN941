%Ejemplo: La velocidad vertical de un cohete se calcula mediante la
%siguiente formula:
% v = uln(mo/(mo-qt))-gt
%g=9.81m/seg^2;q=2850kg/seg;u=8820km/h;mo=295000kg
%Determine el valor aproximado de la aceleración del cohete cuando el
%tiempo sea igual a 5.65 seg, empleando la formula centrada de tres puntos,
%considere h = 1/500; además obtenga el valor exacto de la aceleración del
%cohete y determine el errot. Emplee quince decimales

disp('Ejemplo Formula Centrada de Tres Puntos');
syms t
g=9.81;q=2850;u=8820*(1000/1)*(1/3600);mo=295000;
f=input('Digite la función: ');
to=input('Digite el valor a aproximar: ');
h=input('Digite el valor de h: ');
f1=(1/(2*h))*(subs(f,to+h)-subs(f,to-h));
fprintf('El valor de la acelaración aproximado es: %3.15f\n ',double(f1));
f2=subs(diff(f),to);
fprintf('El valor de la acelaración exacto es: %3.15f\n ',double(f2));
fprintf('Error: %e\n\n ',double(abs(f1-f2)));