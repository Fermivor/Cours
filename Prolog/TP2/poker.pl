/*
 * TP2 - Manipulation de termes contruits
 * 
 * @author Florentin Hortet
 *@author Etienne Geantet
 *@version Annee scolaire 2015/2016
 * 
 * 
 */
% ==============================================================================
% ============================================================================== 
%	["/home-reseau/fhortet/Prolog/Cours/Prolog/TP2/poker.pl"].
% ============================================================================== 
/*
	hauteur(Valeur)
*/
hauteur(deux).
hauteur(trois).
hauteur(quatre).
hauteur(cinq).
hauteur(six).
hauteur(sept).
hauteur(huit).
hauteur(neuf).
hauteur(dix).
hauteur(valet).
hauteur(dame).
hauteur(roi).
hauteur(as).

/*
	couleur(Valeur)
*/
couleur(trefle).
couleur(carreau).
couleur(coeur).
couleur(pique).

/*
	succ_hauteur(H1, H2)
*/
succ_hauteur(deux, trois).
succ_hauteur(trois, quatre).
succ_hauteur(quatre, cinq).
succ_hauteur(cinq, six).
succ_hauteur(six, sept).
succ_hauteur(sept, huit).
succ_hauteur(huit, neuf).
succ_hauteur(neuf, dix).
succ_hauteur(dix, valet).
succ_hauteur(valet, dame).
succ_hauteur(dame, roi).
succ_hauteur(roi, as).

/*
	succ_couleur(C1, C2)
*/
succ_couleur(trefle, carreau).
succ_couleur(carreau, coeur).
succ_couleur(coeur, pique).

/*
  carte_test
  cartes pour tester le pr�dicat EST_CARTE
*/

carte_test(c1,carte(sept,trefle)).
carte_test(c2,carte(neuf,carreau)).
carte_test(ce1,carte(7,trefle)).
carte_test(ce2,carte(sept,t)).

/* 
	main_test(NumeroTest, Main) 
	mains pour tester le pr�dicat EST_MAIN 
*/

main_test(main_triee_une_paire, main(carte(sept,trefle), carte(valet,coeur), carte(dame,carreau), carte(dame,pique), carte(roi,pique))).
% attention ici m2 repr�sente un ensemble de mains	 
main_test(m2, main(carte(valet,_), carte(valet,coeur), carte(dame,carreau), carte(roi,coeur), carte(as,pique))).
main_test(main_triee_deux_paires, main(carte(valet,trefle), carte(valet,coeur), carte(dame,carreau), carte(roi,coeur), carte(roi,pique))).
main_test(main_triee_brelan, main(carte(sept,trefle), carte(dame,carreau), carte(dame,coeur), carte(dame,pique), carte(roi,pique))).	
main_test(main_triee_suite,main(carte(sept,trefle),carte(huit,pique),carte(neuf,coeur),carte(dix,carreau),carte(valet,carreau))).
main_test(main_triee_full,main(carte(deux,coeur),carte(deux,pique),carte(quatre,trefle),carte(quatre,coeur),carte(quatre,pique))).

main_test(merreur1, main(carte(sep,trefle), carte(sept,coeur), carte(dame,pique), carte(as,trefle), carte(as,pique))).
main_test(merreur2, main(carte(sep,trefle), carte(sept,coeur), carte(dame,pique), carte(as,trefle))).

% ============================================================================= 
%        QUESTION 1 : est_carte(carte(Hauteur,Couleur))
% ==============================================================================

est_carte(carte(H,C)):-
		hauteur(H),
		couleur(C).

% ============================================================================= 
%	QUESTION 2 : est_main(main(C1,C2,C3,C4,C5))
% ============================================================================= 

est_main(main(C1,C2,C3,C4,C5)):-
		est_carte(C1),
		est_carte(C2),
		est_carte(C3),
		est_carte(C4),
		est_carte(C5),
		\==(C1,C2),
		\==(C1,C3),
		\==(C1,C4),
		\==(C1,C5),
		\==(C2,C3),
		\==(C2,C4),
		\==(C2,C5),
		\==(C3,C4),
		\==(C3,C5),
		\==(C4,C5).


% ==============================================================================
%       QUESTION 3 : inf_carte(C1,C2) 
% ============================================================================= 

inf_hauteur(H1,H2):-
		succ_hauteur(H1,H2).
inf_hauteur(H1,H2):-
		succ_hauteur(H1,H3),
		inf_hauteur(H3,H2).
		
inf_couleur(C1,C2):-
		succ_couleur(C1,C2).
inf_couleur(C1,C2):-
		succ_couleur(C1,C3),
		inf_couleur(C3,C2).
		
inf_carte(carte(H1,C1),carte(H2,C2)):-
	inf_hauteur(H1,H2),
	couleur(C1),
	couleur(C2).
