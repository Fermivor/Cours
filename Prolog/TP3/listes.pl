/*
TP Listes Prolog

@author Etienne GEANTET
@author Florentin HORTET
@version Annee scolaire 2015/2016


cd /home-info/commun/4info/Eclipse/eclipse_prolog/bin/x86_64_linux$
rlwrap ./eclipse
["/home-reseau/fhortet/Cours/Prolog/TP3/listes.pl"].
*/


/* Listes de test
exemple de syntaxe d'appel : l1(X),membre(1,X). */
l1([0,1,2,3,4,5,6,7,8,9]).
l2([0,1,2,1,4,5,6,7,1,9]).


/* membre (?A,+X) : A est élément de la liste X */

membre(A,[A|_]).
membre(A,[_|R]):-
	membre(A,R).
/* Tests membre

l1(A),membre(1,A).

A = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
Yes (0.00s cpu, solution 1, maybe more) ? ;
*/
		
/* compte(+A, +X, ?N) : N est le nombre d'occurences de A dans la liste X. */

compte(_,[],0).
compte(Occ,[Occ|Rest],N):-
	compte(Occ,Rest,N2),
	N is N2+1.
compte(Occ,[A|Rest],N):-
	\==(Occ,A),
	compte(Occ,Rest,N).
/* Tests compte
l1(A),compte(1,A,N).

A = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
N = 1
Yes


l2(A),compte(1,A,N).

A = [0, 1, 2, 1, 4, 5, 6, 7, 1, 9]
N = 3
Yes

l2(A),compte(1,A,3).

A = [0, 1, 2, 1, 4, 5, 6, 7, 1, 9]
Yes (solution 1, maybe more) 
No 

l2(A),compte(1,A,1).

No
*/

/* renverser(+X, ?Y) : Y est la liste X à l’envers. */

renverser(X,Y):-renv(X,[],Y).
renv([],Acc,Acc).
renv([X1|RX],Acc,Y):-renv(RX,[X1|Acc],Y).

/* Test renverser 

l2(A),renverser(A,B).

A = [0, 1, 2, 1, 4, 5, 6, 7, 1, 9]
B = [9, 1, 7, 6, 5, 4, 1, 2, 1, 0]
Yes (0.00s cpu)

renverser([1,2],[2,1]).

Yes (0.00s cpu)


*/

/* palind(+X) : X est une liste « palindrome ». */

palind(L):-
	renverser(L,RevL),
	pal(L,RevL).
pal([],[]).
pal([FL|RL],[FRevL|RRevL]):-
	==(FL,FRevL),
	pal(RL,RRevL).
/* Test palind
palind([1]).

Yes
palind([1,2,1]).

Yes
palind([1,2,2,1]).

Yes
palind([1,2,2]).

No
*/

/* nieme(+N,+X,-A) : A est l’élément de rang N dans la liste X. */
/* on suppose le N correct lors de l'appel*/

nieme(0,[Elem|RList],Elem).
nieme(Rang,[FList|RList],Elem):-
	R is Rang-1,
	nieme(R,RList,Elem).
/* Test niem

l1(A),nieme(3,A,E).
A = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
E = 3
Yes (solution 1, maybe more)
No

l2(A),nieme(3,A,E).
A = [0, 1, 2, 1, 4, 5, 6, 7, 1, 9]
E = 1
Yes 

l2(A),nieme(3,A,1).
A = [0, 1, 2, 1, 4, 5, 6, 7, 1, 9]
Yes

l2(A),nieme(3,A,2).
No
On est donc en (+,+,?) uniquement
*/

/* on suppose que l'élément recherché est dans la liste*/
niemedeux(Rang,L,Elem):-nieme2(Rang,0,L,Elem).
nieme2(N,N,[Elem|RL],Elem).
nieme2(Rang,N,[FL|RL],Elem):-
	Ran is N+1,
	\==(FL,Elem),
	nieme2(Rang,Ran,RL,Elem).
/* marche pas !!!!*/

/* hors_de(+A,+X) : A n’est pas élément de la liste X. */
hors_de(A,X):-not(membre(A,X)).

/* Tests hors_de

hors_de(1,[1,2,3]).
No

hors_de(23000,[1,2,3]).
Yes

hors_de(geranium,[1,2,3]).
Yes
*/

/* tous_diff(+X) : les éléments de la liste X sont tous différents. */
/* on suppose que la liste n'est pas vide*/
tous_diff([Flist]).
tous_diff([FList|RList]):-
		diff(FList,RList,RList).
diff(Elem,[],List):-
		tous_diff(List).
diff(Elem,[FList|RList],List):-
		\==(Elem,FList),
		diff(Elem,RList,List).	
/* Tests tous_diff

tous_diff([1,2,3]).
Yes

tous_diff([2,2,1]).
No

tous_diff([2,2,2]).
No
*/

/* conc3(+X,+Y,+Z, ?T) : T est la concaténation des listes X, Y et Z. */
conc3([],[],Z,Z).
conc3([],[Y|RY],Z):-



/* On en était là après 2H */
