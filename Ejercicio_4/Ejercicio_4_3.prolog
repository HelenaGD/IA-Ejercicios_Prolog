% Implementar la búsqueda de solución para el juego Torres de Hanói 
% con tres postes y un número indefinido N de discos, de forma que 
% 'hanoi(+N,?L)' devuelva en L una lista de movimientos para resolver 
% el problema. 
% Ha de implementarse tres variantes: sin acumulador 'hanoi/2', 
% con acumulador 'hanoi_acc/2'y 
% con estructura en diferencia 'hanoi_dif/2'. Por ejemplo, 
% hanoi(3,L) debe dar L = [mover(1, 3), mover(1, 2), mover(3, 2), 
% mover(1, 3), mover(2, 1), mover(2, 3), mover(1, 3)].

hanoi(N,L) :- mover(N, 1, 2, 3, L).

mover(0, _, _, _,[]).
mover(N, P1, P2, P3, L) :-
  N > 0,
  M is N-1,
  mover(M, P1, P3, P2, L1),
  append(L1, [mover(P1, P3)], L2), % Se guarda el camino en L2
  mover(M, P2, P3, P1, L3),
  append(L2, L3, L). % Se vuelve a guardar en L


% Con acumulador
hanoi_acc(N,L) :- mover_acc(N, 1, 3, 2, L1, L). % El Acc=L comienza con una lista vacía 

mover_acc(0, P1, P2, _, L1, L1) :-
  append(L1, [mover(P1, P2)], L1).

mover_acc(N, P1, P2, P3, L1, L) :- 
  N > 0,
  M is N-1,
  mover_acc(M, P1, P3, P2, L1, L), % Se hace el movimiento
  mover_acc(0, P1, P2, _, L1, L),
  mover_acc(M, P3, P2, P1, L1, L).

move(1, X, Y, _, L) :-
  append(L1, [mover(X, Y)], L2),
  append(L2, L3, L),
  write('  Move top disk from '), write(X), write(' to '), write(Y), nl.

move(N, X, Y, Z, L) :-
  N>1,
  M is N-1,
  write('Level: '), write(N), nl,
  move(M,X,Z,Y, L),
  move(1,X,Y,_, L),
  move(M,Z,Y,X, L).