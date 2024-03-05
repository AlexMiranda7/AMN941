%Ecuaciones diferenciales no lineales con punto fijo para variables x1 x2 x3
%Por defencto se usan las variables x1 x2
%Quitar comentarios respectivos para usar x3

% Para este ejemplo se uso: 
% x1=(12 - 4*x2)/(1 - x1)
% x2=( sqrt(25 - (x1-2)^2 ) + 3 )/2
% x^(0)= (-0.9,3.48)^T


%                   ---------------------------------------------------
%                    MÉTODO DE PUNTO FIJO PARA ECUACIONES NO LINEALES    
%                    ---------------------------------------------------
% 
% Ingresar (X1) g1(x1,x2): (12 - 4*x2)/(1 - x1)
% Ingresar (X2) g2(x1,x2): ( sqrt(25 - (x1-2)^2 ) + 3 )/2
% Ingresar el valor x1^0: -0.9
% Ingresar el valor x2^0: 3.48
% Ingresar la tolerancia: 1e-2


clear all
clc
format_dec=15; %Setea la cantidad de decimales a emplear en las respuestas
fprintf('MÉTODO DE PUNTO FIJO PARA 2 ECUACIONES NO LINEALES\n')
fprintf('------------------------------------------------------\n')
fprintf('\n');
syms x1;
syms x2;
%syms x3;
fx1 = input('   Ingresar (X1) g1(x1,x2): ');
fx2 = input('   Ingresar (X2) g2(x1,x2): ');
%fx3 = input('Ingresar X3 despejada: ');
x1k = input('   Ingresar el valor x1^(0): ');
x2k = input('   Ingresar el valor x2^(0): ');
%x3k = input('Ingresar el valor x3: ');
tol = input('   Ingresar la tolerancia: ');



X1 = subs(fx1, {x1,x2}, {x1k, x2k});
X2 = subs(fx2, {x1,x2}, {x1k, x2k});
%X3 = subs(fx3, {x1,x2}, {x1k, x2k});

%X1 = subs(fx1, {x1,x2,x3}, {x1k, x2k, x3k});
%X2 = subs(fx2, {x1,x2,x3}, {x1k, x2k, x3k});
%X3 = subs(fx3, {x1,x2,x3}, {x1k, x2k, x3k});


i = 1;
fprintf('\n\n');
fprintf('k \t x1^(k) \t\t\t\t x2^(k) \t\t\t || X^k - X^(k-1)||');

fprintf('\n');
fprintf('%d \t %3.*f \t %3.*f \t -',i-1,format_dec,x1k,format_dec,x2k);
fprintf('\n');
i = i + 1;

rx1 = abs(x1k - X1);
rx2 = abs(x2k - X2);
%rx3 = abs(x3k - X3);
if rx1 > rx2
   	%if rx1 > rx3
      	rest = rx1;
   	else
      	rest = rx2;
        %	end
    %else
   	%if rx2 > rx3
      	%rest = rx2;
        %else
      	%rest = rx3;
        %end
	end


fprintf('%d \t %3.*f \t %3.*f \t %3.15e \n',double(i-1),double(format_dec),double(X1),double(format_dec),double(X2),double(rest));



%rest = 1;

while rest > tol
   x1k = X1;
   x2k = X2;
 %  x3k = X3;
   
   %X1 = subs(fx1, {x1,x2,x3}, {x1k, x2k, x3k});
	%X2 = subs(fx2, {x1,x2,x3}, {x1k, x2k, x3k});
	%X3 = subs(fx3, {x1,x2,x3}, {x1k, x2k, x3k});

   
    X1 = subs(fx1, {x1,x2}, {x1k, x2k});
    X2 = subs(fx2, {x1,x2}, {x1k, x2k});
  % X3 = subs(fx3, {x1,x2,x3}, {x1k, x2k, x3k});
   
   rx1 = abs(x1k - X1);
   rx2 = abs(x2k - X2);
   %rx3 = abs(x3k - X3);

%	if rx1 > rx2
 %  	if rx1 > rx3
  %    	rest = rx1;
  %	else
  %    	rest = rx3;
  %	end
  %else
  % 	if rx2 > rx3
   %   	rest = rx2;
   %else
   %   	rest = rx3;
   %end
   %end
   if rx1 > rx2
   	%if rx1 > rx3
      	rest = rx1;
   	else
      	rest = rx2;
        %	end
    %else
   	%if rx2 > rx3
      	%rest = rx2;
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


