clear all
syms x1 x2 x3
A=0; F=0; x=0; Y=0; S=0; F1=0; xk=0;
fprintf('----------------------------------\n');
fprintf('METODO DE BROYDEN PARA 3 VARIABLES\n');
fprintf('----------------------------------\n\n');
fprintf('Igualar a cero, cada una de las funciones\nEste programa admite las variables "x1", "x2" y "x3"\n\n');
f1=input('Introduzca la funcion f(x1)= ');
f2=input('Introduzca la funcion f(x2)= ');
f3=input('Introduzca la funcion f(x3)= ');
fprintf('\n\n\n');
%Primero se sacan las derivadas y asi se evaluan las constantes
f11=diff(f1,x1);
f12=diff(f1,x2);
f13=diff(f1,x3);
f21=diff(f2,x1);
f22=diff(f2,x2);
f23=diff(f2,x3);
f31=diff(f3,x1);
f32=diff(f3,x2);
f33=diff(f3,x3);
%Imprimiendo el vector F(x)
matrixF=[f1;f2;f3];
fprintf('Vector F(x) =\n');
disp(matrixF);
fprintf('\n');
%Imprimiendo la Matriz J(x)
Jfila1=[f11,f12,f13];
Jfila2=[f21,f22,f23];
Jfila3=[f31,f32,f33];
MatrixJ=[Jfila1;Jfila2;Jfila3];
fprintf('Matriz J(x) =\n');
disp(MatrixJ);
fprintf('\n');

fprintf('\n\nCapturando valores iniciales de las variables\n');
x1=input('Introduzca el valor de x1= ');
x2=input('Introduzca el valor de x2= ');
x3=input('Introduzca el valor de x3= ');
error=input('Introduzca la precision= ');
fprintf('\n\n');
A(1,1)=subs(f11,{'x1','x2','x3'},{x1,x2,x3});
A(1,2)=subs(f12,{'x1','x2','x3'},{x1,x2,x3});
A(1,3)=subs(f13,{'x1','x2','x3'},{x1,x2,x3});
A(2,1)=subs(f21,{'x1','x2','x3'},{x1,x2,x3});
A(2,2)=subs(f22,{'x1','x2','x3'},{x1,x2,x3});
A(2,3)=subs(f23,{'x1','x2','x3'},{x1,x2,x3});
A(3,1)=subs(f31,{'x1','x2','x3'},{x1,x2,x3});
A(3,2)=subs(f32,{'x1','x2','x3'},{x1,x2,x3});
A(3,3)=subs(f33,{'x1','x2','x3'},{x1,x2,x3});
F1(1,1)=subs(f1,{'x1','x2','x3'},{x1,x2,x3});
F1(2,1)=subs(f2,{'x1','x2','x3'},{x1,x2,x3});
F1(3,1)=subs(f3,{'x1','x2','x3'},{x1,x2,x3});
x=[x1 x2 x3]';
k=1;
fprintf('k=%d\nx(0)=\n',k)
for i=1:3
    fprintf('     %10.15f\n',x(i,1))
end
fprintf('\nF(x0)=\n')
for i=1:3
    fprintf('     %10.15f\n',F1(i,1))
end
fprintf('\nJ(x0)=\n')
for i=1:3
    for j=1:3
        fprintf('     %10.15f',A(i,j))
    end
    fprintf('\n')
end
A=inv(A)%aqui inversa de j
xk=x-A*F1;
fprintf('\nx(1)=x(0)-J^(-1)(x(0))F(x(0))\n')
for i=1:3
    fprintf('     %10.15f\n',xk(i,1))
end
tol=norm(xk-x,inf);
fprintf('Error=||x(1)-x(0)||=%e\n',tol)
while tol>error
    k=k+1;
    x1=xk(1,1);
    x2=xk(2,1);
    x3=xk(3,1);
    F(1,1)=subs(f1,{'x1','x2','x3'},{x1,x2,x3});
    F(2,1)=subs(f2,{'x1','x2','x3'},{x1,x2,x3});
    F(3,1)=subs(f3,{'x1','x2','x3'},{x1,x2,x3});
    Y=F-F1;
    F1=F;
    S=xk-x;
    ST=S';
    A=A+((S-A*Y)*ST*A)/(ST*A*Y);
    x=[x1 x2 x3]';
    fprintf('k=%d\nx(%d)=\n',k,k-1)
    for i=1:3
       fprintf('     %10.15f\n',x(i,1))
    end
    fprintf('\nF(x%d)=\n',k-1)
    for i=1:3
       fprintf('     %10.15f\n',F(i,1))
    end   
    fprintf('\nY%d=F(X%d)-F(X%d)=\n',k-1,k-1,k-2)
    for i=1:3
       fprintf('     %10.15f\n',Y(i,1))
    end
    fprintf('\nS%d=x(%d)-x(%d)=\n',k-1,k-1,k-2)
    for i=1:3
       fprintf('     %10.15f\n',S(i,1))
    end
    fprintf('\nA%d=A%d+((S%d-A%d*Y%d)ST%d*A%d)/(ST%d*A%d*Y%d)\n',k-1,k-2,k-1,k-2,k-1,k-1,k-2,k-1,k-2,k-1)
    for i=1:3
      for j=1:3
          fprintf('     %10.15f',A(i,j))
      end
      fprintf('\n')
    end
    xk=x-A*F;
    fprintf('\nx(%d)=x(%d)-A^(-1)(x(%d))F(x(%d))\n',k,k-1,k-1,k-1)
    for i=1:3
       fprintf('     %10.15f\n',xk(i,1))
    end
    tol=norm(xk-x,inf);
    fprintf('Error=||x(%d)-x(%d)||=%3.15e\n',k,k-1,tol)
end
fprintf('\nx1= %10.15f',xk(1,1))
fprintf('\nx2= %10.15f',xk(2,1))
fprintf('\nx3= %10.15f',xk(3,1))
fprintf('\n')