inf_carte(carte(H1,C1),carte(H1,C2)):- 
	inf_couleur(C1,C2).
		


% ==============================================================================
%       QUESTION 4 : est_main_triee(main(C1,C2,C3,C4,C5))
% ==============================================================================

est_main_triee(main(C1,C2,C3,C4,C5)):-
	inf_carte(C1,C2),
	inf_carte(C2,C3),
	inf_carte(C3,C4),
	inf_carte(C4,C5).



/* A partir de maintenant, on suppose que les mains sont tri�es. */
% ==============================================================================
%       QUESTION 5 : une_paire(main(C1,C2,C3,C4,C5))
% ==============================================================================

une_paire(main(carte(H,_),carte(H,_),_,_,_)).
une_paire(main(_,carte(H,_),carte(H,_),_,_)).
une_paire(main(_,_,carte(H,_),carte(H,_),_)).
une_paire(main(_,_,_,carte(H,_),carte(H,_))).



% ==============================================================================
%       QUESTION 6 : deux_paires(main(C1,C2,C3,C4,C5))
% ==============================================================================

deux_paires(main(carte(H,_),carte(H,_),carte(H2,_),carte(H2,_),_)).
deux_paires(main(carte(H,_),carte(H,_),_,carte(H2,_),carte(H2,_))).
deux_paires(main(_,carte(H,_),carte(H,_),carte(H2,_),carte(H2,_))).


% ============================================================================= 
%       QUESTION 7 : 
% ============================================================================= 

/* Comme la main est tri�e, si deux cartes ont la m�me hauteur avec une carte entre elles, la carte du milieu aura forcement la m�me hauteur. */
brelan(main(carte(H,_),_,carte(H,_),_,_)).
brelan(main(_,carte(H,_),_,carte(H,_),_)).
brelan(main(_,_,carte(H,_),_,carte(H,_))).


% ============================================================================= 
%       QUESTION 8 : suite(main(C1,C2,C3,C4,C5))
% ==============================================================================

suite(main(carte(H1,_),carte(H2,_),carte(H3,_),carte(H4,_),carte(H5,_))):-
			succ_hauteur(H1,H2),
			succ_hauteur(H2,H3),
			succ_hauteur(H3,H4),
			succ_hauteur(H4,H5).

% ============================================================================= 
%       QUESTION 9 : full(main(C1,C2,C3,C4,C5))
% ============================================================================= 

full(main(carte(H1,_),carte(H1,_),carte(H2,_),carte(H2,_),carte(H2,_))):-
					\==(H1,H2).
full(main(carte(H1,_),carte(H1,_),carte(H1,_),carte(H2,_),carte(H2,_))):-
					\==(H1,H2).


% ==============================================================================

/* TESTS QUESTION 1 : carte_test

est_carte(carte(valet,trefle)).

	Yes (0.00s cpu)

est_carte(carte(valet,geranium)).

	No (0.00s cpu)
*/

% ============================================================================= 

/*  TESTS QUESTION 2 : est_main

est_main(main(C1,C2,C3,C4,C5)).

	C1 = carte(deux, trefle)
	C2 = carte(deux, carreau)
	C3 = carte(deux, coeur)
	C4 = carte(deux, pique)
	C5 = carte(trois, trefle)
	Yes (0.01s cpu, solution 1, maybe more) ? ;

est_main(main(carte(deux,carreau),C2,C3,C4,carte(deux,pique))).

	C2 = carte(deux, trefle)
	C3 = carte(deux, coeur)
	C4 = carte(trois, trefle)
	Yes (0.00s cpu, solution 1, maybe more) ? 

est_main(main(carte(deux,carreau),C2,C3,C4,carte(deux,carreau))).

	No (0.02s cpu)

est_main(main(carte(deux,carreau),C2,C3,C4,carte(deux,geranium))).

	No (0.03s cpu)

*/

% ============================================================================= 

/* TESTS QUESTION 3

inf_carte(carte(deux,_),carte(trois,_)).

	Yes (0.00s cpu, solution 1, maybe more) ? 

inf_carte(carte(deux,_),carte(trois,sloubi)).

	No (0.00s cpu)

inf_carte(carte(deux,_),carte(trois,sloubi)).

	No (0.00s cpu)

inf_carte(carte(deux,_),carte(deux,sloubi)).

	No (0.00s cpu)

inf_carte(carte(deux,carreau),carte(deux,pique)).

	Yes (0.00s cpu, solution 1, maybe more) ? 

inf_carte(carte(deux,coeur),carte(deux,carreau)).

	No (0.00s cpu)


*/

% ==============================================================================


