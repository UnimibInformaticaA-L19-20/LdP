%%%% -*- Mode: Prolog -*-
%%%%  bsts.pl
%
%   Binary Search Tree library.
%
%   Predicati:
%   is_node/1
%   is_leaf/1
%   is_tree/1
%   bst_delete/3
%
%   bst_search(Tree, Key, Value)
%   bst_insert(Tree, Key, Value, NewTree)
%   bst_delete(Tree, Key, NewTree)
%   bst_traverse(Tree, Mode, Traversal)
%   attenzione: is_bst/1 e bst_delete/3 non sono inutili!

%!  is_node
is_node(void).
is_node(n(_Key, _Value, Left, Right)) :-
    is_node(Left),
    is_node(Right).

%!  is_leaf

is_leaf(n(_, _, void, void)).

%!  is_tree

is_tree(tree(_Info, Root)) :- is_node(Root).

%!  is_binary_tree

is_binary_tree(Tree) :- is_tree(Tree).

%%%%%%%%%%%%%%%%
%!  bst_search

bst_search(tree(_,  R), Key, Value) :-
    bst_node_search(R, Key, n(Key, Value, _, _)).

%!  bst_node_search

bst_node_search(n(Key, Value, _, _), Key, n(Key, Value, _, _)).
bst_node_search(n(KN, _, L, _), Key, N) :-
    KN > Key,
    bst_node_search(L, Key, N).
bst_node_search(n(KN, _, _, R), Key, N) :-
    KN < Key,
    bst_node_search(R, Key, N).

%!  bst_insert
%   il predicato è vero quando una coppia chiave valore puo eserre
%   inserita in un alberot Tree, cedendo un nuovo albero NewTree che
%   include la suddetta coppia
%
bst_insert(tree(TreeInfo, Root), Key, Value, tree(TreeInfo, NewRoot)):-
    bst_node_insert(Root, Key, Value, NewRoot).

%!  bst_node_insert
%   il predicato è vero quando una coppia chiave valore può essere
%   inserita in un albero con radice Node, cedendo un nuovo albero con
%   radice NewRoot che include la suddetta coppia

bst_node_insert(void, K, V, node(K, V, void, void)).
bst_node_insert(node(K, _, L, R), K, V, node(K, V, L, R)).
bst_node_insert(node(KN, VN, L, R), K, V, node(KN, VN, NewL, R)):-
    K < KN,
    bst_node_insert(L, K, V, NewL).
bst_node_insert(node(KN, VN, L, R), K, V, node(KN, VN, L, NewR)):-
    K > KN,
    bst_node_insert(R, K, V, NewR).

%!  bst_delete
%   il predicato è vero quando un albero T viene trasformato in un
%   albero NewDelT con l'oggetto con chiave K è rimosso da esso

bst_delete(tree(Info, R), K, tree(Info, NewDelT)).

%!  bst_print
%   il predicato è sempre vero ma come effetto collaterale c'è la stampa
%   di T sulla console

bst_print(tree(Info, Root)) :-
    format("Dictionary Tree (~w)~n~n", Info),
    bst_node_print(Root, 0).

%!  bst_node_print
%
%   il predicato è sempre vero ma come effetto collaterale stampa
%   l'albero che ha radice uguale al primo argomento
%

bst_node_print(void, _) :-
    writeln('*').
bst_node_print(node(K, V, L, R), I) :-
    NTab is I * 4,
    tab(NTab),
    format("~w ==> ~w~n", [K, V]),
    NewI is I + 1,
    bst_node_print(L, NewI),
    bst_node_print(R, NewI).
%%%% end of file -- bsts.pl




