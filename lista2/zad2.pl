% element występuje jednokrotnie jeśli nie zawiera się w liście powstałej po usunięciu tego elementu
jednokrotnie(X, L)  :- select(X, L, L1), \+ member(X, L1).

% weżmy wszystkie listy takie, że L = L1 + X + L2 ('+' to konkatenacja), 
% X występuje dwukrotnie jeśli dla listy L wystepuje raz w L1 i nie występuje w L2 (lub odwrotnie) 
dwukrotnie(X, L) :- append(L1, [X | L2], L), jednokrotnie(X, L1), \+ member(X, L2).