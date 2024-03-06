syms x
disp('INTERPOLACIÓN Y POLINOMIO DE LAGRANGE')
fprintf('-------------------------------------\n');
val=input('Valor a interpolar x: ');
dato=input('Datos [X0 X1 X2 ... Xn]: ');
t=length(dato);
fprintf('Valores de la función:\n\t1-Utilizar una función.\n\t2-Ingresar valores\n');
opc=input('Opción: ');
switch opc
    case 1
        f=input('Función f(x): ');
        fun=zeros(1,t);
        fprintf('Valores de F(x): ');
        for i=1:t
            fun(i)=subs(f,dato(i));
            fprintf('%f,', fun(i));
        end
    case 2
        fun=input('Valores F(x) [F(X0) F(X1) ... F(Xn)]: ');
end
fprintf('\nGrado del Polinomio: %2.0f\n',t-1);
fprintf('\nObteniendo las Funciones de Lagrange\n');
L=zeros(1,t);
for i=1:t
    num=1;
    fprintf('\t   ')
    for j=1:t        
        if j~=i
            fprintf('(x-%3.15f)',dato(j));
            num=num*(val-dato(j));
        end
    end
    fprintf('\nL%1.0f(x)=',i-1);
    for j=1:t
        fprintf('------------');
    end
    fprintf('\n\t   ');
    den=1;
    for j=1:t 
        if j~=i
            fprintf('(%3.15f-%3.15f)',dato(i),dato(j));
            den=den*(dato(i)-dato(j));
        end
    end
    L(i)=num/den;
    fprintf('\nL%1.0f(%3.15f)=%3.15f\n\n',i-1,val,L(i));
end
fprintf('Polinomio:\n');
fprintf('P%1.0f(x)=',t-1);
pol=0;
for i=1:t
    fprintf('L%1.0f(x)*F(X%1.0f)',i-1,i-1);
    pol=pol+(L(i)*fun(i));
    if i==t
        fprintf('\n');
    else
        fprintf(' + ');
    end
end
fprintf('P%1.0f(%3.15f)=',t-1,val);
for i=1:t
    fprintf('(%9.15f)*(%9.15f)',L(i),fun(i));
    if i==t
        fprintf('\n');
    else
        fprintf(' + ');
    end
end
fprintf('P%1.0f(%3.15f)= %9.15f\n\n',t-1,val,pol);
if opc==1
    y= subs(f,val);
    o= abs(pol-subs(f,val));
    fprintf('\nValor Exacto de la Función: %9.15f',double(y));
    fprintf('\nError: %e\n\n',double(o));
end