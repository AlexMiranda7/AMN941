%Ecuaciones diferenciales no lineales con punto fijo para variables x y x3
%Por defencto se usan las variables x y
%Quitar comentarios respectivos para usar x3

% Para este ejemplo se uso: 
% x=(12 - 4*y)/(1 - x)
% y=( sqrt(25 - (x-2)^2 ) + 3 )/2
% x^(0)= (-0.9,3.48)^T


%                   ---------------------------------------------------
%                    MÉTODO DE PUNTO FIJO PARA ECUACIONES NO LINEALES    
%                    ---------------------------------------------------
% 
% Ingresar (X1) g1(x,y): (12 - 4*y)/(1 - x)
% Ingresar (X2) g2(x,y): ( sqrt(25 - (x-2)^2 ) + 3 )/2
% Ingresar el valor x^0: -0.9
% Ingresar el valor y^0: 3.48
% Ingresar la tolerancia: 1e-2


clear all
clc
format_dec=15; %Setea la cantidad de decimales a emplear en las respuestas
fprintf('MÉTODO DE PUNTO FIJO PARA 2 ECUACIONES NO LINEALES\n')
fprintf('------------------------------------------------------\n')
fprintf('\n');
syms x;
syms y;
%syms x3;
fx = input('   Ingresar (X1) g1(x,y): ');
fy = input('   Ingresar (X2) g2(x,y): ');
%fx3 = input('Ingresar X3 despejada: ');
xk = input('   Ingresar el valor x^(0): ');
yk = input('   Ingresar el valor y^(0): ');
%x3k = input('Ingresar el valor x3: ');
tol = input('   Ingresar la tolerancia: ');



X1 = subs(fx, {x,y}, {xk, yk});
X2 = subs(fy, {x,y}, {xk, yk});
%X3 = subs(fx3, {x,y}, {xk, yk});

%X1 = subs(fx, {x,y,x3}, {xk, yk, x3k});
%X2 = subs(fy, {x,y,x3}, {xk, yk, x3k});
%X3 = subs(fx3, {x,y,x3}, {xk, yk, x3k});


i = 1;
fprintf('\n\n');
fprintf('k \t x^(k) \t\t\t\t y^(k) \t\t\t || X^k - X^(k-1)||');

fprintf('\n');
fprintf('%d \t %3.*f \t %3.*f \t -',i-1,format_dec,xk,format_dec,yk);
fprintf('\n');
i = i + 1;

rx = abs(xk - X1);
ry = abs(yk - X2);
%rx3 = abs(x3k - X3);
if rx > ry
   	%if rx > rx3
      	rest = rx;
   	else
      	rest = ry;
        %	end
    %else
   	%if ry > rx3
      	%rest = ry;
        %else
      	%rest = rx3;
        %end
	end


fprintf('%d \t %3.*f \t %3.*f \t %3.15e \n',double(i-1),double(format_dec),double(X1),double(format_dec),double(X2),double(rest));



%rest = 1;

while rest > tol
   xk = X1;
   yk = X2;
 %  x3k = X3;
   
   %X1 = subs(fx, {x,y,x3}, {xk, yk, x3k});
	%X2 = subs(fy, {x,y,x3}, {xk, yk, x3k});
	%X3 = subs(fx3, {x,y,x3}, {xk, yk, x3k});

   
    X1 = subs(fx, {x,y}, {xk, yk});
    X2 = subs(fy, {x,y}, {xk, yk});
  % X3 = subs(fx3, {x,y,x3}, {xk, yk, x3k});
   
   rx = abs(xk - X1);
   ry = abs(yk - X2);
   %rx3 = abs(x3k - X3);

%	if rx > ry
 %  	if rx > rx3
  %    	rest = rx;
  %	else
  %    	rest = rx3;
  %	end
  %else
  % 	if ry > rx3
   %   	rest = ry;
   %else
   %   	rest = rx3;
   %end
   %end
   if rx > ry
   	%if rx > rx3
      	rest = rx;
   	else
      	rest = ry;
        %	end
    %else
   	%if ry > rx3
      	%rest = ry;
        %else
      	%rest = rx3;
        %end
	end

   i = i + 1;
    fprintf('%d \t %3.*f \t %3.*f \t %3.15e \n',i-1,double(format_dec),double(X1),double(format_dec),double(X2),double(rest));
end

fprintf('\n\nX1: %3.*f\n',double(format_dec),double(X1));
fprintf('X2: %3.*f\n',double(format_dec),double(X2));
%fprintf('X3: %3.8f\n',double(X3));


