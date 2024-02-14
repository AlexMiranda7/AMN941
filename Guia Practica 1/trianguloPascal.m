function pas = trianguloPascal(n) 

pas(1, 1) = 1;
pas(2, 1 : 2) = [1 1]; 

if n < 3
    return
end 

for r = 3 : n
    pas(r, 1) = 1;   

    for c = 2 : r-1
        pas(r, c) = pas(r-1, c-1) + pas(r-1, c);
    end   

    pas(r, r) = 1;
end
end
 %EJECUTAR EN VENTANA DE COMANDOS, EJEMPLO trianguloPascal(4)