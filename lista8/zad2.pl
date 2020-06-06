:- use_module(library(clpfd)).

plecak(Wartosci, Wielkosci, Pojemnosc, Zmienne) :-
    length(Wartosci, L), length(Zmienne, L),
    Zmienne ins 0..1,
    scalar_product(Wielkosci, Zmienne, #=, APojemnosc),
    APojemnosc #=< Pojemnosc,
    scalar_product(Wartosci, Zmienne, #=, AWartosc),
    once(labeling([max(AWartosc)], Zmienne)).
