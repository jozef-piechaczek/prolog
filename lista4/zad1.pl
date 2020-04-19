wyrazenie(Lista, Wartosc, Wyrazenie) :-
    wyrazenie(Lista, Wyrazenie),
    Wartosc is Wyrazenie.

wyrazenie([N], N).
wyrazenie(L, W) :-
    append(L1, L2, L),
    L1 \= L,
    L2 \= L,
    wyrazenie(L1, X),
    wyrazenie(L2, Y),
    (
        W = X + Y;
        W = X - Y;
        W = X * Y;
        (W = X / Y, 0 =\= Y)
    ).
