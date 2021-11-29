% Definir la relación 'previo(?X,?Y,+L)' que se verifique si X
% está antes que Y en la lista L. Por ejemplo, 
% previo(b, e, [a, b, c, d, e, f]) debe dar true.

previo(A,Y,[A|B]) :- member(Y,B).
previo(X,Y,[_|B]) :- previo(X,Y,B).