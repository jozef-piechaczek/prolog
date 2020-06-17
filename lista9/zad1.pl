:- use_module(library(clpfd)).

tasks([%D  R1 R2
    [2, 1, 3],
    [3, 2, 1],
    [4, 2, 2],
    [3, 3, 2],
    [3, 1, 1],
    [3, 4, 2],
    [5, 2, 1]]).
resources(5, 5).


schedule(H, Ss, MS) :-
    tasks(L),
    resources(R1, R2),
    MS in 0..H,
    mt(L, H, T1, T2, Ss, MS),
    cumulative(T1, [limit(R1)]),
    cumulative(T2, [limit(R2)]),
    once(labeling([min(MS), ff], [MS | Ss])).

mt([], _, [], [], [], _).
mt([[D, R1, R2] | L1], H, [task(S, D, E, R1, _) | L2], [task(S, D, E, R2, _) | L3], [S | L4], MS) :-
    S in 0..H,
    E #= S + D, MS #>= E,
    mt(L1, H, L2, L3, L4, MS).