% This buffer is for notes you don't want to save.
% If you want to create a file, visit that file with C-x C-f,
% then enter the text in that file's own buffer.

%%%% -*- Mode: Prolog -*-

%%%% family.pl --
%%%% Family tree example from "Art of Prolog" plus the "Mahabharata".

%%%% Males and females.

male(terach).
male(abraham).
male(nachor).
male(haran).
male(isaac).
male(lot).
male(esau).
male(jacob).
male(bethuel).
male(laban).
male(benjamin).
male(joseph).

male(shantanu).
male(bhishma).
male(parashara).
male(chitrangada).
male(vichitravirya).

male(vyasa).

male(pandu).
male(dhritarashtra).
male(vidura).

male(yudhishtira).
male(bhima).
male(arjuna).
male(nakula).
male(sahadeva).
male(vyasa).

male(karna).

male(dharma).
male(vayu).
male(indra).
male(surya).

male(duryodhana).
male(dushasana).
male(vikarna).
male(sukarna).

female(sarah).
female(milcah).
female(yiscah).
female(rebecca).
female(rachel).


female(ganga).

female(satyavati).

female(amba).
female(ambika).
female(ambalika).

female(gandhari).
female(kunti).
female(madri).


%%%% father/2 --
%%%% father(X, Y) means 'X is father of Y'.

father(terach, abraham).
father(terach, nachor).
father(terach, haran).
father(abraham, isaac).
father(haran, lot).
father(haran, milcah).
father(haran, yiscah).
father(nachor, bethuel).
father(isaac, esau).
father(isaac, jacob).
father(jacob, benjamin).
father(jacob, joseph).

father(shantanu, bhishma).
father(shantanu, chitrangada).
father(shantanu, vichitravirya).

father(parashara, vyasa).

father(vyasa, dhritarashtra).
father(vyasa, pandu).
father(vyasa, vidura).

father(dharma, yudhistira).
father(dharma, bhima).
father(dharma, arjuna).

father(vayu, yudhistira).
father(vayu, bhima).
father(vayu, arjuna).

father(indra, yudhistira).
father(indra, bhima).
father(indra, arjuna).

father(ashwini, sahadeva).
father(ashwini, nakula).

father(dhritarashtra, duryodhana).
father(dhritarashtra, dushasana).
father(dhritarashtra, vikarna).
father(dhritarashtra, sukarna).

father(surya, karna).


%%%% mother/2
%%%% mother(X, Y) means 'X is mother of Y'.

mother(sarah, isaac).
mother(rebecca, esau).
mother(rebecca, jacob).
mother(rachel, benjamin).
mother(rachel, joseph).
mother(milcah, bethuel).

mother(satyavati, vyasa).

mother(ambika, dhritarashtra).
mother(ambalika, pandu).
mother('ambalika and ambika\'s maid', vidura).

mother(kunti, yudhishtira).
mother(kunti, bhima).
mother(kunti, arjuna).
mother(kunti, karna).

mother(madri, nakula).
mother(madri, sahadeva).

mother(gandhari, duryodhana).
mother(gandhari, dushasana).
mother(gandhari, vikarna).
mother(gandhari, sukarna).


%%%% parent/2
%%%% parent(X, Y) means 'X is parent of Y'.

parent(X, Y) :- father(X, Y).
parent(X, Y) :- mother(X, Y).


%%%% ancestor/2
%%%% ancestor(X, Y) means 'X is an ancestor of Y'.

ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).


%%%% descendant/2
%%%% descendant(X, Y) means 'X is a descendent of Y'.

descendant(X, Y) :- ancestor(Y, X).


%%%% sibling/2
%%%% sibling(X, Y) means 'X is a brother or sister of Y'.

sibling(X, Y) :-
	parent(Z, X),
	parent(Z, Y),
	X \= Y.

sister(X, Y) :- sibling(X, Y), female(X).
brother(X, Y) :- sibling(X, Y), male(X).

uncle(X, Y) :- brother(X, Z), parent(Z, Y).
aunt(X, Y) :- sister(X, Z), parent(Z, Y).


%%%% end of file -- family.pl --
