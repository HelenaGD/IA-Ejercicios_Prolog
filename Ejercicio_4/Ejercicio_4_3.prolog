% Implementar la búsqueda de solución para el juego Torres de Hanói 
% con tres postes y un número indefinido N de discos, de forma que 
% 'hanoi(+N,?L)' devuelva en L una lista de movimientos para resolver 
% el problema. 
% Ha de implementarse tres variantes: sin acumulador 'hanoi/2', 
% con acumulador 'hanoi_acc/2'y 
% con estructura en diferencia 'hanoi_dif/2'. Por ejemplo, 
% hanoi(3,L) debe dar L = [mover(1, 3), mover(1, 2), mover(3, 2), 
% mover(1, 3), mover(2, 1), mover(2, 3), mover(1, 3)].

hanoi(N,L) :- mover(N, _, _, _, L).

mover(1, A, _, Z, [[A, Z]]).
mover(N, A, [H|T], Z, L) :-
    M1 is (N - floor(sqrt(2*N + 1)) + 1),
    M2 is (N - M1),
    mover(M1, A, [Z|T], H, L1),
    mover(M2, A, T    , Z, L2),
    mover(M1, H, [A|T], Z, L3),
    append(L1, L2, Q),
    append(Q, L3, P).

move(1, A, _, Z, [[A, Z]]).
move(N, A, [H|T], Z, P) :-
    M1 is (N - floor(sqrt(2*N + 1)) + 1),
    M2 is (N - M1),
    move(M1, A, [Z|T], H, P1),
    move(M2, A, T    , Z, P2),
    move(M1, H, [A|T], Z, P3),
    append(P1, P2, Q),
    append(Q, P3, P).