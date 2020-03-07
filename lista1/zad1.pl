ojciec(krzysztof, bogdan).
ojciec(krzysztof, bozenka).
ojciec(grzegorz, mariola).
matka(monika, bogdan).
matka(monika, bozenka).
matka(hanna, mariola).
rodzic(krzysztof, bogdan).
rodzic(krzysztof, bozenka).
rodzic(grzegorz, mariola).
rodzic(monika, bogdan).
rodzic(monika, bozenka)
rodzic(hanna, mariola).
mezczyzna(grzegorz).
mezczyzna(krzysztof).
mezczyzna(bogdan).
kobieta(bozenka).
kobieta(mariola).
kobieta(monika).
kobieta(hanna).

jest_matka(X)       :- matka(X, _).
jest_ojcem(X)       :- ojciec(X, _).
jest_synem(X)       :- rodzic(_, X), mezczyzna(X).
rodzenstwo(X, Y)    :- rodzic(Z, X), rodzic(Z, Y), X \= Y.
siostra(X, Y)       :- kobieta(X), rodzenstwo(X, Y).
dziadek(X, Y)       :- mezczyzna(X), rodzic(X, Y), rodzic(Y, _).