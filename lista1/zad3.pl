left_of(butterfly, fish).
left_of(hourglass, butterfly).
left_of(pencil, hourglass).
above(camera, butterfly).
above(bicycle, pencil).
above(cake, bicycle). % additional

left_of_r(X, Y)     :- left_of(X, Y).
left_of_r(X, Z)     :- left_of(X, Y), left_of_r(Y, Z). 

above_r(X, Y)       :- above(X, Y).
above_r(X, Z)       :- above(X, Y), above_r(Y, Z).

right_of(X, Y)      :- left_of(Y, X).

right_of_r(X, Y)    :- right_of(X, Y).
right_of_r(X, Z)    :- right_of(X, Y), right_of_r(Y, Z). 

below(X, Y)         :- above(Y, X).

higher(A, B)        :- above_r(A, B); above_r(A, X), (left_of_r(B, X); right_of_r(B, X)).