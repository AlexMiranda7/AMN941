%BIFURCACIÓN
%Programa para hacer que la variable j sea igual a -1 si a<b0 si a==b, y 1 si a>b
a=4;
b=3;
if a<b
    j=-1;
elseif a==b
    j=0;
elseif a>b
    j=1;
end

%CAÍDA LIBRE
%Un  objeto  que  cae  verticalmente  en  el  aire  está  sujeto  a  una 
%resistencia  viscosa  y  también  a  la  fuerza  de  gravedad.  Suponga  que 
%dejamos  caer  un  objeto  de  masa  m  desde  una  altura  So  y  que  la  altura 
%del objeto después de t segundos viene dada así

%funcion caida libre 
s(t)=s0-(m*g/k)*t + (m^2*g)/k^2*(1-exp((-k*t/m)))

k=coeficiente resistencia aire
m=masa
g=gravedad
s0=altura inicial
t=tiempo
funcion g= '(k/(m*g))*(s0+((m^2*g)/k^2)*(1-exp((-k*t)/m)))'

%CONCENTRACIÓN REACTOR QUÍMICA
%La concentración de un reactante en un reactor de mezcla completa viene 
%dada  por  la  siguiente  expresión:  C(t)  =  0.78  –  0.05te-0.4t –0.23e-0.4t, 
%donde  C(t)  es  la  concentración  del  reactante  (mol/L)  y  t  el  tiempo  (min). 
%Determine  en  cuánto  tiempo  la  concentración  del  reactante  es  igual  a 
%0.7365 mol/L.
%'ct-0.78+0.05*x*exp(-0.4*x)+0.23*exp(-0.4*x)';
%'(log(-ct+0.78-(0.05*x*exp(-0.4*x)))-log(0.23))/(-0.4)'=t <--funcion g funcion g pega pero muchas iteraciones'
%'(-ct+0.78-0.23*exp(-0.4*x))/(0.05*exp(-0.4*x))' =t <--nueva funcion g
%'(log(-ct+0.78-(0.23*exp(-0.4*x)))-log(0.05*x))/(-0.4)'; <<--funcio real g
%puntos de 3 a 4 valor inical 3.8 

%CILINDRO-CONO
%se desea construir un recipiente que tendr la forma de un cono en la parte
%inferior y en la parte superior un cilindro circular recto, el volumen del
%recipiente debe ser de 0.0147780518424864 m^3
%Emplee el metodo de NEWTON para determinar las dimensiones del cilindro a
%fin de que el area superficial del recipiente sea igual a
%0.3279671190895647m^2 la altura del cono debe de ser .38m con una
%precision de 1e-12
%Mostrar N P0 valores aproximados y error
clc
syms x
AST=0.3279671190895647;
VT=0.0147780518424864;
hc=0.38;
R=(((0.0147780518424864/((1/3)*(pi)*(0.38)+(pi)*x)))^(1/2));
solve('0.3279671190895647=pi*(((0.0147780518424864/((1/3)*(pi)*(0.38)+(pi)*x)))^(1/2))*((((0.0147780518424864/((1/3)*(pi)*(0.38)+(pi)*x)))^(1/2))^2+0.38)^(1/2)+2*pi*(((0.0147780518424864/((1/3)*(pi)*(0.38)+(pi)*x)))^(1/2))*x')

%CARGA DIAMETRO
%carga de diameto d , recibe calor por efecto joules
%rolando arriaza
%de una resistencia electrica simultaneamente disipa calor
%por conveccion y daciaccion , siendo la ecuacion 
%que satiface el equilibrio la siguiente
% pi*d*h*(t-ts)+pi*d*e*o*(t^4-ts^4)-i^2r=0
% 'pi*0.25*20*(x-299.15)+pi*0.25*0.8*5.67e-8*(x^4-(299.15)^4)-125'=0
%d=diametro
%e=resistencia esmisidad
%o=constante de stefan 
%h=coeficiente de transferencia
%utilizar 8 decimales
%presicion 1e-9
%ecuacion funcion g = '((-pi*d*e*o*(t^4-ts^4)+ir)/(pi*d*h))+ts'

%NÚMERO PRIMO O NO
n=input('Numero natural que deseas saber si es primo: ');
i=2;
primo=1;
while i<=sqrt(n)
    if rem(n,i)==0 % Residuo de dividir n entre i
        primo=0;
        break
    end
    i=i+1;
