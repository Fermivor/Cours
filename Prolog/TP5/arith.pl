
/*
TP 5 Arithmétique - Prolog 


@author Etienne GEANTET
@author Florentin HORTET
@version Annee scolaire 2015-2016


cd /home-info/commun/4info/Eclipse/eclipse_prolog/bin/x86_64_linux$
rlwrap ./eclipse
 ["/home-reseau/fhortet/Cours/Prolog/TP5/arith.pl"].
*/



/* 1 Arithmétique de Peano */

/* predicat add */
add(zero,X,X).
add(s(X),Y,s(Sum)):-
	add(X,Y,Sum).

/* Test add

add(X,Y,s(s(zero))).

X = zero
Y = s(s(zero))
Yes

X = s(zero)
Y = s(zero)
Yes

X = s(s(zero))
Y = zero
Yes
*/

/* predicat sub */
sub(Op1,zero,Op1).
sub(s(Op1),s(Op2),Sum):-
	sub(Op1,Op2,Sum).

/* Test sub 
sub(s(s(s(zero))),s(zero),Sum).

Sum = s(s(zero))
Yes

sub(s(s(s(zero))),s(s(zero)),Sum).

Sum = s(zero)
Yes

sub(s(s(s(zero))),s(s(s(zero))),Sum).

Sum = zero
Yes 

sub(s(s(s(zero))),s(s(s(s(zero)))),Sum).

No
*/

/* predicat produit */

prod(zero,X,zero).
prod(X,zero,zero).
prod(s(X),Y,Prod):-
	prod(X,Y,Prod2),
	add(Prod2,Y,Prod).

/* test prod 

prod(s(s(zero)),s(zero),X).

X = s(s(zero))
Yes 

prod(s(s(zero)),s(s(zero)),X).

X = s(s(s(s(zero))))
Yes 

prod(s(s(zero)),zero,X).

X = zero
Yes

*/


/* predicat factoriel */

factorial(zero,s(zero)).
factorial(s(N),F):-
	factorial(N,F2),
	prod(s(N),F2,F).
	

/* Test factorial 

factorial(s(s(s(zero))),F).

F = s(s(s(s(s(s(zero))))))
Yes

factorial(zero,F).

F = s(zero)
Yes

*/

/*******************************/
/*******************************/
/* 2 Binary representation */
add_bit(0, 0, 0, 0, 0).
add_bit(0, 0, 1, 1, 0).
add_bit(0, 1, 0, 1, 0).
add_bit(0, 1, 1, 0, 1).
add_bit(1, 0, 0, 1, 0).
add_bit(1, 0, 1, 0, 1).
add_bit(1, 1, 0, 0, 1).
add_bit(1, 1, 1, 1, 1).

/* predicat add_bin(?X,?Y,?Z) : somme de deux entiers en représentation binaire */
add_bin(X,Y,Z) :-
	add_bin(X,Y,Z,0). % on met la retenu à zero
add_bin([],Y,Y,0).
add_bin(X,[],X,0) :-
	\==(X,[]).

add_bin([],[],Res,1) :-
	add_bin([1],[0],Res,0).

add_bin([],Y,Res,1) :-
	\==(Y,[]),
	add_bin([1],Y,Res,0).

add_bin(X,[],Res,1) :-
	\==(X,[]),
	add_bin(X,[1],Res,0).

add_bin([Elem1|Rest1],[Elem2|Rest2],[Res|Suite],CarryIn):-
	add_bit(Elem1,Elem2,CarryIn,Res,CarryOut),
	add_bin(Rest1,Rest2,Suite,CarryOut).

/* predicat sub_bin(?X,Y,?Z) : différence de deux entiers en représentation binaire */
sub_bin(X,Y,Z) :- 
	add_bin(Z,Y,X).
/* Test sub_bin
sub_bin([0,1,1],[1],X).
X = [1, 0, 1]
*/

/* predicat prod_bin(+X,+Y,-Z) : produit de deux entiers en représentation binaire */
prod_bit(0,_,[]).
prod_bit(1,Res,Res).

prod_bin([],_,[]).

prod_bin([Elem|Rest],Y,Z) :-
	prod_bit(Elem,Y,Res),
	prod_bin(Rest,Y,Tmp),
	add_bin(Res,[0|Tmp],Z).
