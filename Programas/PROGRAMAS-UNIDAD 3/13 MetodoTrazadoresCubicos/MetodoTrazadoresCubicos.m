%Interpolacion mediante Trazadores Cubicos
%este me da casi todo solo necesito el trazador para las ecuaciones
%El polinomio de trazadores cubicos tendra la siguiente forma:
%Sj(x)=Aj+bj(x-xj)+Cj(x-xj)^2+dj(x-xj)^3
%Aj=f(xj)
%    (Cj+1 - Cj)       (Aj+1 - Aj)    hj(2Cj + Cj+1)
%dj= -----------   bj= ----------- - ---------------
%        3hj                hj             3
%hj-1*Cj-1 + 2(hj-1 +hj)Cj + hjCj+1 = 3(Aj+1 - Aj)/hj - 3(Aj - Aj-1)/hj-1

%                                     Sistema de ecuaciones de C
%	h0*C0 + 2(h0+h1)*C1 + h1*C2 = 3(a2-a1)/h1 - 3(a1-a0)/h0
%	h1*C1 + 2(h1+h2)*C2 + h2*C3 = 3(a3-a2)/h2 - 3(a2-a1)/h1
%	h2*C2 + 2(h2+h3)*C3 + h3*C4 = 3(a4-a3)/h3 - 3(a3-a2)/h2
%	h3*C3 + 2(h3+h4)*C4 + h4*C5 = 3(a5-a4)/h4 - 3(a4-a3)/h3
%	h4*C4 + 2(h4+h5)*C5 + h5*C6 = 3(a6-a5)/h5 - 3(a5-a4)/h4
%	C0 = 0
%	Cn = 0

clc
clear all
syms x
fprintf('                            ----------------------------------\n')
fprintf('                                    TRAZADORES CUBICOS\n')
fprintf('                            ----------------------------------\n')
fprintf('\n');
res=input('La ecuacion le fue dada (si=1/no=0) :');
 if res==1
   r=input('- Introduzca la Funcion F(x)             : ');
end
X=input('- Introduzca los valores de x [x0,x1,x2...,xn]       : ');
n=length(X);

if res==1
    for i=0:n-1
    Y(i+1)=subs(r,X(i+1));
    end
else
Y=input('- Introduzca los valores de y       : ');
end
z=input('- Introduzca el valor a aproximar   : ');

for i=0:n-1
   A(i+1)=Y(i+1);
   
end

for i=0:n-2
   H(i+1)=X(i+2)-X(i+1);
end
fprintf('\n');
fprintf('\n');

%valores de a(n)
fprintf (' Valores de f(x): \n');
for i=0:n-2
   fprintf (' a(%1.0f) = %10.15f',i,A(i+1));
   fprintf ('\n');
end
fprintf('\n');

%valores de h(n)
fprintf (' Espaciado de cada uno de los nodos: \n');
for i=0:n-2
   fprintf (' h(%1.0f) = %10.15f',i,H(i+1));
   
   fprintf ('\n');
end

fprintf('\n');

fprintf(' El valor de n es: %1.0f\n',n-1);

fprintf('\n');


for i=1:n-2
   b(i)=2*(H(i)+H(i+1));
   end
   
   for i=1:n-2
      d(i)=3*(A(i+2)-A(i+1))/H(i+1)-3*(A(i+1)-A(i))/H(i);
   end
   
   
   fprintf ('Las ecuaciones son: \n');
   for i=1:n-2
      fprintf('%10.15f *C(%1.0f) +(%10.15f)*C(%1.0f) + (%10.15f)*C(%1.0f) = %10.15f\n',H(i),i-1,b(i),i,H(i+1),i+1,d(i));
   end
   
   D=zeros(n,n);
   B=zeros(1,n);
   
   for i=2:n-1
      B(i)=b(i-1);
   end
   D=diag(B);
   
   V=zeros(1,n-1);
   for i=1:n-2
      V(i)=H(i);
   end
   for i=1:n-1
      D(i+1,i)=V(i);
   end
   S=zeros(1,n-1);
   for i=2:n-1
      S(i)=H(i);
   end
   for i=1:n-1
      D(i,i+1)=S(i);
   end
   D(1,1)=1;
   D(n,n)=1;
   
   T=zeros(1,n);
   for i=2:n-1
      T(i)=d(i-1);
   end
   
   R=T';
   C=D\R;
   
   fprintf('\n');
   
   fprintf('Los valores de las constantes de C son:\n');
   for i=1:n
   fprintf('C(%1.0f) = %10.15f\n',i-1,C(i));
   end
   fprintf('\n');
   cont=0;
   for i=1:n
   if z > X(i)
      cont=cont+1;
   end
   end
   
   o=(C(cont+1)-C(cont))/(3*H(cont));
   
   fprintf('El valor de la constante d(%1.0f) es : %10.15f\n',cont-1,o);
   fprintf('\n');
   
   f=(A(cont+1)-A(cont))/(H(cont))-((H(cont)*(2*C(cont)+C(cont+1)))/3);
   
   fprintf('El valor de la constante b(%1.0f) es : %10.15f\n',cont-1,f);
   fprintf('\n');

M=A(cont)+f*(z-X(cont))+C(cont)*(z-X(cont))^2+o*(z-X(cont))^3;

fprintf('El polinomio resultante es:%0.15f + (%10.15f)*(x- %0.15f)+ (%10.15f)*(x- %0.15f)^2 + (%10.15f)*(x- %0.15f)^3\n',A(cont),f,X(cont),C(cont),X(cont),o,X(cont));

fprintf('El resultado final es: %10.15f',M);
      
fprintf('\n');