/* TESTS QUESTION 4


est_main_triee(main(carte(deux,carreau),carte(deux,pique),carte(trois,_),carte(valet,coeur),carte(valet,pique))).

	Yes (0.00s cpu, solution 1, maybe more) ? 

est_main_triee(main(C1,C2,C3,C4,C5)).

	C1 = carte(deux, couleur(_205))
	C2 = carte(trois, couleur(_210))
	C3 = carte(cinq, couleur(_218))
	C4 = carte(sept, couleur(_226))
	C5 = carte(neuf, couleur(_234))
	Yes (0.01s cpu, solution 55, maybe more) ?

est_main_triee(main(carte(trois,trefle),C2,carte(as,coeur),C4,carte(valet,pique))).

	No (0.00s cpu)

est_main_triee(main(carte(trois,trefle),C2,carte(cinq,coeur),C4,carte(valet,pique))).

	C2 = carte(quatre, trefle)
	C4 = carte(six, trefle)
	Yes (0.00s cpu, solution 1, maybe more) ? 


*/

% ============================================================================= 

/* TESTS QUESTION 5

une_paire(main(C1,C2,C3,C4,C5)).

	C1 = carte(_202, _203)
	C2 = carte(_202, _206)
	C3 = C3
	C4 = C4
	C5 = C5
	Yes (0.00s cpu, solution 1, maybe more) ? ;

	C1 = C1
	C2 = carte(_202, _203)
	C3 = carte(_202, _206)
	C4 = C4
	C5 = C5
	Yes (0.00s cpu, solution 2, maybe more) ? ;

	C1 = C1
	C2 = C2
	C3 = carte(_202, _203)
	C4 = carte(_202, _206)
	C5 = C5
	Yes (0.00s cpu, solution 3, maybe more) ? ;

	C1 = C1
	C2 = C2
	C3 = C3
	C4 = carte(_202, _203)
	C5 = carte(_202, _206)
	Yes (0.00s cpu, solution 4, maybe more) ? ;


une_paire(main(carte(deux,coeur),carte(deux,pique),C3,C4,C5)).

	C3 = C3
	C4 = C4
	C5 = C5
	Yes (0.00s cpu, solution 1, maybe more) ? 

une_paire(est_main_triee(main(carte(deux,coeur),C2,C3,C4,carte(deux,pique)))).

	No (0.00s cpu)

*/

% ==============================================================================

/* TESTS QUESTION 6

deux_paires(main(C1,C2,C3,C4,C5)).

C1 = carte(_202, _203)
C2 = carte(_202, _206)
C3 = carte(_208, _209)
C4 = carte(_208, _212)
C5 = C5
Yes (0.00s cpu, solution 1, maybe more) ? 



*/

% ==============================================================================


/* TESTS QUESTION 7

brelan(main(C1,C2,C3,C4,C5)).

	C1 = carte(_202, _203)
	C2 = C2
	C3 = carte(_202, _206)
	C4 = C4
	C5 = C5
	Yes (0.00s cpu, solution 1, maybe more) ? ;

	C1 = C1
	C2 = carte(_202, _203)
	C3 = C3
	C4 = carte(_202, _206)
	C5 = C5
	Yes (0.00s cpu, solution 2, maybe more) ? ;

	C1 = C1
	C2 = C2
	C3 = carte(_201, _202)
	C4 = C4
	C5 = carte(_201, _205)
	Yes (0.00s cpu, solution 3)

brelan((main(carte(deux,trefle),carte(deux,coeur),carte(trois,pique),carte(quatre,pique),C5))).

	No (0.00s cpu)


*/

% ==============================================================================

/* TESTS QUESTION 8
suite(main(carte(deux,coeur),carte(trois,pique),carte(quatre,pique),carte(cinq,coeur),C5)).

	C5 = carte(six, _210)
	Yes (0.00s cpu)

suite(main(carte(deux,coeur),carte(trois,pique),carte(quatre,pique),carte(cinq,coeur),carte(valet,coeur))).

	No (0.00s cpu)


*/

% ============================================================================= 

/* TESTS QUESTION 9
full(main(C1,C2,C3,C4,C5)).

	C1 = carte(_202, _203)
	C2 = carte(_202, _206)
	C3 = carte(_208, _209)
	C4 = carte(_208, _212)
	C5 = carte(_208, _215)
	Yes (0.00s cpu, solution 1, maybe more) ? ;

	C1 = carte(_201, _202)
	C2 = carte(_201, _205)
	C3 = carte(_201, _208)
	C4 = carte(_210, _211)
	C5 = carte(_210, _214)
	Yes (0.00s cpu, solution 2)

full(main(carte(six,carreau),carte(six,coeur),carte(six,pique),carte(sept,coeur),carte(sept,pique))).

	Yes (0.00s cpu)

*/
