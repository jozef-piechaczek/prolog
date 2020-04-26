lista(N, X) :-
        numlist(1, N, L), 
        lista_p(X, L, [], []).

lista_p([], [], [], []).

lista_p([El|W], L, N, P) :-
        select(El, N, N1), 
        lista_n(W, L, N1, P).

lista_p([El|W], [El|L], N, P) :-
        lista_n(W, L, N, [El|P]).

lista_n([], [], [], []).

lista_n([El|W], L, N, P) :-
        select(El, P, P1), 
        lista_p(W, L, N, P1).

lista_n([El|W], [El|L], N, P) :-
        lista_p(W, L, [El|N], P).
