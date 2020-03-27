max_sum(L, X) :- max_sum(L, 0, 0, X).

max_sum([], _, X, X).
max_sum([El|List], EndHere, SoFar, X) :-
    T is EndHere + El,
    (T < 0 -> EndHereNew is 0; EndHereNew is T),
    (EndHereNew > SoFar -> SoFarNew is EndHereNew; SoFarNew is SoFar),
    max_sum(List, EndHereNew, SoFarNew, X).
