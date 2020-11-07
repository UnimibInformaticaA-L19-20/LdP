%%%% -*- Mode: Prolog -*-

%%%% lists.pl

%!  islist/1
%
%   il predicato e' vero se l'argomento e' una lista anche vuota o di un
%   solo elemento

islist([]).
islist([_ | _]).

%!  appendi/3
%
%   il predicato e' vero quando il terzo argomento e' la concatenazione
%   dei primi due

appendi([], L, L) :-
    islist(L).
appendi([X | Xs], Ys, [X | Zs]) :- appendi(Xs, Ys, Zs).

%!  list_length
%
%   il predicato e' vero quando il secondo argomento e' la lunghezza del
%   primo (che deve essere una lista)

list_length([],0).
list_length([_ | Xs], LX) :-
    list_length(Xs, LXs),
    LX is 1 + LXs.
%!  list_ref
%
%   il predicato e' vero quando il terzo elemento e' l'elemento in
%   posizione p (il secondo argomento) della lista L (il primo
%   argomento).

list_ref([X | _], 0, X).
list_ref([_ | Xs], P, R) :-
    P > 0,
    Ps is P - 1,
    list_ref(Xs, Ps, R).

%!  ismember
%
%   il predicato è vero quando il primo argomento è il primo elemento
%   della lista (che è il secondo argomento).

ismember(X, [X | _]).
ismember(X, [Y | Ys]) :-
    X \= Y,
    ismember(X, Ys).

%%%% end of file lists.pl
