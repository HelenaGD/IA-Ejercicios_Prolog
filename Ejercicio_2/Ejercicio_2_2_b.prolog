% Realizar un predicado 'generado_int/3' que genere en sucesivas resatisfacciones los enteros, 
% primer argumento, que estén dentro de un intervalo determinado por el límite inferior, 
% entero del segundo argumento, y el límite superior, entero del tercer argumento. 
% Por ejemplo, generado_int(X, 2, 5) habría de devolver X=2; X=3; X=4; X=5.
generado_int(X,A,B) :- X is A, X=<B.
generado_int(X,A,B) :- Y is A+1, Y>=A, Y=<B, generado_int(X,Y,B).