end
if primo
    disp('El número dado es primo')
else
    disp('El número dado no es primo')

%NÚMERO SUMAR DEL 1 AL 10
x=1; suma=0;
while x<=10;
    suma=suma+x;
    x=x+1;
end
disp(suma);

%ÁREA DE TRAPECIO
%Calcula el àrea de un trapecio dadas las dimensiones
%a, b y h , donde a y b son las longitudes de los
%lados paralelos y h es la distancia entre esos
%lados
area=0.5*(a+b)*h;

%VELOCIDAD PARACAÍDAS
%La  velocidad  de  caída  de  un  paracaidista  viene  dada  por  la  siguiente 
%expresión:
%V=(m*gt/c)*(1-exp((-c*t/m)))
%Si  la  velocidad  del  paracaidista  es  de  234  km/h,  cuando  t  es  igual  a 
%18.75  segundos.  Determine  la  masa  “m”  del  paracaidista  empleando  el 
%método de Iteración de Punto Fijo, con una precisión de 10-12.
%velocidad vieen dada a 239 km/h
% v= (239*1000)/3600 = 66.38889 m/s
%funcion g= (v*c)/(gt*(1-exp(-c*t/m)))
%M es: 102.855305648 R//   

%DESVIACIÓN TÍPICA Y MEDIA ARITMETICA
function [m , d ]=MediaTipica(obj)
    n=length(obj);
    m=sum(obj)/n;
    d=sqrt(sum((obj-m).^2)/n);
    pie(obj);
end

%LATA CILINDRICA
%Se debe fabricar una lata en forma cilíndrica circular recta que contenga 1000 cm3
%La tapacircular de la parte superior y del fondo deben tener un radio de 0.25 cm más que el radio 
%de la latapara que el sobrante se utilice para sellar con la pared lateral. 
%La hoja de material con que seconstruye la pared lateral también debe ser 0.25 cm más 
%grande que la circunferencia de la lata demodo que pueda hacerse un sello lateral

%Una grafica aproximada del problema planteadoes la adjunta.Sea h la altura del cilindro y sea
%r el radio delvolumen deseado y r+0.25
%el radio necesario parasellar la tapa.
%Se tiene que el área de material a usarse, y valor aminimizar está dada
%por: Atotal=2*Abase+Alateral

%Donde las áreas mencionadas de la base y lateral se pueden reemplazar en función de r, h.
%además usando el volumen del cilindro se puede dejar la función Área respecto a una sola variable.

V=pi*r^2*h
h=V/pi*r^2
a(r)=2*pi*(r+0.25)^2+((2000*(r+0.25))/(r^2))
%Para hallar el punto solicitado de área mínima se iguala a cero esta derivada, 
%luego con el método de bisección se halla la solución deseada, con tolerancia de 10-4
%limites de 5.1 a 5.6

%ESFERA DE MADERA
%Una esfera de madera de radio r, se sumerge en agua. Si la esfera está 
%construida de una especie de pino cuya densidad es:   = 785 Kg/m3 y su 
%diámetro  es  de  568  mm,  ¿cuánto  es  la  profundidad  h  a  la  que  está 
%sumergido  el  polo  sur  de  la  esfera?,  si  se  sabe  que  la  masa  de  agua 
%desplazada cuando se sumerge la esfera viene dada así:
desnsidad agua = 1000 kg/m^3
ma=pa*int(pi*(r^2-(x-r)^2) , x , 0 , h)
%donde  a  es  la  densidad  del  agua,  r  es  el radio de la esfera.
densidad pino = 785
diametro = 568 = radio= 568/2 = 284 mm
%milimetros a metros = 284 / 1000 = 0.284000 = r
volumen esfera = (4/3)*pi*r^3
%obteniendo la masa  densidad = masa / volumen 
%masa = densidad*volumen

%AVREBADERO CILINDRICO
%Acircular= r^2Por teta/ 2 donde teta debe estar en radianes.
%Area del triangulo (base por altura / 2) donde la altura en incognita y la
%base aplicar pitagoras para dejar en funcion del radio y altura, al final
%queda esta area h*sqrt(r^2-h^2)
%Area de la mita del circulo (pi*r/2)
