utworz_str([], []).
utworz_str([Z|X], [s(Z, x)|Y]) :- utworz_str(X, Y).

utworz_2(N, X) :- 
        numlist(1, N, Y), 
        utworz_str(Y, X).

wybierz(Lista, Typ, Wynik, Wynik2, ListaW) :-   
        select(Wynik, Lista, ListaW),
        Wynik = s(Wynik2, Typ).

wybierz_pierwszy(Lista, Typ, Wynik, ListaW, Akk) :- 
        Lista = [El|L1],
        (
            El = s(Wynik, x),
            append(Akk, [s(Wynik, Typ)], T1),
            append(T1, L1, ListaW)
            ;
            \+ El = s(_, x),
            append(Akk, [El], T2),
            wybierz_pierwszy(L1, Typ, Wynik, ListaW, T2)
        ).

lista(N, X) :-
    utworz_2(N, Y),
    lista(Y, X, p).

lista([], [], p).
lista([], [], n).

lista(Lista, Wynik, p)  :-
    wybierz(Lista, p, _, T1, Lista2),
    Wynik = [T1|Wynik2],
    lista(Lista2, Wynik2, n).

lista(Lista, Wynik, n)  :-
    wybierz(Lista, n, _, T1, Lista2),
    Wynik = [T1|Wynik2],
    lista(Lista2, Wynik2, p).

lista(Lista, Wynik, p)  :-
    wybierz_pierwszy(Lista, p, T1, Lista2, []),
    Wynik = [T1|Wynik2],
    lista(Lista2, Wynik2, n).

lista(Lista, Wynik, n)  :-
    wybierz_pierwszy(Lista, n, T1, Lista2, []),
    Wynik = [T1|Wynik2],
    lista(Lista2, Wynik2, p).