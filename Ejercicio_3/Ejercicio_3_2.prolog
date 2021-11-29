% Definir la relación 'cuadrado(+L1,?L2)' donde L1 es una lista 
% constituida por números y que se verifique si L2 está constituida 
% por los números equivalentes de la lista L1 elevados al cuadrado. 
% Por ejemplo, cuadrado([1, 2, 3], L2) debe dar L2 = [1, 4, 9].

cuadrado([], []).
cuadrado([L1|Ls1],[L2|Ls2]) :- L2 is L1 * L1, cuadrado(Ls1, Ls2).
cuarado([L1|Ls1], [L1|Ls2]) :- cuadrado(Ls1, Ls2). 