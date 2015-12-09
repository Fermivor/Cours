
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

/* predicat add */
addb(Op1,Op2,Sum):-add2(Op1,Op2,Sum,0).
add2([],N,N,0).
add2(N,[],N,0).
add2([],N,R,1):-
	add2([1],N,R,0).
add2(N,[],R,1):-
	add2(N,[1],R,0).
add2([FN1|RN1],[FN2|RN2],[R|Res],CI):-
	add_bit(FN1,FN2,CI,R,CO),
	add2(RN1,RN2,Res,CO).


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
