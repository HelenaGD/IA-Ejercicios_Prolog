% Realizar los predicados 'mcm/3' y 'mcd/3' que devuelva en 
% el primer argumento el mínimo común múltiplo y el máximo 
% común divisor respectivamente de los dos últimos argumentos. 
% Por ejemplo, mcm(X, 2, 5) habría de devolver X=10.

% X es el mínimo comun multiplo de Y y Z
mcm(X,Y,Z) :- mcd(A,Y,Z), X is (Y * Z) / A.

% X es el maximo comun divisor de Y y Z
% mcd(X,Y,Z) :- Y = Z, X = Y.
% mcd(X,Y,Z) :- Y > Z, A is Y - Z, mcd(X,A,Z).
% mcd(X,Y,Z) :- Y < Z, B is Z - Y, mcd(X,Y,B).

mcd(X,Y,Z) :- Y = Z, X = Y.
mcd(X,Y,Z) :- Y < Z, A is Z - Y, mcd(X,Y,A).
mcd(X,Y,Z) :- Y > Z, mcd(X,Z,Y).