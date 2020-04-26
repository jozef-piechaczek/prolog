browse(Term) :-
    command([Term]).

command([]).
command([H|T]) :-
    write(H),
    write("\ncommand: "),
    read(C),
    traverse(C, [H|T]).

traverse(i, [H|T]) :-
    H =.. [_,C|_],
    command([C,H|T]).

traverse(o, [_|T]) :-
    command(T).

traverse(p, [E,P|T]) :-
    P =.. [_|C],
    append(_, [X,E|_], C),
    command([X,P|T]).

traverse(n, [E,P|T]) :-
    P =.. [_|C],
    append(_, [E,X|_], C),
    command([X,P|T]).

traverse(_, S) :- command(S).
