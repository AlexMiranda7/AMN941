%2. Elaborar un programa que lea una matriz de números (de cualquier dimensión) y 
% muestre los siguiente elementos:
%Suma de los elementos de cada una de sus filas 
% Suma de los elementos de cada una de sus columnas 
%Adicionalmente, si la matriz es cuadrada, deberá mostrarse la suma de 
%elementos de la diagonal principal.

M=input('Ingrese los valores de la matriz, de la forma [x y; a b]');
[r,c]=size(M);

for i=1:r
    for j=1:c
        sumafila=sumafila+M(i,j);
    end
    fprintf('Suma de los elementos de la fila %f \f', i, 'es: ',sumafila);
end