/* Test prob_bin
prod_bin([],[1,1,1],X).
X = []

prod_bin([0,1],[1,1],X).
X = [0, 1, 1]

prod_bin([0,1,1],[1,1,1],X).
X = [0, 1, 0, 1, 0, 1]
*/


/* predicat factorial_bin(+N,-Fact) : factoriel d'un entier en représentation binaire */
factorial_bin([],[1]). 				%On ne sait pas comment matcher de façon générale avec [0],[0,0], etc.

factorial_bin(N,Fact) :-
	sub_bin(N,[1],Res),
	factorial_bin(Res,FactInt),
	prod_bin(N,FactInt,Fact).
/* Test factorial_bin
factorial_bin([0,0,1],X).
X = [0, 0, 0, 1, 1]

factorial_bin([0,0,1],X).
X = [0, 0, 0, 1, 1] = 24

factorial_bin([],X).
X = [1]
*/

/* factorialIs(+N,-Fact) : factorielle d'un entier avec utilisation du prédicat is */

factorialIs(0,1).
factorialIs(N,Fact) :-
	N>0,
	S is N-1,
	factorialIs(S,Temp),
	Fact is N*Temp.
/* Test factorialIs
factorialIs(6,X).
X = 720

factorialIs(0,X).
X = 1
*/

	
	
/* Optional part */
evaluate_numbers(N1, M1, N2, M2) :-
        evaluate(N1, N2),
        evaluate(M1, M2),
        number(N2),
        number(M2).        

evaluate(N, N) :- number(N).

evaluate(add(N1, M1), N) :-
        evaluate_numbers(N1, M1, N2, M2),
        N is N2 + M2.

evaluate(sub(N1, M1), N) :-
        evaluate_numbers(N1, M1, N2, M2),
        N is N2 - M2.

evaluate(prod(N1, M1), N) :-
        evaluate_numbers(N1, M1, N2, M2),
        N is N2 * M2.

evaluate(eq(N1, M1), Res) :-
        evaluate_numbers(N1, M1, N2, M2),
        (
            N2 = M2, Res = t
        ;
            N2 \= M2, Res = f
        ).

evaluate(fun(X, Body), fun(X, Body)).
/* Test evaluate

evaluate(prod(6,5),X).
X = 30

evaluate(prod(sub(9,3),add(4,5)),X).
X = 54
*/

fresh_variables(Expr, Res) :-
       fresh_variables(Expr, [], Res).

fresh_variables(X, Assoc, Y) :-
        var(X),
        !,
        assoc(X, Assoc, Y).

fresh_variables(add(X1, Y1), Assoc, add(X2, Y2)) :-
        fresh_variables(X1, Assoc, X2),
        fresh_variables(Y1, Assoc, Y2).

fresh_variables(prod(X1, Y1), Assoc, prod(X2, Y2)) :-
        fresh_variables(X1, Assoc, X2),
        fresh_variables(Y1, Assoc, Y2).

fresh_variables(sub(X1, Y1), Assoc, sub(X2, Y2)) :-
        fresh_variables(X1, Assoc, X2),
        fresh_variables(Y1, Assoc, Y2).

fresh_variables(eq(X1, Y1), Assoc, eq(X2, Y2)) :-
        fresh_variables(X1, Assoc, X2),
        fresh_variables(Y1, Assoc, Y2).

fresh_variables(if(Cond1, X1, Y1), Assoc, if(Cond2, X2, Y2)) :-
        fresh_variables(Cond1, Assoc, Cond2),
        fresh_variables(X1, Assoc, X2),
        fresh_variables(Y1, Assoc, Y2).

fresh_variables(Number, _, Number) :- number(Number).

fresh_variables(fun(X, Body1), Assoc, fun(Y, Body2)) :-
        fresh_variables(Body1, [(X, Y) | Assoc], Body2).

fresh_variables(apply(Fun1, Param1), Assoc, apply(Fun2, Param2)) :-
        fresh_variables(Fun1, Assoc, Fun2),
        fresh_variables(Param1, Assoc, Param2).
        
%Fun = fun(N, fun(F, if(eq(N, 0), 1, prod(N, apply(apply(F, sub(N, 1)), F))))), Factorial = fun(N, apply(apply(Fun, N), Fun)), evaluate(apply(Factorial, 42), Res).
