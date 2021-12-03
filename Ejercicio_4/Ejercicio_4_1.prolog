% Definir la relación 'invertir(?L1,?L2)' que se verifique si la lista 
% L2 es equivalente a la L1 pero con los elementos en orden inverso.
% Utilizar la técnica del acumulador para ello. Por ejemplo, 
% invertir([9, 3, 1, 5] , L) debe dar L = [5, 1, 3, 9].

% Con esta sol ocurre esto
% Si se llama a invertir(L, [9, 3, 1, 5]) da error. Da una primera solucion pero luego se queda colgado
invertir([],[]). % El inverso de vacío es vacío
invertir([H|T], L) :- invertir(T,A), append(A,[H], L).
% Para la inversa de una cadena
% Se invierte la parte final (tail)
% Se concatena esa parte final con la cabeza (head)

reverse(Xs, Ys) :-
  reverse(Xs, [], Ys, Ys).
  
reverse([], Ys, Ys, []).

reverse([X|Xs], Rs, Ys, [_|Bound]) :-
  reverse(Xs, [X|Rs], Ys, Bound).