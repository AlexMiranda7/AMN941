%Metodo de Runge-kutta
%ED de orden superior y sist. de ED

%Despejar y dejar en terminos de de DY and DX
%Introduzca la funcion fx= ((391/3*exp(t))-(13/6*exp(4*t))-32+37*y)/(-12)
%Introduzca la funcion fy= ((-36*exp(t))-(6*exp(4*t))+116+(37*t))/12
%Introduzca el intervalo inicial a= 0
%Introduzca el intervalo final b= 1/5
%Introduzca wo de x= 2
%Introduzca wo de y= 1/2
%Introduzca el tamaño de paso h= 1/10

%k1i=h*fi(tj,w1j,w2j)
%k2i=h*fi(tj+h/2,w1j+1/2*k11,w2j+1/2*k12)
%k3i=h*fi(tj+h/2,wij+1/2*k21,w2j+1/2*k22)
%k4i=h*fi(tj+h,w1j+k31,w2j+k32)
%wi,j+1=wij+1/6*(k1i+2k2i+2k3i+k4i); i=0,1,...,N-1
clear all

disp('MÉTODO DE RUNGE-KUTTA PARA SISTEMAS DE ECUACIONES DIFERENCIALES')
fprintf('--------------------------------------------------------------------------\n');
wi=0;
ti=0;
k=0;
syms t x y 
fx=input('Introduzca la funcion fx= ');
fy=input('Introduzca la funcion fy= ');
a=input('Introduzca el intervalo inicial a= ');
b=input('Introduzca el intervalo final b= ');
wo_x=input('Introduzca wo de x= ');
wo_y=input('Introduzca wo de y= ');
h=input('Introduzca el tamaño de paso h= ');

wi(1,1)=wo_x;
wi(2,1)=wo_y;
ti=a:h:b;
n=(b-a)/h;
j=1;
while j<n+1
    k(1,1)=h*subs(fx,{t,x,y},{ti(j),wi(1,j),wi(2,j)});
    k(1,2)=h*subs(fy,{t,x,y},{ti(j),wi(1,j),wi(2,j)});
    k(2,1)=h*subs(fx,{t,x,y},{ti(j)+(h/2),wi(1,j)+(1/2*k(1,1)),wi(2,j)+(1/2*k(1,2))});
    k(2,2)=h*subs(fy,{t,x,y},{ti(j)+(h/2),wi(1,j)+(1/2*k(1,1)),wi(2,j)+(1/2*k(1,2))});
    k(3,1)=h*subs(fx,{t,x,y},{ti(j)+(h/2),wi(1,j)+(1/2*k(2,1)),wi(2,j)+(1/2*k(2,2))});
    k(3,2)=h*subs(fy,{t,x,y},{ti(j)+(h/2),wi(1,j)+(1/2*k(2,1)),wi(2,j)+(1/2*k(2,2))});
    k(4,1)=h*subs(fx,{t,x,y},{ti(j)+h,wi(1,j)+k(3,1),wi(2,j)+k(3,2)});
    k(4,2)=h*subs(fy,{t,x,y},{ti(j)+h,wi(1,j)+k(3,1),wi(2,j)+k(3,2)});
    wi(1,j+1)=wi(1,j)+1/6*(k(1,1)+2*k(2,1)+2*k(3,1)+k(4,1));
    wi(2,j+1)=wi(2,j)+1/6*(k(1,2)+2*k(2,2)+2*k(3,2)+k(4,2));
    fprintf('\n\n\nPara t%d= %3.2f   j=%d',j,ti(j+1),j-1)
    for i=1:2
        fprintf('\n\nK1%d=hf%d(t%d,w1%d,w2%d)= %10.15f',i,i,j-1,j-1,j-1,k(1,i))
    end
    for i=1:2
        fprintf('\n\nK2%d=hf%d(t%d+h/2,w1%d+K11/2,w2%d+k12/2)= %10.15f',i,i,j-1,j-1,j-1,k(2,i))
    end
    for i=1:2
        fprintf('\n\nK3%d=hf%d(t%d+h/2,w1%d+K21/2,w2%d+k22/2)= %10.15f',i,i,j-1,j-1,j-1,k(3,i))
    end
    for i=1:2
        fprintf('\n\nK4%d=hf%d(t%d+h,w1%d+K31,w2%d+k32)= %10.15f',i,i,j-1,j-1,j-1,k(4,i))
    end
    for i=1:2
        fprintf('\n\nw%d%d=w%d%d+1/6(K1%d+2K2%d+2K3%d+K4%d)= %10.15f',i,j,i,j-1,i,i,i,i,wi(i,j+1))
    end
    j=j+1;
end


fprintf('\n')
