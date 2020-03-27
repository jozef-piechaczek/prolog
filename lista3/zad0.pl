porownaj(M, X, X) :- X > M.
porownaj(M, X, M) :- X =< M.

maximum1([X], X).
maximum1([X|L], M) :- 
    maximum1(L, M1), 
    porownaj(M1, X, M).

maximum2([X|L], M) :- maximum2(L, X, M).

maximum2([], M, M).
maximum2([X|L], M1, M) :-
    porownaj(M1, X, M2),
    maximum2(L, M2, M).

maximum3([X|L], M) :- maximum2(L, X, M).

maximum3([], M, M).
maximum3([X|L], M1, M) :-
    (X > M1 -> M2 is X; M2 is M1),
    maximum3(L, M2, M).

