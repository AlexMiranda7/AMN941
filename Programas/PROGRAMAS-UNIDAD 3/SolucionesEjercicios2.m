%CAJA SIN TAPADERA
%Caja a partir de una hoja metalica rectangular que hay que cortar los
%lados de los cuadrados.
Funcion f(x): ((b-2*x)*(h-2*x)*x)-V

%VOLUMEN ABREVADERO
%Obtener volumen abrevadero de longitud L y seccion transversal
V=L[0.5pi*r^2-r^2asin(h/r)-h(r^2-h^2)^(1/2)
profundidad=r-h
 
%CAJA ABIERTA
f(b)=b^2+4(b*h)=Area
volumen caja = b^2*h
%simultaneo de ecuaciones para obtener una sola ecuacion
h=v/b^2
f(b)=b^2+(4v/b)-A?funcion deseada

%PAGINA RECTANGULAR E IMPRESIÓN DE MARGENES
A=xy
(x-(2b))(y-(2h))=Tamano
Despeje ecuacion x ,y
A=(Tamano/(y-2h))(y) ?terminos de y
A=(tamano/(x-2b))(x)?terminos de x

%LATA CILINDRICA CON TAPA
%Se pretende fabricar una lata de conserva cilíndrica (con tapa) 
%de 1 litro de capacidad. ¿Cuáles deben ser sus dimensiones para que se utilice el mínimo posible de metal? 
%(estas formulas se generan y luego se deriva una vez)
A=2*pi*r*h+2*pi*r^2 	V=pi*r^2*h		h=V/pi*r^2

%DESCOMPONER EL NÚMERO 44
%Descomponer el número 44 en dos sumandos tales que el quíntuplo 
%del cuadrado del primero más el séxtuplo del cuadrado del segundo 
%sea un mínimo.
S=5*x^2+6y^2	x+y=44   y=44-x   (sustituis y)

%TROZO DE ALAMBRE
Se tiene un alambre de 1 m de longitud y se desea dividirlo en dos 
trozos para formar con uno de ellos un círculo y con el otro un 
cuadrado. Determinar la longitud que se ha de dar a cada uno de los
trozos para que la suma de las áreas del círculo y del cuadrado sea
mínima.
S=pi*r^2+l^2	2pi*r+4l=1 metro ? despejar “l” y sustituir
Trozo caudrado = 1-trozos del circulo

%FORMULAS DE PROYECTIL
X= Vocos(teta)*t
Y= Vosen(teta)*t-(0.5*g*(t^2))  Cuando sale del origen y sumarle Yo cuando no parte del suelo

%ANGULO AGUDO DE UNA PELOTA LANZADA A UN CATCHER
Vo=20;
g=9.81;
x=40;
y=0.80;
t=2; %Por ecuación v=d/t
syms B
 solve(Vo*cos(B)*t-x)
ans =
0
solve((Vo*sin(B)*t)-(0.5*9.8*(t^2))+1.8-1.)
ans =
      asin(47/100)
 pi - asin(47/100)
double(ans)
ans =
    0.4893
    2.6523
introduzca la funcion f(x): (20*sin(x)*2)-(0.5*9.81*4)+(1.8-1)
Introduzca el valor inicial 1: 2.64
Introduzca el valor inicial 2: 2.66
Introduzca el valor del error: 1e-12
n 		 p0 				 p1 				 p2 				 error 
  1 	 2.640000000000000 	 2.660000000000000 	 2.651709386921040 	 8.290613e-03
  2 	 2.660000000000000 	 2.651709386921040 	 2.651735267937562 	 2.588102e-05
  3 	 2.651709386921040 	 2.651735267937562 	 2.651735324670100 	 5.673254e-08
  4 	 2.651735267937562 	 2.651735324670100 	 2.651735324669707 	 3.923157e-13

El valor aproximado de x es: 2.651735324669707