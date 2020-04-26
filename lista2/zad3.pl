arc(a,b).
arc(b,a).
arc(b,c).
arc(c,d).

sciezka(X, Y, V) :- 
		arc(X, Z),
		\+ member(Z, V),
		(
			Y = Z 
			; 
			sciezka(Z, Y, [X | V])
		).

osiagalny(X, Y) :- X=Y; sciezka(X, Y, []).