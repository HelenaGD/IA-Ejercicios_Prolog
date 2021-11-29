% Definir la relación 'previo(?X,?Y,+L)' que se verifique si X
% está antes que Y en la lista L. Por ejemplo, 
% previo(b, e, [a, b, c, d, e, f]) debe dar true.

previo(H,B,[H|T]) :- member(B,T).
previo(A,B,[_|T]) :- previo(A,B,T).