%Metodo Multipasos
%Metodo implicito de Adams-Moulton de 3 pasos
%wo=? w1=?1 w2=?2 
%wi+1=wi+h/24*[9*f(ti+1,wi+1)+19*f(ti,wi)-5*f(ti-1,wi-1)+f(ti-2,wi-2)]; i=0,1,...,N-1
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
f=input('Introduzca la funcion f(ti,wi)= ');

wi(1)=wo;
Y(1)=wo;
ti=a:h:b;
n=(b-a)/h;
Ecua_dif=dsolve(ED,cond,'t');
pretty(Ecua_dif)
j=1;
k=3;
while j<k
    wi(j+1)=subs(Ecua_dif,ti(j+1));
    Y(j+1)=subs(Ecua_dif,ti(j+1));
    j=j+1;
end
j=1;
k=3;
while j<k
    fprintf('\nw%d=y(t%d)=y(%4.3f)= %10.9f',j,j,ti(j+1),wi(j+1))
    j=j+1;
end
j=3;
%Escribir la formula para cada iteracion
while j<n+1
    f1=subs(f,{t,y},{ti(j+1),wi(j+1)});
    f2=subs(f,{t,y},{ti(j),wi(j)});
    f3=subs(f,{t,y},{ti(j-1),wi(j-1)});
    f4=subs(f,{t,y},{ti(j-2),wi(j-2)});
    wi(j+1)=wi(j)+h/24*(9*f1+19*f2-5*f3+f4);
    Y(j+1)=subs(Ecua_dif,ti(j+1));
    j=j+1;
end
fprintf('\n\nti         wi+1              y(t)=         Error\n');
j=4;
while j<n+2
    error=abs(wi(j)-Y(j));
    fprintf('t%d=%4.3f   w%d= %10.9f   %10.9f   %e\n',j-1,ti(j),j-1,wi(j),Y(j),error)
    j=j+1;
end