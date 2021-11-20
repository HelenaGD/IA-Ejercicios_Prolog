% Realizar un programa prolog para el cálculo del día de 
% la semana para fechas modernas mediante el método de Lewis Carroll.
% Ha de generarse un predicado 'dia_semana/4' cuyos tres primeros 
% argumentos sean números con el día, mes y year de una fecha, 
% y el último argumento debe instanciarse al átomo del día de la semana, 
% uno entre lunes, martes, miercoles, jueves, viernes, sabado, domingo, 
% correspondiente a dicha fecha, por ejemplo:
% ? - dia_semana(31, 12, 2021, X)
% X = viernes

% He sustituido la palabra "año" por "year", para no tener problemas con el intérprete de Windows
% W - dia
% Y - mes
% Z - year
% X - dia de la semana
dia_semana(W,Y,Z,X) :- A is Z//100, siglos_item(B,A), C is (Z-A*100), year_item(D,C,B), mes_item(E,Y,D), dia_item(F,W,E), correccion_cantidad(G,F), correccion_year(H,G,Y,Z), correccion_cantidad(I,H), dia(I,X).
% X - Resultado, Y - siglos
siglos_item(X,Y) :- resto(A,Y,4), X is (3-A)*2.

% X - resultado, Y - year, Z - resultado anterior
year_item(X,Y,Z) :- A is (Y//12), resto(B,Y,12), C is (B//4), D is A+B+C, resto(E,D,7), F is E+Z, resto(X,F,7).

% X - Resultado, Y - numero de mes, Z - resultado anterior
mes_item(X,Y,Z) :- item(Y,A), X is A+Z.

% X - Resultado, Y - numero de dia, Z - resultado anterior
dia_item(X,Y,Z) :- resto(A,Y,7), X is A+Z.

% X - Resultado, Y - input
correccion_cantidad(X,Y) :- Y >7, X is Y-7.
correccion_cantidad(X,Y) :- Y =<0, X is Y+7.
correccion_cantidad(X,Y) :- Y =<7, Y >0, X is Y.

% X - Resultado, Y - cantidad a corregir, Z - mes, W - year
correccion_year(X,Y,Z,W) :- Z=<2, bisiesto(W), X is Y-1.
correccion_year(X,Y,Z,W) :- Z=<2, not(bisiesto(W)), X is Y.
correccion_year(X,Y,Z,W) :- Z>2, X is Y, W=W. % W=W para evitar el warnign de "Singleton variables: [W]"

% X - year
bisiesto(X) :- condicion1(X), not(condicion2(X)).
bisiesto(X) :- condicion1(X), condicion3(X).

% X - year
condicion1(X) :- A is X/4, B is X//4, A=B.
condicion2(X) :- A is X/100, B is X//100, A=B.
condicion3(X) :- A is X/400, B is X//400, A=B.

% X es el resto de Y/Z 
resto(X,Y,Z) :- A is (Y//Z), X is (Y-A*Z).

% meses en ingles
% (numero_de_mes, item_correcpondiente_al_mes)
% enero - january
item(1,0).
% febrero - february
item(2,3).
% marzo - march
item(3,3).
% abril - april
% 10-4 = 6
item(4,6).
% mayo - may
% 10 - 4 = 6; 6 + 30 = 36; 36 % 7 = 1
item(5, 1).
% junio - june
% 10-6 = 4
item(6,4).
% julio - july
% 10 - 6 = 4; 4 + 30 = 34; 34 % 7 = 6
item(7, 6).
% agosto - august
% 10 - 8 = 2
item(8,2).
% septiembre - september
% 10 - 8 = 2; 2 + 31 = 33; 33 % 7 = 5
item(9, 5).
% octubre - october
% 10 - 10 = 0
item(10,0).
% noviembre -november
% 10 - 10 = 0; 0 + 31 = 31; 31 % 7 = 3
item(11, 3).
% diciembre - december
item(12, 12).

% Correspondencia de los item del día, por días de la semana
dia(1,lunes).
dia(2,martes).
dia(3,miercoles).
dia(4,jueves).
dia(5,viernes).
dia(6,sabado).
dia(7,domingo).