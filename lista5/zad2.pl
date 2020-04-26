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


get_color(I, J, C) :-
    (((even(I), odd(J)); (odd(I), even(J))) -> C = black; C = white).

new_hetman([], [], 0).
new_hetman(X, LH, N) :-
    N1 is N - 1,
    numlist(0, N1, LN),
    new_hetman(LN, LH, X, N).

new_hetman([], [], [], _).
new_hetman([HN|TN], [HH|TH], [HR|TR], N) :-
    new_hetman(TN, TH, TR, N),
    ch_indexing2(HR, HN, HH, N).

board(Hetman) :-
    length(Hetman, N),
    new_hetman(NewHetman, Hetman, N),
    (N1 is N - 1),
    numlist(0, N1, L),
    draw_line(N1),
    draw(L, N1, NewHetman).

% Draw board
draw([], _, _).

draw([H|T], N, NewHetman) :-
    draw_row(H, N, NewHetman),
    draw_row(H, N, NewHetman),
    draw_line(N),
    draw(T, N, NewHetman).

% Draw row of chess board
draw_row(I, N, Hetman) :-
    numlist(0, N, L),
    draw_row(L, I, N, Hetman).

draw_row([], _, _, _) :-
    write("|\n").

draw_row([J|T], I, N, Hetman) :-
    N1 is N + 1,
    ch_indexing2(El, I, J, N1),
    get_color(I, J, Color),
    ((Color = black) ->
        (member(El, Hetman) -> write("|:###:"); write("|:::::"));
        (member(El, Hetman) -> write("| ### "); write("|     "))
    ),
    draw_row(T, I, N, Hetman).

% Draw line of chess board
draw_line(N) :-
    numlist(0, N, L),
    draw_line2(L).

draw_line2([]) :-
    write("+\n").

draw_line2([_|T]) :-
    write("+-----"),
    draw_line2(T).
