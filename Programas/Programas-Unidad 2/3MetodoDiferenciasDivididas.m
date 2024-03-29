%clear all
%clc
syms x
disp('M�TODO DE LAS DIFERENCIAS DIVIDIDAS')
fprintf('-------------------------------------\n');
val=input('Valor a interpolar x: ');
dato=input('Datos Ordenados[X0 X1 X2 ... Xn]: ');
t=length(dato);
fprintf('Valores de la funci�n:\n\t1-Utilizar una funci�n.\n\t2-Ingresar valores\n');
opc=input('Opci�n: ');
switch opc
    case 1
        f=input('Funci�n f(x): ');
        fun=zeros(1,t);
        fprintf('Valores de F(x): ');
        for i=1:t
            fun(i)=subs(f,dato(i));
            fprintf('%8.09f, ', fun(i));
        end
    case 2
        fun=input('Valores F(x) [F(X0) F(X1) ... F(Xn)]: ');
end
DD=zeros(t);
fprintf('\nObteniendo las diferencias divididas:');
DD(:,1)=fun';
%for i=1:t
%    DD(i,1)=fun(i);
%end
for j=2:t
    fprintf('\n - Columna %2.0f de diferencias divididas\n',j);
    for i=j:t
        DD(i,j)=(DD(i,j-1)-DD(i-1,j-1))/(dato(i)-dato(i-j+1));
        fprintf('(%8.15f-(%8.15f))/(%3.15f-(%3.315f)) = %8.15f\n',DD(i,j-1),DD(i-1,j-1),dato(i),dato(i-j+1),DD(i,j));
    end
end
DD %#ok<NOPTS>

%En los t�rminos de an no debe contener el termino (x-xn).
%Hay que ignorarlos en el polinomio mostrado
fprintf('\nPolinomio grado %1.0f\n',t-1);
pol=DD(1,1);
fprintf('P%1.0f(x)= A0 + ',t-1);
for i=2:t
    fprintf('A%1.0f',i-1);
    for j=1:i
        fprintf('(x-x%1.0f)',j-1);
    end
    if i==t
        fprintf('\n');
    else
        fprintf(' + ');
    end
end
fprintf('P%1.0f(x)= %8.15f + ',t-1,DD(1,1));
for i=2:t
    factor=DD(i,i);
    fprintf('(%8.15f)*',DD(i,i));
    for j=1:i-1
        fprintf('(x-(%3.15f))',dato(j));
        factor=factor*(val-dato(j));
    end
    pol=pol+factor;
    if i==t
        fprintf('\n');
    else
        fprintf(' + ');
    end
end
fprintf('P%1.0f(%3.3f)= %9.09f\n\n',t-1,val,pol);
if opc==1
    fprintf('Valor Exacto de la Funci�n: %9.15f',double(subs(f,val)));
    fprintf('\nError: %e\n\n',double(abs(pol-subs(f,val))));
end