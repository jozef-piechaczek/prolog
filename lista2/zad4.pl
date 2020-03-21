regula(0, +, Y, Y).                     % 0 + x -> x
regula(X, +, 0, X).                     % x + 0 -> x
regula(X, -, X, 0).                     % x - x -> 0
regula(0, /, _, 0).                     % 0 / x -> 0
regula(0, *, _, 0).                     % 0 * x -> 0
regula(_, *, 0, 0).                     % x * 0 -> 0
regula(X, *, 1, X).
regula(1, *, X, X).
regula(X*Y, /, Y, X)    :- (number(Y), Y =\= 0); \+ number(Y).
regula(X, /, X, 1)      :- (number(X), X =\= 0); \+ number(X).

uprosc(X, Y) :- X =.. L, L = [Op|L1], L1 = [A|L2], L2 = [B|_], regula(A, Op, B, Y).
uprosc(X, X) :- atom(X); number(X).
uprosc(X, Y) :- X =.. L, L = [Op|L1], L1 = [A|L2], L2 = [B|_],
                \+ regula(A, Op, B, _),
                uprosc(A, A1),
                uprosc(B, B1),
                regula(A1, Op, B1, Y).

% element(X)   :- atom(x); number(X).

% uprosc(X, Y) :-     X =.. L, L = [Op|L1], L1 = [A|L2], L2 = [B|_],
%                     (
                        
%                         element(A), element(B), regula(A, Op, B, Y)
%                         ;
%                         element(A), \+ element(B), uprosc(B, T), regula(A, Op, T, Y)
%                         ;
%                         \+ element(A), \+ element(B), uprosc(A, T1), uprosc(A, T2), regula(T1, Op, T2, Y)
                        
%                     ).

% uprosc(X, Y) :-     X =.. L, L = [Op|L1], L1 = [A|L2], L2 = [B|_], regula(A, Op, B, Y).
% uprosc(X, Y) :-     X =.. L, L = [Op|L1], L1 = [A|L2], L2 = [B|_], uprosc(A, A1), uprosc(B, B1), Y =.. [Op, A1, B1].

% simplify(C, C)          :- atom(C) ; number(C).
% simplify(X, Y)          :- X =.. L, L = [Op|L1], L1 = [A|L2], L2 = [B|_], regula(A, Op, B, Y).
% simplify(X, Y)          :- X =.. L, L = [Op|L1], L1 = [A|L2], L2 = [B|_], simplify(A, A1), simplify(B, B1), Y =.. [Op, A1, B1].

% simplify(C, C)          :- atom(C); number(C).
% simplify(X+Y, Z1)       :- regula(X, +, Y, Z), simplify(Z, Z1).
% simplify(X+Y, X1+Y1)    :- simplify(X, X1), simplify(Y, Y1).