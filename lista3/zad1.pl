avg(Lista, Dlugosc, X) :-
    sum_list(Lista, S),
    (Dlugosc > 0 -> X is S / Dlugosc; X is -1).

sum_kwadr(Lista, Srednia, X) :- sum_kwadr(Lista, Srednia, 0, X).

sum_kwadr([], _, Q, Q).
sum_kwadr([Elem|List], Srednia, X, Wynik) :-
    T1 is (Elem - Srednia),
    Y is X + T1 * T1,
    sum_kwadr(List, Srednia, Y, Wynik).

wariancja(L, X) :-
    length(L, Dlugosc),
    avg(L, Dlugosc, Srednia),
    sum_kwadr(L, Srednia, SumaKw),
    (Dlugosc > 0 -> X is SumaKw / Dlugosc; X is -1).
