/**
TP 7 Base de Données Déductives (BDD) - Prolog

@author Etienne GEANTET
@author Florentin HORTET
@version Annee scolaire 2015/2016
*/
/*
cd /home-info/commun/4info/Eclipse/eclipse_prolog/bin/x86_64_linux$
rlwrap ./eclipse
["/home-reseau/egeantet/Cours/Prolog/TP6/baseauto.pl"].
*/

/*
===============================================================================
===============================================================================
 Définition des prédicats
===============================================================================
*/
% ============================================================================= 
% SECTION 1 : Base de données
% ============================================================================= 

assemblage(voiture, porte, 4).
assemblage(voiture, roue, 4).
assemblage(voiture, moteur, 1).
assemblage(roue, jante, 1).
assemblage(porte, tole, 1).
assemblage(porte, vitre, 1).
assemblage(roue, pneu, 1).
assemblage(moteur, piston, 4).
assemblage(moteur, soupape, 16).

           
piece(p1, tole, lyon).
piece(p2, jante, lyon).
piece(p3, jante, marseille).
piece(p4, pneu, clermontFerrand).
piece(p5, piston, toulouse).
piece(p6, soupape, lille).
piece(p7, vitre, nancy).
piece(p8, tole, marseille).
piece(p9, vitre, marseille).

                  
demandeFournisseur(dupont, lyon).
demandeFournisseur(michel, clermontFerrand).
demandeFournisseur(durand, lille).
demandeFournisseur(dupond, lille).
demandeFournisseur(martin, rennes).
demandeFournisseur(smith, paris).
demandeFournisseur(brown, marseille).
          
          
fournisseurReference(f1, dupont, lyon).
fournisseurReference(f2, durand, lille).
fournisseurReference(f3, martin, rennes).
fournisseurReference(f4, michel, clermontFerrand).
fournisseurReference(f5, smith, paris).
fournisseurReference(f6, brown, marseille).

                  
livraison(f1, p1, 300).
livraison(f2, p2, 200).
livraison(f3, p3, 200).
livraison(f4, p4, 400).
livraison(f6, p5, 500).
livraison(f6, p6, 1000).
livraison(f6, p7, 300).
livraison(f1, p2, 300).
livraison(f4, p2, 300).
livraison(f4, p1, 300).


% ============================================================================= 
% SECTION 2 : Opération relationnelles
% ============================================================================= 

/* 2.1 : Sélection */

/*piece(X,Y,lyon).*/

/* Tests
X = p1
Y = tole
Yes (0.00s cpu, solution 1, maybe more) ? ;
X = p2
Y = jante
Yes
*/

/* 2.2 : Projection */

/*piece(_,X,Y).*/

/* Test
X = tole
Y = lyon
Yes

X = jante
Y = lyon
Yes

X = jante
Y = marseille
Yes 

X = pneu
Y = clermontFerrand
Yes
...
*/

/* 2.3 : Union, intersection et différence ensembliste */
union(N,V):-
	demandeFournisseur(N,V).
union(N,V):-
	fournisseurReference(_,N,V).
/* Test
union(T,Y).

T = dupont
Y = lyon
Yes (0.00s cpu, solution 1, maybe more) ? ;

T = michel
Y = clermontFerrand
Yes (0.00s cpu, solution 2, maybe more) ? ;

T = durand
Y = lille
Yes (0.00s cpu, solution 3, maybe more) ? ;

T = dupond
Y = lille
Yes (0.00s cpu, solution 4, maybe more) ? ;

T = martin
Y = rennes
Yes (0.00s cpu, solution 5, maybe more) ? ;

T = smith
Y = paris
Yes (0.00s cpu, solution 6, maybe more) ? ;

T = brown
Y = marseille
Yes (0.00s cpu, solution 7, maybe more) ? ;

T = dupont
Y = lyon
Yes (0.00s cpu, solution 8, maybe more) ? ;

T = durand
Y = lille
Yes (0.00s cpu, solution 9, maybe more) ? ;

T = martin
Y = rennes
Yes (0.00s cpu, solution 10, maybe more) ? ;

T = michel
Y = clermontFerrand
Yes (0.00s cpu, solution 11, maybe more) ? ;

T = smith
Y = paris
Yes (0.00s cpu, solution 12, maybe more) ? ;

T = brown
Y = marseille
Yes
*/


intersection(V,N):-
	demandeFournisseur(N,V),
	fournisseurReference(_,N,V).

/* Test
intersection(N,V).
N = dupont
V = lyon
Yes 

N = michel
V = clermontFerrand
Yes 

N = durand
V = lille
Yes 
...
*/

diffEnsembliste(N,V):-
	demandeFournisseur(N,V),
	fournisseurReference(_,N2,V2),
	\==(N,N2).
diffEnsembliste(N,V):-
	demandeFournisseur(N,V),
	fournisseurReference(_,N2,V2),
	\==(V,V2).
diffEnsembliste(N,V):-
	fournisseurReference(_,N,V),
	demandeFournisseur(N2,V2),
	\==(N,N2).
diffEnsembliste(N,V):-
	fournisseurReference(_,N,V),
	demandeFournisseur(N2,V2),
	\==(V,V2).


/* Test
diffEnsembliste(V,N).

V = dupon
N = lille
Yes (0.00s cpu, solution 1, maybe more) ? ;
No
*/

/* 2.4 : Produit cartésien */
prodCartesien(F1,N,V,F2,P,Q):-
	fournisseurReference(F1, N, V),
	livraison(F2,P,Q).
/* Test
prodCartesien(A,B,C,D,E,F).
...
A = f6
B = brown
C = marseille
D = f4
E = p1
F = 300
Yes (0.01s cpu, solution 60)
*/

/* 2.5 : Jointure */

jointure(F1,N,V,P,Q):-
	fournisseurReference(F1,N,V),
	livraison(F1,P,Q).


% ============================================================================= 
% SECTION 3 : Au delà de l’algèbre relationnelle
% ============================================================================= 





/*
===============================================================================
===============================================================================
 Tests
===============================================================================
*/
