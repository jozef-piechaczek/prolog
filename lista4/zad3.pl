zapalki(N, (duze(DN))) :- 				zapalki(N, (duze(DN), srednie(0), male(0))).
zapalki(N, (srednie(SN))) :- 			zapalki(N, (duze(0), srednie(SN), male(0))).
zapalki(N, (male(MN))) :- 				zapalki(N, (duze(0), srednie(0), male(MN))).
zapalki(N, (duze(DN), srednie(SN))) :-	zapalki(N, (duze(DN), srednie(SN), male(0))).
zapalki(N, (duze(DN), male(MN))) :-		zapalki(N, (duze(DN), srednie(0), male(MN))).
zapalki(N, (srednie(SN), male(MN))) :-	zapalki(N, (duze(0), srednie(SN), male(MN))).

zapalki(N, Kwadraty) :-
	Kwadraty = (duze(DN), srednie(SN), male(MN)),
	generuj(Wynik, DN, SN, MN),
	testuj(Wynik, DN, SN, MN, N),
	drukuj(Wynik).

generuj(Wynik, DN, SN, MN) :-
	utworz_duze(DN, DL),
	utworz_srednie(SN, SL),
	utworz_male(MN, ML),
	sumuj_wszystkie(Wynik, [DL, SL, ML]).

testuj(Wynik, DN, SN, MN, N) :-
	length(Wynik, Dlugosc),
	between(0, 24, N),
	Dlugosc is 24 - N,
	sprawdz_duze(DN, Wynik),
	sprawdz_srednie(SN, Wynik),
	sprawdz_male(MN, Wynik).

duze_kw([[1, 2, 3, 4, 7, 11, 14, 18, 21, 22, 23, 24]]).
srednie_kw([[1, 2, 4, 6, 11, 13, 15, 16], [2, 3, 5, 7, 12, 14, 16, 17], 
	[8, 9, 11, 13, 18, 20, 22, 23], [9, 10, 12, 14, 19, 21, 23, 24]]).
male_kw([[1, 4, 5, 8], [2, 5, 6, 9], [3, 6, 7, 10], [8, 11, 12, 15], 
	[9, 12, 13, 16], [10, 13, 14, 17], [15, 18, 19, 22], [16, 19, 20, 23], [17, 20, 21, 24]]).

podzbior([], _).
podzbior([H|T1], [H|T2]) :- 
	podzbior(T1, T2).
podzbior([H|T1], [_|T2]) :- 
	podzbior([H|T1], T2).

sumuj_wszystkie(X, [X]).
sumuj_wszystkie(Wynik, [L|T]) :-
	sumuj_wszystkie(NWynik, T),
	union(NWynik, L, Wynik).

utworz_duze(0, []).
utworz_duze(N, Lista) :-
	duze_kw(Duze),
	podzbior(PDuze, Duze),
	length(PDuze, N),
	sumuj_wszystkie(Lista, PDuze).

utworz_srednie(0, []).
utworz_srednie(N, Lista) :-
	srednie_kw(Srednie),
	podzbior(PSrednie, Srednie),
	length(PSrednie, N),
	sumuj_wszystkie(Lista, PSrednie).

utworz_male(0, []).
utworz_male(N, Lista) :-
	male_kw(Male),
	podzbior(PMale, Male),
	length(PMale, N),
	sumuj_wszystkie(Lista, PMale).

sprawdz(0, _, []).
sprawdz(N, E, [H|T]) :-
	sprawdz(N1, E, T),
	(subset(H, E) -> N is N1 + 1; N is N1).

sprawdz_duze(N, Lista) :-
	duze_kw(DL),
	sprawdz(N, Lista, DL).

sprawdz_srednie(N, Lista) :-
	srednie_kw(SL),
	sprawdz(N, Lista, SL).

sprawdz_male(N, Lista) :-
	male_kw(ML),
	sprawdz(N, Lista, ML).

drukuj(Wynik)	:-
	write('\n'),
	numlist(1, 24, Lista),
	drukuj(Lista, Wynik).

drukuj([], _).

drukuj([H|T], Wynik) :-
	member(H, [1, 2, 8, 9, 15, 16, 22, 23]),
	(member(H, Wynik) -> write('+---'); write('+   ')),
	drukuj(T, Wynik).

drukuj([H|T], Wynik) :-
	member(H, [4, 5, 6, 11, 12, 13, 18, 19, 20]),
	(member(H, Wynik) -> write('|   '); write('    ')),
	drukuj(T, Wynik).

drukuj([H|T], Wynik) :-
	member(H, [3, 10, 17, 24]),
	(member(H, Wynik) -> write('+---+\n'); write('+   +\n')),
	drukuj(T, Wynik).

drukuj([H|T], Wynik) :-
	member(H, [7, 14, 21]),
	(member(H, Wynik) -> write('|   \n'); write('    \n')),
	drukuj(T, Wynik).
