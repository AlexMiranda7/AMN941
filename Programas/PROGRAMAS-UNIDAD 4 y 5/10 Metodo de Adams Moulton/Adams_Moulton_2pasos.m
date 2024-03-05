%Metodo Mutipasos
%Metodo implicito de Adams-Moulton de 2 pasos
%wo=? w1=?1 
%wi+1=wi+h/12*[5*f(ti+1,wi+1)+8*f(ti,wi)-5*f(ti-1,wi-1)]; i=0,1,...,N-1
clc
wi=0;
ti=0;
y=0;
syms t y
ED=input('Introduzca la E.D.= ');
cond=input('Introduzca la condicion inicial: ');
a=input('Introduzca el intervalo inicial a= ');
b=input('Introduzca el intervalo final b= ');
wo=input('Introduzca wo= ');
h=input('Introduzca el tamaño de paso h= ');
f=input('Introduzca la funcion f(xi,wi)= ');

wi(1)=wo;
Y(1)=wo;
ti=a:h:b;
n=(b-a)/h;
Ecua_dif=dsolve(ED,cond,'t');
pretty(Ecua_dif)
 
wi(2)=subs(Ecua_dif,ti(2));
Y(2)=subs(Ecua_dif,ti(2));
 
j=1;
k=3;
while j<k
    fprintf('\nw%d=y(t%d)=y(%4.3f)= %10.9f',j,j,ti(j),wi(j));
    j=j+1;
end
fprintf('\n');
j=3;
%Escribir la formula para cada iteracion
while j<n
    f1=subs(f,{t,y},{ti(j-2),wi(j-2)});
    f2=subs(f,{t,y},{ti(j-1),wi(j-1)});
    f3=subs(f,{t,y},{ti(j-2),wi(j-2)});
    wi(j)=wi(j-1)+h/12*(5*f1+8*f2-f3);
    Y(j)=subs(Ecua_dif,ti(j));
    j=j+1;
end
fprintf('\n\nti         wi+1              y(t)=         Error\n');
j=1;
while j<n
    error=abs(wi(j)-Y(j));
    fprintf('t%d=%4.3f   w%d= %10.9f   %10.9f   %e\n',j-1,ti(j),j-1,wi(j),Y(j),error)
   j=j+1; 
end