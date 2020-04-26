% Everything is indexed from 0 (!)

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


even(X) :- 0 is mod(X, 2).
odd(X) :- 1 is mod(X, 2).

get_color(I, J, C) :-
    (((even(I), odd(J)); (odd(I), even(J))) -> C = black; C = white).

board(Hetman) :-
    length(Hetman, N),
    (N1 is N - 1),
    numlist(0, N1, L),
    draw_line(N1),
    draw(L, N1, Hetman).

% Draw board
draw([], _, _).

draw([H|T], N, Hetman) :-
    draw_row(H, N, Hetman),
    draw_row(H, N, Hetman),
    draw_line(N),
    draw(T, N, Hetman).

% Draw row of chess board
draw_row(I, N, Hetman) :-
    numlist(0, N, L),
    draw_row(L, I, N, Hetman).

draw_row([], _, _, _) :-
    write("|\n").

draw_row([J|T], I, N, Hetman) :-
    get_color(I, J, Color),
    ((Color = black) ->
        (nth0(I, Hetman, J) -> write("|:###:"); write("|:::::"));
        (nth0(I, Hetman, J)  -> write("| ### "); write("|     "))
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
