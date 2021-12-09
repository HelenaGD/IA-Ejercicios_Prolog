% Definir la relación 'suma(+L,?X)' y 'suma_acc(+L,?X)' 
% que se verifiquen si X es la suma de los elementos de la lista de números L. 
% Ha de implementarse el primero sin acumulador y el segundo con. Por ejemplo, 
% suma([9,3,1,5], X) debe dar X = 18.

suma([],0). % La suma de nada es cero
% La suma de la lista es el primer elemento más la suma de la cola
suma([H|T], Total) :- suma(T,NewTotal), Total is H+NewTotal.

% Con acumulador
suma_acc(L,Total) :- suma_acc(L,0,Total). % Se llama a la otra función inicializando el acumulador a cero
suma_acc([],X,X). % Una lista vacía no aporta nada que sumar. Por como está escrito, implica que Total is NewTotal. Es decir, se le asigna el valor del acumulador
suma_acc([H|T], Acc, Total) :- NewTotal is Acc+H, suma_acc(T, NewTotal,Total).
% El resultado será lo guardado en el acumulador más la cabeza.
% Se llama a la función pasándole lo ya sumado y el parámetro donde se guardará el total