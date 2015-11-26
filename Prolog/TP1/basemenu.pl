/*
 * TP1 - Interrogation style base de données
 * 
 * @author Florentin Hortet
 *@author Etienne Geantet
 *@version Annee scolaire 2015/2016
 * 
 * Première Partie : Base Menu
 * 
 */

/* Données */
hors_d_oeuvre(artichauts_Melanie).
hors_d_oeuvre(truffes_sous_le_sel).
hors_d_oeuvre(cresson_oeuf_poche).

viande(grillade_de_boeuf).
viande(poulet_au_tilleul).

poisson(bar_aux_algues).
poisson(saumon_oseille).

dessert(sorbet_aux_poires).
dessert(fraises_chantilly).
dessert(melon_en_surprise).

calories(artichauts_Melanie, 150).
calories(truffes_sous_le_sel, 202).
calories(cresson_oeuf_poche, 212).
calories(grillade_de_boeuf, 532).
calories(poulet_au_tilleul, 400).
calories(bar_aux_algues, 292).
calories(saumon_oseille, 254).
calories(sorbet_aux_poires, 223).
calories(fraises_chantilly, 289).
calories(melon_en_surprise, 122).

/* Travail à réaliser */

/*Question 1.1*/
/*
?-hors_d_oeuvre(H).

H = artichauts_Melanie
H = truffes_sous_le_sel
H = cresson_oeuf_poche

*/
/*
?-viande(V).

V = grillade_de_boeuf
V = poulet_au_tilleul

*/
/*
?-poisson(P).

P = bar_aux_algues
P = saumon_oseille

*/
/*
?-dessert(D).

P = sorbet_aux_poires
P = fraises_chantilly
P = melon_en_surprise

*/
/*
?-calories(ALIM,CAL).

ALIM = artichauts_Melanie,
CAL = 150
ALIM = truffes_sous_le_sel,
CAL = 202
ALIM = cresson_oeuf_poche,
CAL = 212
ALIM = grillade_de_boeuf,
CAL = 532
ALIM = poulet_au_tilleul,
CAL = 400
ALIM = bar_aux_algues,
CAL = 292
ALIM = saumon_oseille,
CAL = 254
ALIM = sorbet_aux_poires,
CAL = 223
ALIM = fraises_chantilly,
CAL = 289
ALIM = melon_en_surprise,
CAL = 122

*/

/*Question 1.2*/
/* 1) Un plat de resistance est un plat a base de viande ou de poisson */
plat_resistance(P):- viande(P).
plat_resistance(P):- poisson(P).

/*
P = grillade_de_boeuf
P = poulet_au_tilleul
P = bar_aux_algues
P = saumon_oseille
*/

/* 2) Un repas se compose d'un hors d'oeuvre, d'un plat et d'un dessert */
repas(H,P,D):- 
	hors_d_oeuvre(H),
	plat_resistance(P),
	dessert(D).

/*
D = sorbet_aux_poires,
H = artichauts_Melanie,
P = grillade_de_boeuf

D = fraises_chantilly,
H = artichauts_Melanie,
P = grillade_de_boeuf

D = melon_en_surprise,
H = artichauts_Melanie,
P = grillade_de_boeuf

D = sorbet_aux_poires,
H = artichauts_Melanie,
P = poulet_au_tilleul

D = fraises_chantilly,
H = artichauts_Melanie,
P = poulet_au_tilleul

D = melon_en_surprise,
H = artichauts_Melanie,
P = poulet_au_tilleul

D = sorbet_aux_poires,
H = artichauts_Melanie,
P = bar_aux_algues

D = fraises_chantilly,
H = artichauts_Melanie,
P = bar_aux_algues

D = melon_en_surprise,
H = artichauts_Melanie,
P = bar_aux_algues

D = sorbet_aux_poires,
H = artichauts_Melanie,
P = saumon_oseille

D = fraises_chantilly,
H = artichauts_Melanie,
P = saumon_oseille

D = melon_en_surprise,
H = artichauts_Melanie,
P = saumon_oseille

D = sorbet_aux_poires,
H = truffes_sous_le_sel,
P = grillade_de_boeuf

D = fraises_chantilly,
H = truffes_sous_le_sel,
P = grillade_de_boeuf

D = melon_en_surprise,
H = truffes_sous_le_sel,
P = grillade_de_boeuf

D = sorbet_aux_poires,
H = truffes_sous_le_sel,
P = poulet_au_tilleul

D = fraises_chantilly,
H = truffes_sous_le_sel,
P = poulet_au_tilleul

D = melon_en_surprise,
H = truffes_sous_le_sel,
P = poulet_au_tilleul

D = sorbet_aux_poires,
H = truffes_sous_le_sel,
P = bar_aux_algues
D = fraises_chantilly,
H = truffes_sous_le_sel,
P = bar_aux_algues

D = melon_en_surprise,
H = truffes_sous_le_sel,
P = bar_aux_algues

D = sorbet_aux_poires,
H = truffes_sous_le_sel,
P = saumon_oseille

D = fraises_chantilly,
H = truffes_sous_le_sel,
P = saumon_oseille

D = melon_en_surprise,
H = truffes_sous_le_sel,
P = saumon_oseille

D = sorbet_aux_poires,
H = cresson_oeuf_poche,
P = grillade_de_boeuf

D = fraises_chantilly,
H = cresson_oeuf_poche,
P = grillade_de_boeuf

D = melon_en_surprise,
H = cresson_oeuf_poche,
P = grillade_de_boeuf

D = sorbet_aux_poires,
H = cresson_oeuf_poche,
P = poulet_au_tilleul

D = fraises_chantilly,
H = cresson_oeuf_poche,
P = poulet_au_tilleul

D = melon_en_surprise,
H = cresson_oeuf_poche,
P = poulet_au_tilleul

D = sorbet_aux_poires,
H = cresson_oeuf_poche,
P = bar_aux_algues

D = fraises_chantilly,
H = cresson_oeuf_poche,
P = bar_aux_algues

D = melon_en_surprise,
H = cresson_oeuf_poche,
P = bar_aux_algues

D = sorbet_aux_poires,
H = cresson_oeuf_poche,
P = saumon_oseille

D = fraises_chantilly,
H = cresson_oeuf_poche,
P = saumon_oseille

D = melon_en_surprise,
H = cresson_oeuf_poche,
P = saumon_oseille
*/
		
