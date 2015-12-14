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

piece_lyon(X):-
			piece(X,_,lyon).


/* 2.2 : Projection */

piece_info(X,Y):-
			piece(_,X,Y).

			

/* Definition du predicat non */

non(P) :- P, !, fail.
non(P).
			
/* 2.3 : Union, intersection et différence ensembliste */

union(Nom,Ville) :-
    demandeFournisseur(Nom,Ville).

union(Nom,Ville) :-
    fournisseurReference(_,Nom,Ville),
    non(demandeFournisseur(Nom,Ville)).
	
/* Test

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

diffEnsembliste(Nom,Ville) :-
    demandeFournisseur(Nom,Ville),
    non(fournisseurReference(_,Nom,Ville)).

/* Test
diffEnsembliste(V,N).

V = dupon
N = lille
Yes (0.00s cpu, solution 1, maybe more) ? ;
No
*/

/* 2.4 : Produit cartésien */
prodCartesien(F1,Nom,Ville,F2,Piece,Qte):-
	fournisseurReference(F1, Nom, Ville),
	livraison(F2,Piece,Qte).
	
	
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

jointure(F1,Nom,Ville,Piece,Qte):-
	prodCartesien(F1,Nom,Ville,F1,Piece,Qte).

/* Test
*/

jointure_plus350(F1,Nom,Ville,Piece,Qte):-
    prodCartesien(F1,Nom,Ville,F1,Piece,Qte),
    <(350,Qte).
	
/* Test jointure_plus350
?- jointure_plus350(F,Nom,Ville,Piece,Qte).
F = f4,
Nom = michel,
Ville = clermontFerrand,
Piece = p4,
Qte = 400 ;
F = f6,
Nom = brown,
Ville = marseille,
Piece = p5,
Qte = 500 ;
F = f6,
Nom = brown,
Ville = marseille,
Piece = p6,
Qte = 1000 ;
false.	*/

/* 2.6 division(-NumF)  */

division(NumF) :-
	findall(P,piece_lyon(P),ListePieceLyon),
	division2(ListePieceLyon,NumF).
division2([],_).
division2([Tete|Reste], NumF) :-
    livraison(NumF,Tete,_),
    division2(Reste,NumF).
  
/* Test division 

division(A).
A = f1 ;
A = f4.

*/  

/* 2.7 totalPiece(-Total,-NumF) */

sommeListe([],0).
sommeListe([Tete|Reste],Total) :-
	sommeListe(Reste,Total2),
	Total is Tete+Total2.

totalPiece(Total,NumF) :-
	fournisseurReference(NumF,_,_),
	findall(Qte,livraison(NumF,_,Qte),ListeQte),
	sommeListe(ListeQte,Total).

/* Test totalPiece 

sommeListe([1,2,4],A).
A = 7.

totalPiece(A,B).
A = 600,
B = f1 ;
A = 200,
B = f2 ;
A = 200,
B = f3 ;
A = 1000,
B = f4 ;
A = 0,
B = f5 ;
A = 1800,
B = f6.

*/
% ============================================================================= 
% SECTION 3 : Au delà de l’algèbre relationnelle
% ============================================================================= 





/*
===============================================================================
===============================================================================
 Tests
===============================================================================
*/

