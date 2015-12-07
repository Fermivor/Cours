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

/* 1 Quelques classiques sur les listes */
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
/* Test nieme

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

/* Nieme en (-,+,+) et (+,+,-)	donc (?,+,?) */
nieme2(1,[Elem|_], Elem).
nieme2(N,[_|Rest], A) :- 
	\==(N,1),
	nieme2(N1,Rest,A),
	N is N1+1.

/* Tests nieme2

5 ?- nieme2(A,[1,1,2,1],1).
A = 1 ;
A = 2 ;
A = 4 ;
false.

6 ?- nieme2(1,[1,1,2,1],1).
true ;
false.

7 ?- nieme2(1,[1,1,2,1],A).
A = 1 ;
false. */

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
conc3([],[FX|RX],Z,[FX|T]) :- conc3([],RX,Z,T).
conc3([FX|RX],Y,Z,[FX|T]) :- conc3(RX,Y,Z,T).

/* Tests conc3

 ?- conc3([1,2],[1,2],[3,4],T).
T = [1, 2, 1, 2, 3, 4] ;
false.

3 ?- conc3([1,2],[1,2],[3,4],[1,2,3,4]).
false.

4 ?- conc3(A,B,C,[1,2,3,4]).
A = B, B = [],
C = [1, 2, 3, 4] ;
A = [],
B = [1],
C = [2, 3, 4] ;
A = [],
B = [1, 2],
C = [3, 4] ;
A = [],
B = [1, 2, 3],
C = [4] ;
A = C, C = [],
B = [1, 2, 3, 4] ;
A = [1],
B = [],
C = [2, 3, 4] ;
A = [1],
B = [2],
C = [3, 4] ;
...

*/
/* On en était là après 2H */

/* debute_par(+X, ?Y) : la liste X débute par la liste Y . */

debute_par(_,[]).
debute_par([Elem|RX],[Elem|RY]) :- debute_par(RX,RY).

/* Test debute_par
 
8 ?- debute_par([1,2,3],A).
A = [] ;
A = [1] ;
A = [1, 2] ;
A = [1, 2, 3].

9 ?- debute_par([1,2,3],[1]).
true ;
false.

10 ?- debute_par([1,2,3],[3]).
false.

*/

/* sous_liste(+X, ?Y) : la liste Y est sous-liste de la liste X. */

sous_liste(L1, L2) :- debute_par(L1,L2).
sous_liste([_|RL1], L2) :- sous_liste(RL1,L2).

/* Tests sous_liste 

11 ?- sous_liste([1,2,3],[1]).
true ;
false.

12 ?- sous_liste([1,2,3],[2]).
true .

13 ?- sous_liste([1,2,3],[4]).
false.

14 ?- sous_liste([1,2,3],A).
A = [] ;
A = [1] ;
A = [1, 2] ;
A = [1, 2, 3] ;
A = [] ;
A = [2] ;
A = [2, 3] ;
A = [] ;
A = [3] ;
A = [].

*/

 /* elim(+X,-Y) : la liste X étant donnée, on construit la liste Y qui contient tous les éléments
de X une seule fois. */

elim(X,Y) :- elim(X,[],Y).
elim([],X,X).
elim([Elem|Rest],Acc,D) :- 
        hors_de(Elem, Acc),
        elim(Rest,[Elem|Acc],D).
elim([Elem|Rest],Acc,D) :-
        membre(Elem,Acc), 
        elim(Rest,Acc,D).

/* Tests elim 

15 ?- elim([1,2,3,4,4,4],A).
A = [4, 3, 2, 1] 

*/

/* – tri(+X,-Y) : la liste Y est le résultat du tri par ordre croissant de la liste d’entiers X. */

/* predicat auxiliaire */
inserer(E,[],[E]).
inserer(E,[Elem|Rest],[E,Elem|Rest]):-
        E=<Elem.
inserer(E,[Elem|RL1],[Elem|RL2]):-
        E>Elem,
        inserer(E,RL1,RL2).

/* test inserer 

16 ?- inserer(1,[1,2,3],L2).
L2 = [1, 1, 2, 3]
false.

17 ?- inserer(2,[1,2,3],L2).
L2 = [1, 2, 2, 3] ;
false.

18 ?- inserer(4,[1,2,3],L2).
L2 = [1, 2, 3, 4] ;
false. */

tri(L1,L2) :- tri(L1,[],L2).
tri([],List,List).
tri([Elem|RL1],Acc,Res):-
        inserer(Elem,Acc,ListTmp),
        tri(RL1,ListTmp,Res).
		
/* Tests tri 

19 ?- tri([1,4,5,2,6,3],A).
A = [1, 2, 3, 4, 5, 6] 

*/



/* 2 Modélisation des ensembles */

/* inclus(+X,+Y) : tous les éléments de l’ensemble X sont présents dans l’ensemble Y . */

inclus([],_).
inclus([Elem|RList],Y):-
        membre(Elem,Y),
        inclus(RList,Y).

/* Test inclus 

20 ?- inclus([1,2,3],[1,2,3,4]).
true ;
false.

21 ?- inclus([1,2,3],[1,3,4]).
false.
*/

/* non_inclus(+X,+Y) : au moins un élément de l’ensemble X est hors de l’ensemble Y . */

non_inclus([Elem|_],Y):-
        hors_de(Elem,Y),
        !.
non_inclus([Elem|Rest],Y):-
        membre(Elem,Y),
        non_inclus(Rest,Y).
		
/* Test non_inclus 

22 ?- non_inclus([1,2,3],[1,3,4]).
true ;
false.

23 ?- non_inclus([1,2,3],[1,2,3,4]).
false.

*/

/* union_ens(+X,+Y, ?Z) : Z est l’union ensembliste des ensembles X et Y . */

union_ens([],Y,Y).
union_ens(X,[],X).
union_ens([FL1|RL1],Y,[FL1|RL2]):-
        hors_de(FL1,Y),
        union_ens(RL1,Y,RL2).
union_ens([FL1|RL1],Y,Z):-
        membre(FL1,Y),
        union_ens(RL1,Y,Z).
/* test union_ens 

24 ?- union_ens([1,2,3],[1,2,3],A).
A = [1, 2, 3] ;
false.

25 ?- union_ens([1,2,3],[1,2,4],A).
A = [3, 1, 2, 4] ;
false.

26 ?- union_ens([1,2,3],[1,2,4],[1,2,3,4]).
false.

*/		