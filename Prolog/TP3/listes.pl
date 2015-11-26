/**
TP Listes Prolog

@author Etienne GEANTET
@author Florentin HORTET
@version Annee scolaire 2015/2016
*/


%% Listes de test
%% exemple de syntaxe d'appel : l1(X),membre(1,X).
l1([0,1,2,3,4,5,6,7,8,9]).


%% membre (?A,+X) : A est élément de la liste X

membre(A,[A|_]).
membre(A,[_|R]):-
		membre(A,R).
		
%% compte(+A, +X, ?N) : N est le nombre d'occurences de A dans la liste X.

compte(_,[],0).
compte(Occ,[Occ|Rest],N):-
	compte(Occ,Rest,N2),
	N is N2+1.
compte(Occ,[_|Rest],N):-
	compte(Occ,Rest,N).