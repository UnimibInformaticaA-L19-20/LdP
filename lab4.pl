% inv/2
% invertire una lista
% ?- inv([a, b, c], X).
% X = [c, b, a].
inv([], []).
inv([X], [X]).
inv([X | Xs], Y) :-
    inv(Xs, Z),
    append(Z, [X], Y). 

% palindromo/1
% decidere se una lista è un palindromo
% ?- palindromo([a, b, x, b, a]).
palindromo(X) :-
    % inv(X, X).
    reverse(X, X).

% pack/2
% partizionare elementi ripetuti in sottoliste
% - se una lista contiene elementi ripetuti consecutivi,
%   si scrivono in sottoliste
% ?- pack([a, a, a, b, b, a, e, e, e], X).
% X = [[a, a, a], [b, b], [a], [e, e, e]].
transfer(X, [], [], [X]).
transfer(X, [Y | Ys], [Y | Ys], [X]) :-
    X \= Y.
transfer(X, [X | Xs], Ys, [X | Zs]) :- 
    transfer(X, Xs, Ys, Zs).

pack([], []).
pack([X | Xs], [Z | Zs]) :-
    transfer(X, Xs, Ys, Z),
    pack(Ys, Zs).

% duplica/2
% duplicare gli elementi di una lista
% ?- duplica([a,b,c,c], X).
% X = [a, a, b, b, c, c, c, c].
duplica([], []).
duplica([X | Xs], [X, X | Ys]) :-
    duplica(Xs, Ys).

% duplica/3
% ripetere gli elementi di una lista un numero di volte dato
% ?- duplica([a,b,c], 3, X).
% X = [a, a, a, b, b, b, c, c, c].
ripeti(_, 0, []).
ripeti(X, N, [X | Ys]) :-
    N > 0,
    N1 is N - 1,
    ripeti(X, N1, Ys).

duplica([], _, []).
duplica([X | Xs], N, Y) :-
    ripeti(X, N, Z),
    duplica(Xs, N, W),
    append(Z, W, Y).

% foglie/2
% creare una lista con le foglie di un albero binario
% foglie(T,N) è true se N è una lista con tutti i valori
%	di nodi foglie dell'albero T
% ?- foglie(nodo(1, 1, nodo(2, 2, nodo(3, 3, void, void), nodo(4, 4, void, void)), nodo(5, 5, nodo(6, 6, void, void), nodo(7, 7, void, void))), X).
% X = [3, 4, 6, 7].
foglie(void, []).
foglie(nodo(_, V, void, void), [V]) :- !.
foglie(nodo(_, _, L, R), M) :-
    foglie(L, ML),
    foglie(R, MR),
    append(ML, MR, M).

% interni/2
% è la lista con tutti i valori dei nodi interni
% ?- interni(nodo(1, 1, nodo(2, 2, nodo(3, 3, void, void), nodo(4, 4, void, void)), nodo(5, 5, nodo(6, 6, void, void), nodo(7, 7, void, void))), X).
% X = [2, 1, 5].
interni(void, []).
interni(nodo(_, _, void, void), []) :- !.
interni(nodo(_, V, L, R), M) :-
    interni(L, ML),
    interni(R, MR),
    append(ML, [V | MR], M).