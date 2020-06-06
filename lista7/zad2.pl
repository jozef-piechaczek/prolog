:- consult('zad1.pl').

split(IN, OUT1, OUT2) :-
    split(IN, OUT1, OUT2, 1).

split(IN, OUT1, OUT2, C) :-
    freeze(IN,
        (IN = [H | T]
        ->  ( C = 1
            ->  OUT1 = [H | T1],
                split(T, T1, OUT2, 2)
            ;   OUT2 = [H | T1],
                split(T, OUT1, T1, 1)
            )
        ;   OUT1 = [],
            OUT2 = []
        )
    ).

merge_sort(IN, OUT) :-
    freeze(IN,
        (IN = [H | T]
        ->  freeze(T,
                (T \= []
                ->  split(IN, L, R),
                    merge_sort(L, O1),
                    merge_sort(R, O2),
                    merge(O1, O2, OUT)
                ;   OUT = [H]
                )
            )
        ;   OUT = []
        )
    ).
