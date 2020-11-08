appartiene(X, [X| _]) :- !.
%!  con il cut si ferma appena trova l'elemento in cima alla sottolista
%
%
appartiene(X, [_ | Ys]) :- appartiene(X, Ys).

appendi([], X, X).
appendi([X | Xs], Ys, [X | Zs]) :- appendi(Xs, Ys, Zs).

lung([], 0).
lung([_ |  Xs], L) :- lung(Xs, L1), L is L1 + 1.

%!  nesimo(([a,b,c], 2, X).
%   X = b
%

nesimo([X | _], 1, X) :- !.
nesimo([_ | Xs], Y,  Z) :-
    Y > 1,
    Y1 is Y - 1,
    nesimo(Xs, Y1, Z).

%!  rimuovi([a, b, a], a, X)
%
%   X = [b]
%

rimuovi([], _, []).
rimuovi([X | Xs], X, Ys) :- rimuovi(Xs, X, Ys).
% ! sono nel caso in cui il primo elemento in cima alla sottolista è
% quello da rimuovere
rimuovi([X | Xs], Y, [X | Ys]) :-
    X \= Y,
    rimuovi(Xs, Y, Ys).
% ! sono nel caso in cui l'elemento da rimuovere è nella sottolista che
% esclude il primo elemento. [X|Ys] è la lista che ha X come primo
% elemento e coda Ys ed è esattamente la lista dove occorre cercare
% l'elemento da rimuovere
%  x\=Y è vero sse x e y non unificano
%

%!  sust/4
%   sust(a,b,[a,c,a],X)
%   x= [b,c,b]
%

sust(_,_,[],[]).
sust(A,B,[X | Xs], [B | Ys]) :- A = X, sust(A, B, Xs, Ys), !.
sust(A,B,[X | Xs], [X| Ys]) :-  sust(A, B, Xs, Ys).


%!  insieme/1 è vero se la lista non ha elementi ripetuti
%
%   Esempio:
%   ?- insieme([a,b,c]).
%   true
%
%   ?- insieme([a,c,a]).
%   false
%

insieme([]) :- !.
insieme([ _]) :-!.
insieme([X | Xs]) :-
    not(del(X, Xs, Zs)),!,
    insieme(Zs).
    
%! del/1 è un predicato ausiliario che elimina un elemento da un insieme

del(X, [X | L1], L1).
del(X, [Y | L], [Y | L1]) :-
    del(X, L, L1).

% permuta/2
% è vero se il secondo argomento è una permutazione del primo
% ?- permuta([a,b,c],[b,a,c]).
% true
% ?- permuta([a,b,c],[d,a,b]).
% false
seleziona(X, [X | Xs], Xs).
seleziona(X, [Y | Ys], [Y | Zs]) :-
    X \= Y,
    seleziona(X, Ys, Zs). 

permuta([],  []).
permuta(Xs, [Z | Zs]) :-
    seleziona(Z, Xs, Ys),
    permuta(Ys, Zs).
