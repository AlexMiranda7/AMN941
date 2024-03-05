%MÉTODO DE RUNGE-KUTTA-FEHLBERG ORDEN 4

% - Introduzca la ecuación diferencial        : 'Dy=y-(x^2)+1'
% - Introduzca la condición y(a)=b            : 'y(0)=0.5'
% - Introduzca la función de trabajo          : y-(x^2)+1
% - Introduzca la condición inicial           : 0.5
% - Introduzca el valor de a                  : 0
% - Introduzca el valor de b                  : 1
% - Introduzca el tamaño de paso h            : 0.1

fprintf('\n');
clear all
clc
fprintf('                         -----------------------------------------\n')
fprintf('                         MÉTODO DE RUNGE-KUTTA-FEHLBERG DE ORDEN 4\n')
fprintf('                         -----------------------------------------\n')
fprintf('\n');
syms x y
d=input(' - Introduzca la ecuación diferencial        : ');
n=input(' - Introduzca la condición y(a)=b            : ');
f1=input(' - Introduzca la función de trabajo          : ');
ya=input(' - Introduzca la condición inicial           : ');
a=input(' - Introduzca el valor de a                  : ');
b=input(' - Introduzca el valor de b                  : ');
h=input(' - Introduzca el tamaño de paso h            : ');

fprintf('\n\n');

fprintf(' - La solución de la ecuación diferencial es : \n\n\n');

m = dsolve(d,n,'x');
pretty(m);

fprintf('\n\n\n');

f=f1;
w(1)=ya;
i=0;
t(1)=a;
q(1)=a;
v(1)=a;
d=0;
c=0;
g=0;
e=1;

fprintf('- w0 = %1.9f ',ya);
fprintf('\n\n');

for j=a:h:(b-h)
   i=1+i;
   t(i)=j;
   fprintf('---------------');		
   fprintf('\n');
   fprintf('- Iteración: %1.0f\n',e);
   fprintf('---------------');
   fprintf('\n\n');
   k1=h*subs(f,{x,y},{t(i),w(i)});
   fprintf('- K1 = h * f(t%1.0f,w%1.0f)',i-1,i-1);
   fprintf('\n');
   fprintf('- K1 = %1.9f * f(%1.9f,w%1.0f)',h,t(i),i-1);
   fprintf('\n');
   fprintf('- K1 = %2.15f',(k1))
   fprintf('\n\n');
   k2=h*subs(f,{x,y},{t(i)+h/4,w(i)+k1/4});
   fprintf('- K2 = h * f(t%1.0f + h/4 , w%1.0f + K1/4)',i-1,i-1);
   fprintf('\n');
   fprintf('- K2 = %1.9f * f(%1.9f + %1.9f , w%1.0f + %1.9f)',h,t(i),h/4,i-1,(k1)/4);
   fprintf('\n');
   fprintf('- K2 = %2.15f',(k2))
   fprintf('\n\n');
   k3=h*subs(f,{x,y},{t(i)+(3.*h/8),w(i)+(3.*k1/32)+(9.*k2/32)});
   fprintf('- K3 = h * f(t%1.0f + (3/8)h , w%1.0f + 3K1/32 + 9K2/32)',i-1,i-1);
   fprintf('\n');
   fprintf('- K3 = %1.9f * f(%1.9f + %1.9f , w%1.0f + %1.9f + %1.9f)',h,t(i),((3/8)*h),i-1,(3*(k1)/32),(9*(k2)/32));
   fprintf('\n');
   fprintf('- K3 = %2.15f',(k3))
   fprintf('\n\n');
   k4=h*subs(f,{x,y},{t(i)+(12.*h/13),w(i)+(1932.*k1/2197)-(7200.*k2/2197)+(7296.*k3/2197)});
   fprintf('- K4 = h * f(t%1.0f + (12/13)h , w%1.0f + 1932K1/2197 - 7200K2/2197 + 7296K3/2197)',i-1,i-1);
   fprintf('\n');
   fprintf('- K4 = %1.9f * f(%1.9f + %1.9f , w%1.0f + %1.9f - %1.9f + %1.9f)',h,t(i),((12/13)*h),i-1,(1932*(k1)/2197),(7200*(k2)/2197),(7296*(k3)/2197));
   fprintf('\n');
   fprintf('- K4 = %2.15f',(k4))
   fprintf('\n\n');
   k5=h*subs(f,{x,y},{t(i)+h,w(i)+(439.*k1/216)-(8.*k2)+(3680.*k3/513)-(845.*k4/4104)});
   fprintf('- K5 = h * f(t%1.0f + h , w%1.0f + 439K1/216 - 8K2 + 3680K3/513 - 845K4/4104)',i-1,i-1);
   fprintf('\n');
   fprintf('- K5 = %1.9f * f(%1.9f + %1.9f , w%1.0f + %1.9f - %1.9f + %1.9f - %1.9f)',h,t(i),h,i-1,(439*(k1)/216),(8*(k2)),(3680*(k3)/513),(845*(k3)/4104));
   fprintf('\n');
   fprintf('- K5 = %2.15f',(k5))
   fprintf('\n\n');
   w(1+i)=w(i)+(25*k1/216)+(1408*k3/2565)+(2197*k4/4104)-(k5/5);
   fprintf('- w%1.0f = w%1.0f + (25/216) K1 + (1408/2565) K3 + (2197/4104) K4 - (1/5) K5)',i,i-1)
   fprintf('\n');
   fprintf('- w%1.0f = w%1.0f + %1.9f + %1.9f + %1.9f - %1.9f',i,i-1,(25/216)*(k1),(1408/2565)*(k3),(2197/4104)*(k4),(1/5)*(k5))
   fprintf('\n');
   fprintf('- w%1.0f = %2.9f',i,(w(i+1)))
   fprintf('\n\n');
   e=e+1;
end

fprintf('\n\n');
%Este for obtiene y guarda todos los valores de t
%También se utiliza para evaluar la ecuación diferencial
for p=a:h:b
   d=1+d;
   q(d)=p;
   v(d)=subs(m,p);
end


%Este for se usa para contabilizar las iteraciones
for s=c:1:(d-1)
   g=1+g;
   k(g)=(g-1);
end
   
k3=k(end);

%Presentación de los datos 
fprintf('              i             ti                wi+1                y(t)');   
fprintf('\n\n');

for k1=0:k3
   k2=k1+1;
   fprintf('\n');
   fprintf('              %1.0f        %10.15f        %10.15f         %10.15f',k(k2),q(k2),w(k2),v(k2));
   fprintf('\n');                                      
end

fprintf('\n');    









   

   