/* 3) Plat dont le nombre de calories est compris entre 200 et 400 */		
cal_entre_200_400(P):- 
    plat_resistance(P),
	calories(P,CAL),
	>(CAL,200),
	<(CAL,400).

/*
P = bar_aux_algues
P = saumon_oseille
*/
	
/* 4)  Plat plus calorique que le "bar aux algues" */	
plus_cal_que_bar(P):-
    plat_resistance(P),
	calories(bar_aux_algues,C1),
	calories(P,C2),
	C2>C1.

/*
P = grillade_de_boeuf
P = poulet_au_tilleul
*/

/* 5) Valeur calorique d'un repas */
cal_repas(H,P,D,CAL):-
    repas(H,P,D),
	calories(H,X),
	calories(P,Y),
	calories(D,Z),
	CAL is X+Y+Z.

/*
CAL = 905,
D = sorbet_aux_poires,
H = artichauts_Melanie,
P = grillade_de_boeuf

CAL = 971,
D = fraises_chantilly,
H = artichauts_Melanie,
P = grillade_de_boeuf

CAL = 804,
D = melon_en_surprise,
H = artichauts_Melanie,
P = grillade_de_boeuf

CAL = 773,
D = sorbet_aux_poires,
H = artichauts_Melanie,
P = poulet_au_tilleul

CAL = 839,
D = fraises_chantilly,
H = artichauts_Melanie,
P = poulet_au_tilleul

CAL = 672,
D = melon_en_surprise,
H = artichauts_Melanie,
P = poulet_au_tilleul

CAL = 665,
D = sorbet_aux_poires,
H = artichauts_Melanie,
P = bar_aux_algues

CAL = 731,
D = fraises_chantilly,
H = artichauts_Melanie,
P = bar_aux_algues

CAL = 564,
D = melon_en_surprise,
H = artichauts_Melanie,
P = bar_aux_algues

CAL = 627,
D = sorbet_aux_poires,
H = artichauts_Melanie,
P = saumon_oseille

CAL = 693,
D = fraises_chantilly,
H = artichauts_Melanie,
P = saumon_oseille

CAL = 526,
D = melon_en_surprise,
H = artichauts_Melanie,
P = saumon_oseille

CAL = 957,
D = sorbet_aux_poires,
H = truffes_sous_le_sel,
P = grillade_de_boeuf

CAL = 1023,
D = fraises_chantilly,
H = truffes_sous_le_sel,
P = grillade_de_boeuf

CAL = 856,
D = melon_en_surprise,
H = truffes_sous_le_sel,
P = grillade_de_boeuf

CAL = 825,
D = sorbet_aux_poires,
H = truffes_sous_le_sel,
P = poulet_au_tilleul

CAL = 891,
D = fraises_chantilly,
H = truffes_sous_le_sel,
P = poulet_au_tilleul

CAL = 724,
D = melon_en_surprise,
H = truffes_sous_le_sel,
P = poulet_au_tilleul

CAL = 717,
D = sorbet_aux_poires,
H = truffes_sous_le_sel,
P = bar_aux_algues

CAL = 783,
D = fraises_chantilly,
H = truffes_sous_le_sel,
P = bar_aux_algues

CAL = 616,
D = melon_en_surprise,
H = truffes_sous_le_sel,
P = bar_aux_algues

CAL = 679,
D = sorbet_aux_poires,
H = truffes_sous_le_sel,
P = saumon_oseille

CAL = 745,
D = fraises_chantilly,
H = truffes_sous_le_sel,
P = saumon_oseille

CAL = 578,
D = melon_en_surprise,
H = truffes_sous_le_sel,
P = saumon_oseille

CAL = 967,
D = sorbet_aux_poires,
H = cresson_oeuf_poche,
P = grillade_de_boeuf

CAL = 1033,
D = fraises_chantilly,
H = cresson_oeuf_poche,
P = grillade_de_boeuf

CAL = 866,
D = melon_en_surprise,
H = cresson_oeuf_poche,
P = grillade_de_boeuf

CAL = 835,
D = sorbet_aux_poires,
H = cresson_oeuf_poche,
P = poulet_au_tilleul

CAL = 901,
D = fraises_chantilly,
H = cresson_oeuf_poche,
P = poulet_au_tilleul

CAL = 734,
D = melon_en_surprise,
H = cresson_oeuf_poche,
P = poulet_au_tilleul

CAL = 727,
D = sorbet_aux_poires,
H = cresson_oeuf_poche,
P = bar_aux_algues

CAL = 793,
D = fraises_chantilly,
H = cresson_oeuf_poche,
P = bar_aux_algues

CAL = 626,
D = melon_en_surprise,
H = cresson_oeuf_poche,
P = bar_aux_algues

CAL = 689,
D = sorbet_aux_poires,
H = cresson_oeuf_poche,
P = saumon_oseille

CAL = 755,
D = fraises_chantilly,
H = cresson_oeuf_poche,
P = saumon_oseille

CAL = 588,
D = melon_en_surprise,
H = cresson_oeuf_poche,
P = saumon_oseille
*/

