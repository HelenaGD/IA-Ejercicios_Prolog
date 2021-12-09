% Definir la relación 'invertir(?L1,?L2)' que se verifique si la lista 
% L2 es equivalente a la L1 pero con los elementos en orden inverso.
% Utilizar la técnica del acumulador para ello. Por ejemplo, 
% invertir([9, 3, 1, 5] , L). debe dar L = [5, 1, 3, 9].

% Con esta primera sol ocurre esto
% Si se llama a invertir(L, [9, 3, 1, 5]) da error. Da una primera solucion pero luego se queda colgado
% Esto es porque no hice uso del acumulador
% invertir([],[]). % El inverso de vacío es vacío
% invertir([H|T], L) :- invertir(T,A), append(A,[H], L).
% Para la inversa de una cadena
% Se invierte la parte final (tail)
% Se concatena esa parte final con la cabeza (head)

% Al añadirle el acumulador de esta forma, seguía obteniendo un error parecido  
% invertir(H, T) :- invertir(H, [], T).
% invertir([], A, A).
% invertir([Head|Tail], Acc, R) :- invertir(Tail, [Head|Acc], R).
% Al hacer invertir(L, [9, 3, 1, 5]) daba un primer resultado correcto, pero al pasar al siguiente, no paraba nunca. 

% La única forma de que funcionara fue la siguiente
invertir(H,T) :- invertir(H, [], T, T).
invertir([], A, A, []).
invertir([H|T], Acc, A, [_|Union]) :- invertir(T, [H|Acc], A, Union).