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
	not(member(likes(bess,dana),P)).
proposition3(P):-
	not(member(likes(cody,abby),P)).
	
p4([],_).
p4([likes(X,Y)|Rest],Monde):-	
	member(likes(Y,X),Monde),
	p4(Rest,Monde).
	
proposition4(P):-
	p4(P,P).
	
p5([],_).
p5([likes(X,bess)|Rest],Monde):-
	member(likes(abby,X),Monde),
	p5(Rest,Monde).
p5([likes(_,Y)|Rest],Monde) :-
	\==(Y,bess),
	p5(Rest,Monde).
	
proposition5(P):-
	p5(P,P).

p6([],_).
p6([likes(bess,X)|Reste],ListeLikes) :-
	member(likes(dana,X),ListeLikes),
	p6(Reste,ListeLikes).
p6([likes(Y,_)|Reste],ListeLikes) :-
	\==(Y,bess),
	p6(Reste,ListeLikes).
	
proposition6(ListeLikes) :-
	p6(ListeLikes,ListeLikes).

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

possible_worlds(Monde) :-
        make_all_pairs([abby, bess, cody, dana],Res),
        sub_list(Res,Monde),
        proposition1(Monde),
        proposition2(Monde),
        proposition3(Monde),
        proposition4(Monde),
        proposition5(Monde),
        proposition6(Monde),
        proposition7(Monde).

/*Question 1.6*/
test_possible_worlds :-
        possible_worlds(Monde),
        writeln(Monde),
        fail.
/*Question 1.7*/		
possible_worlds2(Monde) :-
        make_all_pairs([abby, bess, cody, dana],Res),
        sub_list(Res,Monde),
        proposition7(Monde),
        proposition4(Monde),
        proposition5(Monde),
        proposition6(Monde),
        proposition1(Monde),
        proposition2(Monde),
        proposition3(Monde).

test_possible_worlds2 :-
        possible_worlds2(World),
        writeln(World),
        fail.		

