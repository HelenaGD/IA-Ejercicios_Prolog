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
mover(N,P1,P2,P3,L) :-
  N > 0,
  M is N-1,
  mover(M, P1, P3, P2, L1),
  append(L1, [mover(P1,P3)],L2),
  mover(M, P2, P3, P1,L3),
  append(L2, L3, L).

move(0, _, _, _, []).
move(N, P1, P2, P3, Moves) :-
    N > 0,
    N1 is N - 1,
    move(N1, P1, P3, P2, M1),
    append(M1, [mover(P1,P2)], M2),
    move(N1, P3, P2, P1, M3),
    append(M2, M3, Moves).

hanoi2(N, Moves) :-
    move(N, 1, 3, 2, Moves).