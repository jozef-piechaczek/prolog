:- consult('zad1.pl').
:- consult('scanner.pl').
:- consult('interpreter.pl').

wykonaj(S) :-
    open(S, read, X),
    scanner(X, Y),
    close(X),
    phrase(program(PROGRAM), Y),
    interpreter(PROGRAM).
