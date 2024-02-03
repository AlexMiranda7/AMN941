%Perimetro de una elipse
a=input('Ingrese el valor de a, que representa la medida desde el vertice principal hasta el centro de la elipse: ');
b=input('Ingrese el valor de b, que representa la medida desde el vertice sencundario hasta el centro');

perimetro=pi*(3*(a+b)-sqrt(((3*a)+b)*(3*b)+a));
fprintf('El permitro de la elipse es: %d',perimetro);