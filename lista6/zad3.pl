
ab          --> a(N), b(N).
abc         --> a(N), b(N), c(N).
abFib       --> a(N), {fib(N, FibN)}, b(FibN).

a(0) --> [].
a(N) --> ['a'], a(N1), {N is N1 + 1}.

b(0) --> [].
b(N) --> ['b'], b(N1), {N is N1 + 1}.

c(0) --> [].
c(N) --> ['c'], c(N1), {N is N1 + 1}.

fib(0, 1) :- !.
fib(1, 1) :- !.
fib(N, F) :-
    fib(1, 1, 1, N, F).

fib(_, F1, N, N, F1) :- !.
fib(F0, F1, I, N, F) :-
    F2 is F0 + F1,
    I2 is I + 1,
    fib(F1, F2, I2, N, F).

% phrase(p(X), Y, Z) jest prawdą, jeśli Y = XZ (konkatenacja)

p([])       --> [].
p([X|Xs])   --> [X], p(Xs).
