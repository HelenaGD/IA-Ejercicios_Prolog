% Realizar un predicado 'pertenece/3' que detecte si un número real (primer argumento) 
% pertenece al intervalo en la recta real determinado por el límite inferior, segundo argumento, 
% y el límite superior, tercer argumento. Por ejemplo, pertenece(5.5, 1.3, 7.2) habría de devolver true.
pertenece(X,Y,Z) :- X>=Y, X=<Z.