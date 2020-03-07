on(blok1, blok2).
on(blok2, blok3).
on(blok3, blok4).
on(blok4, blok5).
on(blok5, blok6).
on(blok6, blok7).
on(blok7, blok8).

above(X, Y) :- on(X, Y).
above(X, Z) :- on(X, Y), above(Y, Z).
