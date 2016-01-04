/*TP7 Mondes possibles
@author Florentin Hortet
@author Etienne Geantet
@version Annee scolaire 2015/2016




/home-info/commun/4info/Eclipse/eclipse_prolog/bin/x86_64_linux

["/home-reseau/egeantet/Cours/Prolog/TP7.pl"].

*/

/*Question 1.1*/

make_pairs(U,[],[]).
make_pairs(U,[X|Y],Res):-
	\==(U,X),
	make_pairs(U,Y,Res1),	
	append(Res1,[likes(U,X),likes(X,U)],Res).
make_pairs(U,[U|Y],Res):-
	make_pairs(U,Y,Res1),
	append(Res1,[likes(U,U)],Res).
    

make_all_pairs([],[]).
make_all_pairs([F|R],Res):-
	make_pairs(F,[F|R],Res1),
	make_all_pairs(R,Res2),
	append(Res1,Res2,Res).

/*Tests
make_all_pairs([1,2],Res).

Res = [likes(1, 2), likes(2, 1), likes(1, 1), likes(2, 2)]


make_all_pairs([1,2,3],Res).

Res = [likes(1, 3), likes(3, 1), likes(1, 2), likes(2, 1), likes(1, 1), likes(2, 3), likes(3, 2), likes(2, 2), likes(3, 3)]
*/	
	

/*Question 1.2*/

sub_list([],[]).
sub_list([F|R],[F|RS]):-
	sub_list(R,RS).
sub_list([_|R],RS):-
	sub_list(R,RS).
/* Tests
sub_list([1,2],Res).

Res = [1, 2]
Res = [1]
Res = [2]
Res = []


sub_list([1,2,3],Res).

Res = [1, 2, 3]
Res = [1, 2]
Res = [1, 3]
Res = [1]
Res = [2, 3]
Res = [2]
Res = [3]
Res = []
*/

/*Question 1.3*/

proposition1(P):-
	member(likes(dana,cody),P).
proposition2(P):-
	not(member(likes(bess,dana)),P).
proposition3(P):-
	not(member(likes(cody,abby)),P).
proposition4(P):-
	not(member(likes(X,Y)),P),
	not(member(likes(Y,X)),P).
proposition5(P):-
	member(likes(X,bess),P),
	member(likes(abby,X),P).
proposition6(P):-
	member(likes(bess,X),P),
	member(likes(dana,X),P).

p7([],_).
p7([likes(F,X)|Rest],Monde):-
	member(likes(F,_),Monde),
	member(likes(X,_),Monde),
	p7(Rest,Monde).
proposition7(P):-
	p7(P,P).
/* Tests	
proposition7([likes(abby,dana),likes(cody,abby),likes(bess,cody),likes(cody,bess)]).
No 

proposition7([likes(abby,dana),likes(cody,abby),likes(bess,cody),likes(dana,bess)]).
Yes 
*/

/*Question 1.4*/


