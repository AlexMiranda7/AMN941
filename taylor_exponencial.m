%Crear una función que permita obtener la suma de los primeros n términos de la 
%serie de Taylor para aproximar el exponencial de un número real x dado el valor de 
%n y el valor de x. 

% Parametro de salida: s (suma de terminos) 
% Parametros de entrada: n (cantidad de terminos) y x 
% Nombre de la función: taylor_exponencial 
function s = taylor_exponencial( n, x ) 
s=1; 
for i=1:n % Iterando de 1 a n 
s=s+(x^i)/factorial(i); % Acumulando la suma 
end 
end 
