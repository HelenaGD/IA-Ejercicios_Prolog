femenino(petra).
femenino(carmen).
femenino(maria).
femenino(rosa).
femenino(ana).
femenino(cande).
masculino(angel).
masculino(pepe).
masculino(juan).
masculino(pedro).
masculino(enrique).
masculino(raul).
masculino(alfonso).
% 1 es progenitor de 2
progenitor(petra, juan).
progenitor(petra, rosa).
progenitor(carmen, pedro).
progenitor(maria, ana).
progenitor(maria, enrique).
progenitor(rosa, raul).
progenitor(rosa, alfonso).
progenitor(rosa, cande).
progenitor(angel, juan).
progenitor(angel, rosa).
progenitor(pepe, pedro).
progenitor(juan, ana).
progenitor(juan, enrique).
progenitor(pedro, raul).
progenitor(pedro, alfonso).
progenitor(pedro, cande).

% Pregunta 1
% X es hijo de Y
hijo(X,Y) :- progenitor(Y,X), masculino(X).
% X es hija de Y
hija(X,Y) :- progenitor(Y,X), femenino(X).

% X es nieto de Y
%nieto(X,Y) :- progenitor(V,X), progenitor(Y,V), masculino(X).
nieto(X,Y) :- nieto_a(X,Y), masculino(X).
% X es nieta de Y
%nieta(X,Y) :- progenitor(V,X), progenitor(Y,V), femenino(X).
nieta(X,Y) :- nieto_a(X,Y), femenino(X).

nieto_a(X, Y) :- progenitor(V, X), progenitor(Y, V).

% Pregunta 2
% X es padre de Y
padre(X,Y) :- progenitor(X,Y), masculino(X).
madre(X,Y) :- progenitor(X,Y), femenino(X).

% X es hermano de Y
hermano(X,Y) :- padre(V,X), padre(V,Y), madre(W,X), madre(W,Y), (X \= Y), masculino(X).
% hermano(X,Y) :- progenitor(V,X), progenitor(V,Y), (X \= Y), masculino(X).
% Cuando se hace la consulta hermano(juan,X). dice que es hermano de sĂ­ mismo.
% Una vez arreglado con (X\=Y), sale dos veces que X = rosa. Esto se debe a que hace la comprobación
% para ambos progenitores. Para ello, hice distinción entre
%  "padre" y "madre"
% X es hermana de Y
hermana(X,Y) :- padre(V,X), padre(V,Y), madre(W,X), madre(W,Y), (X \= Y), femenino(X).
hermano_a(X,Y) :- padre(V,X), padre(V,Y), madre(W,X), madre(W,Y), (X \= Y).

% X es sobrino de Y
% sobrino(X,juan).
% Al salir de ser hermano de sĂ­ mismo, aquĂ­ salĂ­a que era sobrino de sus padres.
% Antes de añadir distincion de "progenitor" por "padre y madre", aquí salían las coincidencias dos veces. Ya no ocurre
sobrino(X,Y) :- progenitor(V,X), hermano_a(V,Y), masculino(X).
sobrina(X,Y) :- progenitor(V,X), hermano_a(V,Y), femenino(X).

% X es primo de Y
primo(X,Y) :- progenitor(V,X), progenitor(W,Y), hermano_a(V,W), masculino(X).
prima(X,Y) :- progenitor(V,X), progenitor(W,Y), hermano_a(V,W), femenino(X).