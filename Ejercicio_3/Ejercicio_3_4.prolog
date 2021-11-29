% Definir la relación 'subtramo(?L1,?L2)' que se verifique si la lista L1
% es un subtramo ordenado listas L2. Por ejemplo, 
% subtramo([3, 4, 5], [1, 2, 3, 4, 5, 6]) debe dar true.

subtramo([],_).
subtramo([L1|L2], [L1|L3]) :- subtramo(L2, L3).
subtramo([L1|L2], [_|L3]) :- subtramo([L1|L2], L3).