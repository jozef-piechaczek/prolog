% Kopia zadania z poprzedniej listy

scanner(Stream, Tokens) :-
    read_string(Stream, _, String),
    atom_codes(String, Codes),
    phrase(lexer(Tokens), Codes).

lexer([])           --> [].
lexer(Tokens)       --> whitespace, lexer(Tokens).
lexer([Token|Tail]) --> token(Token), lexer(Tail).

whitespace --> [W], !, {char_type(W, space)}.
whitespace --> [W], !, {char_type(W, newline)}.

token(key(X))   --> key(X), !.
token(int(X))   --> int(X), !.
token(id(X))    --> id(X2), !, {atom_chars(X, X2)}.
token(sep(X))   --> sep(X), !.



key(write)      --> "write".
key(while)      --> "while".
key(read)       --> "read".
key(then)       --> "then".
key(else)       --> "else".
key(and)        --> "and".
key(mod)        --> "mod".
key(if)         --> "if".
key(fi)         --> "fi".
key(do)         --> "do".
key(od)         --> "od".
key(or)         --> "or".

sep('/=')       --> "/=".
sep(':=')       --> ":=".
sep('=<')       --> "=<".
sep('>=')       --> ">=".
sep('=')        --> "=".
sep(';')        --> ";".
sep('+')        --> "+".
sep('-')        --> "-".
sep('/')        --> "/".
sep('*')        --> "*".
sep('(')        --> "(".
sep(')')        --> ")".
sep('<')        --> "<".
sep('>')        --> ">".

int(I)          --> digit(D0), digits(D), {number_codes(I, [D0|D])}.
digits([D|T])   --> digit(D), !, digits(T).
digits([])      --> [].
digit(D)        --> [D], {code_type(D, digit)}.

id([L|T])       --> upper(L), id2(T).
upper(L)        --> [L], {char_type(L, upper)}.
id2([L|T])      --> upper(L), id2(T).
id2([])         --> [].
