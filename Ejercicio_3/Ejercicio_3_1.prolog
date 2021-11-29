% Definir la relación 'min_lista(+L,?X)' que se verifique si X es el mínimo de la lista 
% de números L. Por ejemplo, min_lista([9 ,3 ,1 ,5] , X) debe dar X = 1.

% +, ? Notacion de decripcion de predicados
% lista con un elemento, el propio elemento es el min
% el min de la cabeza y el min de la cola
min_lista([A|B], X) :- min_lista(B, A, X).

min_lista([], X, X).
min_lista([A|B], Min1, X) :- Min2 is min(A, Min1), min_lista(B, Min2, X).