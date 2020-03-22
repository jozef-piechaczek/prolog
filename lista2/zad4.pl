regula(0, +, Y, Y).                     % 0 + x -> x
regula(X, +, 0, X).                     % x + 0 -> x
regula(X, -, X, 0).                     % x - x -> 0
regula(0, /, _, 0).                     % 0 / x -> 0
regula(0, *, _, 0).                     % 0 * x -> 0
regula(_, *, 0, 0).                     % x * 0 -> 0
regula(X*Y, /, Y, X)    :- (number(Y), Y =\= 0); \+ number(Y).
regula(X, /, X, 1)      :- (number(X), X =\= 0); \+ number(X).

uprosc(X, Y) :- X =.. L, L = [Op, A, B], regula(A, Op, B, Y).
uprosc(X, X) :- atom(X); number(X).
uprosc(X, Y) :- X =.. L, L = [Op, A, B], 
                \+ regula(A, Op, B, _),
                uprosc(A, A1),
                uprosc(B, B1),
                regula(A1, Op, B1, Y).