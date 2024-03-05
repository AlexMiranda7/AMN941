%La distancia recorrida por un paracaidista viene dada por la siguiente
%ecuaci�n:
%s(t)=((m*g)/k)*t-((m^2*g)/k^2)(1-exp((-k*t)/m))
%Donde m=70kg;k=12.5kg/seg;g=9.8m/seg;
%Determine el valor aproximado de la velocidad V(6.75). Empleando la
%f�rmula de tres puntos de tres t�rminos, considere h=1/100; Adem�s obtenga
%el valor exacto de la velocidad y determine el error. Emplee 15 decimales

disp('Ejemplo Formula de Tres Puntos de Tres T�rminos');
syms t;
m=70;k=12.5;g=9.8;
f=input('Digite la funci�n: ');
h=input('Digite el valor de h: ');
to=input('Digite el valor a aproximar: ');
f1=(1/(2*h))*(-3*subs(f,to)+4*subs(f,to+h)-subs(f,to+2*h));
fprintf('La velocidad aproximada es %3.15f\n',double(f1));
f2=subs(diff(f),to);
fprintf('La velocidad exacta es %3.15f\n',double(f2));
fprintf('Error = %e\n\n',double(abs(f2-f1)));