/**
TP 4 Arbres binaires - Prolog


@author Etienne GEANTET
@author Florentin HORTET
@version Annee scolaire 2015/2016


cd /home-info/commun/4info/Eclipse/eclipse_prolog/bin/x86_64_linux$
rlwrap ./eclipse
["/home-reseau/egeantet/Cours/Prolog/TP4/arbre.pl"].
*/

/*
-------------------------------------------------------------------------------
 Arbres
-------------------------------------------------------------------------------
*/

% Quelques arbres à copier coller pour vous faire gagner du temps, mais
% n'hésitez pas à en définir d'autres

/*
arb_bin(1, arb_bin(2, arb_bin(6, vide, vide), vide), arb_bin(3, arb_bin(4, vide, vide), arb_bin(5, vide, vide)))

arb_bin(3, arb_bin(4, vide, vide), arb_bin(5, vide, vide))

arb_bin(3, arb_bin(4, vide, vide), arb_bin(5, 7, vide))

arb_bin(3, arb_bin(4, vide, vide), arb_bin(5, arb_bin(6, vide, vide), arb_bin(7, vide, vide)))

arb_bin(3, arb_bin(5, arb_bin(6, vide, vide), arb_bin(7, vide, vide)), arb_bin(4, vide, vide))

arb_bin(3, arb_bin(6, vide, vide), arb_bin(5, arb_bin(4, vide, vide), arb_bin(7, vide, vide)))

arb_bin(8, arb_bin(4, arb_bin(2, vide, vide), arb_bin(6, vide, vide)), arb_bin(12, arb_bin(10, vide, vide), vide))

arb_bin(8, arb_bin(4, arb_bin(2, _, _), arb_bin(6, _, _)), arb_bin(12, arb_bin(10, _, _), _))

arb_bin(6,arb_bin(2,arb_bin(1,vide,vide),arb_bin(4,vide,vide)),arb_bin(8,vide,arb_bin(10,vide,vide)))

arb_bin(8,arb_bin(2,arb_bin(1,vide,vide),arb_bin(4,vide,vide)),arb_bin(6,vide,arb_bin(10,vide,vide)))

arb_bin(6,arb_bin(2,arb_bin(1,vide,vide),arb_bin(4,vide,vide)),arb_bin(8,arb_bin(2,arb_bin(1,vide,vide),arb_bin(4,vide,vide)),arb_bin(10,vide,vide)))

*/

/*
-------------------------------------------------------------------------------
 Définition des prédicats
-------------------------------------------------------------------------------
*/

/* arbre_binaire(+B) qui réussit si B est un arbre binaire d’en-
tiers. */

arbre_binaire(vide).
arbre_binaire(arb_bin(Feuille,vide,vide)):-
		integer(Feuille).
arbre_binaire(arb_bin(Racine,Gauche,Droite)):-
		integer(Racine),
		arbre_binaire(Gauche),
		arbre_binaire(Droite),
		!.


/* Test arbre_binaire

arbre_binaire(arb_bin(1, arb_bin(2, arb_bin(6, vide, vide), vide), arb_bin(3, arb_bin(4, vide, vide), arb_bin(5, vide, vide)))).

Yes (0.00s cpu) 

arbre_binaire(arb_bin(1, arb_bin(2, arb_bin(6, vide, vide), vide), arb_bin(3, arb_bin(4, vide, vide), arb_bin(5, vide, geranium)))).

No (0.00s cpu)
*/

/* dans_arbre_binaire(+E, +B) qui réussit si E est l’une des étiquettes de l’arbre binaire B. */
/* on suppose que l'on a un arbre binaire */

dans_arbre_binaire(E,arb_bin(E,G,D)).
dans_arbre_binaire(E,arb_bin(R,G,D)):-
		dans_arbre_binaire(E,G).
dans_arbre_binaire(E,arb_bin(R,G,D)):-
		dans_arbre_binaire(E,D).


/* Test dans_arbre_binaire

dans_arbre_binaire(geranium,arb_bin(1, arb_bin(2, arb_bin(6, vide, vide), vide), arb_bin(3, arb_bin(4, vide, vide), arb_bin(1, vide, vide)))).

No (0.00s cpu)

dans_arbre_binaire(1,arb_bin(1, arb_bin(2, arb_bin(6, vide, vide), vide), arb_bin(3, arb_bin(4, vide, vide), arb_bin(1, vide, vide)))).

Yes (0.00s cpu, solution 1, maybe more) ? ;

Yes (0.00s cpu, solution 2, maybe more) ? ;
*/

/* sous_arbre_binaire(+S, +B) qui réussit si S est un sous-arbre de B. */

sous_arbre_binaire(arb_bin(R1,G1,D1),arb_bin(R1,G1,D1)).
sous_arbre_binaire(arb_bin(R1,G1,D1),arb_bin(R2,G2,D2)):-
	sous_arbre_binaire(arb_bin(R1,G1,D1),G2).
sous_arbre_binaire(arb_bin(R1,G1,D1),arb_bin(R2,G2,D2)):-
	sous_arbre_binaire(arb_bin(R1,G1,D1),D2).

/* Test sous_arbre_binaire

sous_arbre_binaire(arb_bin(2, arb_bin(6, vide, vide), vide),arb_bin(1, arb_bin(2, arb_bin(6, vide, vide), vide), arb_bin(3, arb_bin(4, vide, vide), arb_bin(5, vide, vide)))).

Yes (0.00s cpu, solution 1, maybe more) ? ;

*/

/* remplacer(+SA1, +SA2, +B, -B1) où B1 est l’arbre B dans lequel toute occurrence du sous-arbre SA1 est remplacée par le sous-arbre SA2.*/

remplacer(S1,S2,vide,vide).
remplacer(SA1,SA2,SA1,SA2).
remplacer(SA1,SA2,arb_bin(R,SA1,D),arb_bin(R,SA2,D)).
remplacer(SA1,SA2,arb_bin(R,G,SA1),arb_bin(R,G,SA2)).
remplacer(SA1,SA2,arb_bin(R,G,D),arb_bin(R1,G1,D1)):-
	remplacer(SA1,SA2,G,G1),
	remplacer(SA1,SA2,D,D1).

remplacer(arb_bin(1,arb_bin(2,vide,vide),arb_bin(3,vide,vide)),arb_bin(4,vide,vide),arb_bin(0,arb_bin(5,vide,vide),arb_bin(1,arb_bin(2,vide,vide))),L).

