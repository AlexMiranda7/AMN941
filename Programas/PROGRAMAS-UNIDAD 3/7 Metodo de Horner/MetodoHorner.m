clear all
clc
fprintf('M�todo de Horner')
fprintf('\n')

n=input('# de Coeficiente: ');

dvs=cell(3,n);

for i=1:n
    fprintf('Coeficiente # %d',i)
    dvs{1,i}=input(': ');
end

xo=input('Digite Xo: ');

presicion=input('Digite la presicion: ');
i=1;
%---------
while(1)

for j=1:n
    if j==1
        dvs{2,1}=0;
        dvs{3,1}=dvs{1,1};
    else
    dvs{2,j}=dvs{3,j-1}*xo;
    dvs{3,j}=dvs{1,j}+dvs{2,j};
    end

end

dvs
bo=dvs{end,end};
%--------------------------------------
dvs2=cell(3,n-1);

for k=1:n-1
dvs2{1,k}=dvs{3,k};
end

for s=1:n-1
    if s==1
        dvs2{2,1}=0;
        dvs2{3,1}=dvs2{1,1};
    else
    dvs2{2,s}=dvs2{3,s-1}*xo;
    dvs2{3,s}=dvs2{1,s}+dvs2{2,s};
    end

end

dvs2
qo=dvs2{end,end};
%--------------------------------------


fprintf('Valor de Bo: %6.9f\n',bo)              %Decimales
fprintf('Valor de Q(x) : %6.9f\n',qo)

xp=xo-(bo/qo);
error=abs(xp-xo);

fprintf('Valor de X%d: %6.9f, Error: %6.3E Valor X%d: %6.9f\n',i,xp,error,i-1,xo)
fprintf('----------------------------------------------------------------------------------\n')

    if error<presicion
        break
    else
        i=i+1;
        xo=xp;
    end


pause;


%-----
end