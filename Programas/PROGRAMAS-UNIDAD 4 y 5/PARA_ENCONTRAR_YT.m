%Calculo de los valores de y(t) cuando son soluciones implicitas 
format long
syms t y
a=input('Ingrese el valor del extremo izquiero del intervalo: ');
b=input('Ingrese el valor del extremo drecho del intervalo:');
h=input('Ingrese el valor del paso h: ');
f=input('Ingrese la solucion de la ED de la forma f(t,y)=0(No olvide la constante C): ');
T=(a:h:b)';
wm=subs(f,t,T);
fprintf('\n y(t)')
for i=1:length(T)
     fprintf('\n ')
    val(i)=double(solve(wm(i),y));
     fprintf('%9.15f\n ',double(val(i)))
end


