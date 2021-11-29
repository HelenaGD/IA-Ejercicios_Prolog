% Definir la relación 'entrelaza(?L1,?L2,?L)' que se verifique si la La L 
% está constituida por los elementos entrelazados de las listas L1 y L2, 
% que han de tener igual longitud. Por ejemplo, 
% entrelaza([1, 3, 5], [2, 4, 6], L) debe dar L = [1, 2, 3, 4, 5, 6]

entrelaza([],[],[]).
entrelaza([X],[],[X]). 
entrelaza([],[Y],[Y]).
entrelaza([X|L1],[Y|L2],[X,Y|L]) :- entrelaza(L1,L2,L).