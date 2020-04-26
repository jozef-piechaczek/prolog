le(1, 1).
le(1, 2).
le(1, 3).
le(1, 4).
le(2, 2).
le(2, 3).
le(2, 4).
le(3, 3).
le(3, 4).
le(4, 4).

zwrotna             :- \+ ((le(X, _); le(_, X)), \+ le(X, X)).
antysymetryczna     :- \+ (le(X, Y), le(Y, X), X \= Y).
przechodnia         :- \+ ((le(X, Y), le(Y, Z)), \+ (le(X, Z))).

czesciowy_porzadek  :- zwrotna, przechodnia, antysymetryczna.
