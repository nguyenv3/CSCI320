fib( 0, 0).
fib( 1, 1).
fib(N,FN) :-
    N > 1,
    N1 is N-1,
    N2 is N-2,
    fib(N1,F1),
    fib(N2,F2),
    plus(F1,F2,FN).

ack(0,Y,A) :- A is Y + 1.
ack(X,0,A) :- X > 0, X1 is X - 1, ack(X1, 1, A).
ack(X,Y,A) :- X > 0, Y > 0, X1 is X - 1, Y1 is Y - 1, ack(X, Y1, A1), ack(X1, A1, A).
