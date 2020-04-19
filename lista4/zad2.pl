rybki(Kto) :-
    zagadka(Kto), !.

lewo(X, Y)  :- X is Y - 1.
prawo(X, Y) :- Y is X - 1.
obok(X, Y)  :- lewo(X, Y); prawo(X, Y).

domy(1, [dom(1, _, _, _, _, _)]).
domy(N, [dom(N, _, _, _, _, _) | L]) :-
    N1 is N - 1,
    domy(N1, L).

% dom(numer, narodowosc, kolor, papierosy, napój, zwierze)
zagadka(Kto) :-
    domy(5, Domy),
    member(dom(1, norweg, _, _, _, _), Domy),
    member(dom(_, anglik, czerwony, _, _, _), Domy),
    member(dom(X1, _, zielony, _, _, _), Domy), member(dom(Y1, _, bialy, _, _, _), Domy), lewo(X1, Y1),
    member(dom(_, dunczyk, _, _, herbata, _), Domy),
    member(dom(X2, _, _, light, _, _), Domy), member(dom(Y2, _, _, _, _, koty), Domy), obok(X2, Y2),
    member(dom(_, _, zolty, cygara, _, _), Domy),
    member(dom(_, niemiec, _, fajka, _, _), Domy),
    member(dom(3, _, _, _, mleko, _), Domy),
    member(dom(X3, _, _, light, _, _), Domy), member(dom(Y3, _, _, _, woda, _), Domy), obok(X3, Y3),
    member(dom(_, _, _, bezfiltra, _, ptaki), Domy),
    member(dom(_, szwed, _, _, _, psy), Domy),
    member(dom(X4, norweg, _, _, _, _), Domy), member(dom(Y4, _, niebieski, _, _, _), Domy), obok(X4, Y4),
    member(dom(X5, _, _, _, _, konie), Domy), member(dom(Y5, _, zolty, _, _, _), Domy), obok(X5, Y5),
    member(dom(_, _, _, mentolowe, piwo, _), Domy),
    member(dom(_, _, zielony, _, kawa, _), Domy),
    member(dom(_, Kto, _, _, _, rybki), Domy).



    



