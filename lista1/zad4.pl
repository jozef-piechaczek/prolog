% le(1, 1).
% le(1, 2).
% le(1, 3).
% le(1, 4).
% le(2, 2).
% le(2, 3).
% le(2, 4).
% le(3, 3).
% le(3, 4).
% le(4, 4).

le(3, 9).
le(3, 6).
le(2, 4).
le(2, 6).
le(6, 12).
le(4, 8).
le(4, 12).
le(12, 24).
le(8, 24).
le(3, 3).
le(5, 5).
le(2, 2).
le(9, 9).
le(6, 6).
le(4, 4).
le(12, 12).
le(8, 8).
le(24, 24).

maksymalny(X)   :- le(X, X), \+ (le(X, Y), X \= Y).
minimalny(X)    :- le(X, X), \+ (le(Y, X), X \= Y).

najwiekszy(X)   :- le(X, X), \+ (le(Y, Y), \+ le(Y, X)).
najmniejszy(X)  :- le(X, X), \+ (le(Y, Y), \+ le(X, Y)).


