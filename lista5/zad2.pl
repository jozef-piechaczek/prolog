hetmany(N, P) :-
    N1 is N - 1,
    numlist(0, N1, L),
    perm(L, P),
    dobra(P).

perm([], []).
perm(L1, [X | L3]) :-
    select(X, L1, L2),
    perm(L2, L3).

dobra(X) :-
    \+ zla(X).

zla(X) :-
    append(_, [Wi | L1], X),
    append(L2, [Wj | _], L1),
    length(L2, K),
    abs(Wi - Wj) =:= K + 1.


ch_indexing1(X, I, J, N) :-
    (I is X div N),
    (J is X mod N).

ch_indexing2(X, I, J, N) :-
    X is I * N + J.

even(X) :- 0 is mod(X, 2).
odd(X) :- 1 is mod(X, 2).

get_color(F, C) :-
    ch_indexing1(F, I, J),
    (((even(I), odd(J)); (odd(I), even(J))) -> C = black; C = white).


idx_hetman(X, LH, N) :-
    N1 is N - 1,
    numlist(0, N1, LN),
    idx_hetman(LN, LH, X, N).

idx_hetman([], [], [], _).
idx_hetman([HN|TN], [HH|TH], [HR|TR], N) :-
    idx_hetman(TN, TH, TR, N),
    ch_indexing2(HR, HN, HH, N).

board(N) :-
    (N1 is N - 1),
    numlist(0, N1, L),
    draw(L, N1).

draw([], N) :-
    draw_line(N).

draw([H|T], N) :-
    write(H),
    draw(T, N).

draw_line(N) :-
    numlist(1, N, L),
    draw_line2(L).

draw_line2([]) :-
    write("+\n").

draw_line2([_|T]) :-
    write("+-----"),
    draw_line2(T).
