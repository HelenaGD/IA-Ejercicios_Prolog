% Definir la relación 'aplana(+L1,?L2)' que se verifique si L2 es la lista 
% equivalente a L1 donde se han eliminado todos su anidamientos. Por ejemplo, 
% aplana([a, b, [c, [d], [], e], f], L) debe dar L = [a, b, c, d, e, f].

aplana([], []) :- !.
aplana([L|Ls], X) :- !, aplana(L, A), aplana(Ls, As), append(A, As, X).
aplana(L, [L]).