/* 6) Un repas équilibré est un repas dont le nombre total de calories est inférieur à 800. */
rep_equil(H,P,D,CAL):-
	cal_repas(H,P,D,CAL),
	CAL<800.
	
/*
CAL = 773,
D = sorbet_aux_poires,
H = artichauts_Melanie,
P = poulet_au_tilleul

CAL = 672,
D = melon_en_surprise,
H = artichauts_Melanie,
P = poulet_au_tilleul

CAL = 665,
D = sorbet_aux_poires,
H = artichauts_Melanie,
P = bar_aux_algues

CAL = 731,
D = fraises_chantilly,
H = artichauts_Melanie,
P = bar_aux_algues

CAL = 564,
D = melon_en_surprise,
H = artichauts_Melanie,
P = bar_aux_algues

CAL = 627,
D = sorbet_aux_poires,
H = artichauts_Melanie,
P = saumon_oseille

CAL = 693,
D = fraises_chantilly,
H = artichauts_Melanie,
P = saumon_oseille

CAL = 526,
D = melon_en_surprise,
H = artichauts_Melanie,
P = saumon_oseille

CAL = 724,
D = melon_en_surprise,
H = truffes_sous_le_sel,
P = poulet_au_tilleul

CAL = 717,
D = sorbet_aux_poires,
H = truffes_sous_le_sel,
P = bar_aux_algues

CAL = 783,
D = fraises_chantilly,
H = truffes_sous_le_sel,
P = bar_aux_algues

CAL = 616,
D = melon_en_surprise,
H = truffes_sous_le_sel,
P = bar_aux_algues

CAL = 679,
D = sorbet_aux_poires,
H = truffes_sous_le_sel,
P = saumon_oseille

CAL = 745,
D = fraises_chantilly,
H = truffes_sous_le_sel,
P = saumon_oseille

CAL = 578,
D = melon_en_surprise,
H = truffes_sous_le_sel,
P = saumon_oseille

CAL = 734,
D = melon_en_surprise,
H = cresson_oeuf_poche,
P = poulet_au_tilleul

CAL = 727,
D = sorbet_aux_poires,
H = cresson_oeuf_poche,
P = bar_aux_algues

CAL = 793,
D = fraises_chantilly,
H = cresson_oeuf_poche,
P = bar_aux_algues

CAL = 626,
D = melon_en_surprise,
H = cresson_oeuf_poche,
P = bar_aux_algues

CAL = 689,
D = sorbet_aux_poires,
H = cresson_oeuf_poche,
P = saumon_oseille

CAL = 755,
D = fraises_chantilly,
H = cresson_oeuf_poche,
P = saumon_oseille

CAL = 588,
D = melon_en_surprise,
H = cresson_oeuf_poche,
P = saumon_oseille
*/

/*Question 1.3*/

/*
 * Mode trace sur la question ?-repas(H,P,D)
Call:repas(_G6299, _G6301, _G6297)
 Call:hors_d_oeuvre(_G6299)
 Exit:hors_d_oeuvre(artichauts_Melanie)
 Call:plat_resistance(_G6301)
 Call:viande(_G6301)
 Exit:viande(grillade_de_boeuf)
 Exit:plat_resistance(grillade_de_boeuf)
 Call:dessert(_G6297)
 Exit:dessert(sorbet_aux_poires)
 Exit:repas(artichauts_Melanie, grillade_de_boeuf, sorbet_aux_poires)
D = sorbet_aux_poires,
H = artichauts_Melanie,
P = grillade_de_boeuf
*/