1%2. Elaborar un programa que lea una matriz de números (de cualquier dimensión) y 
% muestre los siguiente elementos:
%Suma de los elementos de cada una de sus filas 
% Suma de los elementos de cada una de sus columnas 
%Adicionalmente, si la matriz es cuadrada, deberá mostrarse la suma de 
%elementos de la diagonal principal.
sumafila=0;
sumacolumna=0;
M=input('Ingrese los valores de la matriz, de la forma [x y; a b]');
[r,c]=size(M);
fprintf('La matriz es de: %d x %f \n',r,c);
display(M);

%Suma de las filas
for i=1:r
    for j=1:c
        sumafila=sumafila+M(i,j);
    end
    fprintf('Suma de los elementos de la fila %d es: %f \n',i,sumafila);
    sumafila=0;
end

%Suma de las columnas
for i=1:c
    for j=1:r
        sumacolumna=sumacolumna+M(j,i);
    end
    fprintf('Suma de los elementos de la columna %d es: %f \n',i,sumacolumna);
    sumacolumna=0;
end

%Verificando si la matriz es cuadrada
if r==c
    fprintf('M es una matriz cuadrada \n');
    diagonal= diag(M);
    x=sum(diagonal);
    fprintf('Suma de la diaonal principal es: %d',x);
else
     fprintf('M NO es una matriz cuadrada');
end
