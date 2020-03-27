ins_even(X, [Y|L], [Y,X|L]).
ins_even(X, [Y,Z|L], [Y,Z|L2]) :-
    ins_even(X, L, L2).

ins_odd(X, L, [X|L]).
ins_odd(X, [Y,Z|L], [Y,Z|L2]) :-
    ins_odd(X, L, L2).

even_permutation([], []).
even_permutation([X|L], P) :-
    even_permutation(L, P1),
    ins_odd(X, P1, P).
even_permutation([X|L], P) :-
    odd_permutation(L, P1),
    ins_even(X, P1, P).

odd_permutation([X|L], P) :-
    odd_permutation(L, P1),
    ins_odd(X, P1, P).
odd_permutation([X|L], P) :-
    even_permutation(L, P1),
    ins_even(X, P1, P).
