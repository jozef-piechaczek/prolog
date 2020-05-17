:- consult('scanner.pl').

program([]) --> [].
program([Instrukcja|Program]) -->
    instrukcja(Instrukcja), [sep(';')], program(Program).

instrukcja(assign(Identyfikator, Wyrazenie)) -->
    [id(Identyfikator), sep(':=')], wyrazenie(Wyrazenie).
instrukcja(read(Identyfikator)) -->
    [key('read'), id(Identyfikator)].
instrukcja(write(Wyrazenie)) -->
    [key('write')], wyrazenie(Wyrazenie).
instrukcja(if(Warunek, Program)) -->
    [key('if')], warunek(Warunek), [key('then')], program(Program), [key('fi')].
instrukcja(if(Warunek, Program1, Program2)) -->
    [key('if')], warunek(Warunek), [key('then')], program(Program1), [key('else')],
    program(Program2), [key('fi')].
instrukcja(while(Warunek, Program)) -->
    [key('while')], warunek(Warunek), [key('do')], program(Program), [key('od')].

wyrazenie(Skladnik + Wyrazenie) -->
    skladnik(Skladnik), [sep('+')], wyrazenie(Wyrazenie).
wyrazenie(Skladnik - Wyrazenie) -->
    skladnik(Skladnik), [sep('-')], wyrazenie(Wyrazenie).
wyrazenie(Skladnik) -->
    skladnik(Skladnik).

skladnik(Czynnik * Skladnik) -->
    czynnik(Czynnik), [sep('*')], skladnik(Skladnik).
skladnik(Czynnik / Skladnik) -->
    czynnik(Czynnik), [sep('/')], skladnik(Skladnik).
skladnik(Czynnik mod Skladnik) -->
    czynnik(Czynnik), [key('mod')], skladnik(Skladnik).
skladnik(Czynnik) -->
    czynnik(Czynnik).

czynnik(id(Identyfikator)) -->
    [id(Identyfikator)].
czynnik(int(Num)) -->
    [int(Num)].
czynnik((Wyrazenie)) -->
    [sep('(')], wyrazenie(Wyrazenie), [sep(')')].

warunek((Koniunkcja ; Warunek)) -->
    koniunkcja(Koniunkcja), [key('or')], warunek(Warunek).
warunek(Koniunkcja) -->
    koniunkcja(Koniunkcja).

koniunkcja((Prosty, Koniunkcja)) -->
    prosty(Prosty), [key('and')], koniunkcja(Koniunkcja).
koniunkcja(Prosty) -->
    prosty(Prosty).

prosty(Wyrazenie1 =:= Wyrazenie) -->
    wyrazenie(Wyrazenie1), [sep('=')],  wyrazenie(Wyrazenie).
prosty(Wyrazenie1 =\= Wyrazenie) -->
    wyrazenie(Wyrazenie1), [sep('/=')], wyrazenie(Wyrazenie).
prosty(Wyrazenie1 < Wyrazenie) -->
    wyrazenie(Wyrazenie1), [sep('<')],  wyrazenie(Wyrazenie).
prosty(Wyrazenie1 > Wyrazenie) -->
    wyrazenie(Wyrazenie1), [sep('>')],  wyrazenie(Wyrazenie).
prosty(Wyrazenie1 >= Wyrazenie) -->
    wyrazenie(Wyrazenie1), [sep('>=')], wyrazenie(Wyrazenie).
prosty(Wyrazenie1 =< Wyrazenie) -->
    wyrazenie(Wyrazenie1), [sep('=<')], wyrazenie(Wyrazenie).
prosty(Wyrazenie1 < Wyrazenie) -->
    wyrazenie(Wyrazenie1), [sep('<')],  wyrazenie(Wyrazenie).
prosty((Wyrazenie)) -->
    [sep('(')], wyrazenie(Wyrazenie), [sep(')')].
