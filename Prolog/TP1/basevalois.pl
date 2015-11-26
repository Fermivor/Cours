/*TP Base Valois - Famille de France

@author Florentin Hortet
@author Etienne Geantet
@version Annee scolaire 2015/2016
*/

homme(charles_V).
homme(charles_VI).
homme(charles_VII).
homme(louis_XI).
homme(charles_VIII).
homme(louis_XII).
homme(francois_I).
homme(henri_II).
homme(francois_II).
homme(charles_IX).
homme(henri_III).
homme(jean_II).
homme(philippe_VI).
homme(charles_d_Orleans).
homme(charles_de_Valois).
homme(louis_d_Orleans).
homme(jean_d_angouleme).
homme(charles_d_angouleme).

femme(anne_de_cleves).
femme(louise_de_Savoie).
femme(claude_de_france).
femme(anne_de_Bretagne).
femme(catherine_de_medicis).
femme(charlotte_de_Savoie).
femme(marie_d_anjou).
femme(isabeau_de_Baviere).
femme(valentine_de_milan).
femme(jeanne_de_Bourbon).
femme(bonne_de_luxembourg).
femme(jeanne_de_Bourgogne).
femme(marie_Stuart).
femme(elisabeth_d_autriche).
femme(louise_de_lorraine).
femme(marguerite_du_Rohan).

mere(marguerite_du_Rohan, charles_d_angouleme).
mere(jeanne_de_Bourgogne, jean_II).
mere(bonne_de_luxembourg, charles_V).
mere(jeanne_de_Bourbon, charles_VI).
mere(jeanne_de_Bourbon, louis_d_Orleans).
mere(valentine_de_milan, charles_d_Orleans).
mere(valentine_de_milan, jean_d_angouleme).
mere(isabeau_de_Baviere, charles_VII).
mere(marie_d_anjou, louis_XI).
mere(charlotte_de_Savoie, charles_VIII).
mere(anne_de_Bretagne, claude_de_france).
mere(claude_de_france, henri_II).
mere(anne_de_cleves, louis_XII).
mere(louise_de_Savoie, francois_I).
mere(catherine_de_medicis, francois_II).
mere(catherine_de_medicis, charles_IX).
mere(catherine_de_medicis, henri_III).

epoux(marguerite_du_Rohan, jean_d_angouleme).
epoux(louise_de_lorraine, henri_III).
epoux(elisabeth_d_autriche, charles_IX).
epoux(marie_Stuart, francois_II).
epoux(jeanne_de_Bourgogne, philippe_VI).
epoux(bonne_de_luxembourg, jean_II).
epoux(jeanne_de_Bourbon, charles_V).
epoux(valentine_de_milan, louis_d_Orleans).
epoux(isabeau_de_Baviere, charles_VI).
epoux(marie_d_anjou, charles_VII).
epoux(charlotte_de_Savoie, louis_XI).
epoux(catherine_de_medicis, henri_II).
epoux(anne_de_cleves, charles_d_Orleans).
epoux(louise_de_Savoie, charles_d_angouleme).
epoux(claude_de_france, francois_I).
epoux(anne_de_Bretagne, charles_VIII).
epoux(anne_de_Bretagne, louis_XII).
epoux(H,F) :- homme(H), femme(F), epoux(F,H).

pere(louis_XII, claude_de_france).
pere(charles_de_Valois, philippe_VI).
pere(philippe_VI, jean_II).
pere(jean_II, charles_V).
pere(charles_V, charles_VI).
pere(charles_VI, charles_VII).
pere(charles_VII, louis_XI).
pere(charles_d_Orleans, louis_XII).
pere(charles_d_angouleme, francois_I).
pere(francois_I, henri_II).
pere(henri_II, francois_II).
pere(henri_II, charles_IX).
pere(henri_II, henri_III).
pere(louis_d_Orleans, charles_d_Orleans).
pere(charles_V, louis_d_Orleans).
pere(jean_d_angouleme, charles_d_angouleme).
pere(louis_d_Orleans, jean_d_angouleme).

roi(charles_V, le_sage, 1364, 1380).
roi(charles_VI, le_bien_aime, 1380, 1422).
roi(charles_VII, xx, 1422, 1461).
roi(louis_XI, xx, 1461, 1483).
roi(charles_VIII, xx, 1483, 1498).
roi(louis_XII, le_pere_du_peuple, 1498, 1515).
roi(francois_I, xx, 1515, 1547).
roi(henri_II, xx, 1547, 1559).
roi(francois_II, xx, 1559, 1560).
roi(charles_IX, xx, 1560, 1574).
roi(henri_III, xx, 1574, 1589).
roi(jean_II, le_bon, 1350, 1364).
roi(philippe_VI, de_valois, 1328, 1350).


/*Question 2.1*/
/* 1) E est un enfant de P */
enfant(E,P):- mere(P,E).
enfant(E,P):- pere(P,E).

/* 2) P est un parent de E */
parent(P,E):- enfant(E,P).

/* 3) G est un grand-père de E */
grand_pere(G,E):-
    pere(G,P),
    parent(P,E).

/* 4) F est un frère de E */
frere(F,E):-
    homme(F),
    pere(P,F),
    pere(P,E),
    mere(M,F),
    mere(M,E),
    \==(F,E).

/* 5) O est un oncle de N */	
oncle(O,N):-
    frere(O,P),
    parent(P,N).

/* 6) C est un cousin de E */    
cousin(C,E):-
    homme(C),
    parent(O,C),
    oncle(O,E).

/* 7) en l'an D, le règne du roi R1 se termine er celui du roi R2 débute */
le_roi_est_mort_vive_le_roi(R1,D,R2):-
    roi(R1,_,_,D),
    roi(R2,_,D,_).
 
/*Question 2.2*/

ancetre(ANC,SUC):- parent(ANC,SUC).
ancetre(ANC,SUC):- parent(E,SUC),ancetre(ANC,E).

/* on fait varier l'ordre des clauses 
ANC est un ancetre de SUC
 

ancetre(ANC,SUC):- parent(E,SUC),ancetre(ANC,E).
ancetre(ANC,SUC):- parent(ANC,SUC).
  
En changeant l'ordre des clauses, l'interrogation de la base reste la même.  
*/
  
/* on fait varier l'ordre des buts
ANC est un ancetre de SUC

ancetre(ANC,SUC):- parent(ANC,SUC).
ancetre(ANC,SUC):- ancetre(ANC,E), parent(E,SUC).

En changeant l'ordre des buts o obtient toutes les réponses puis on boucle à l'infini.
*/

/* on fait varier l'ordre des buts et clauses
ANC est un ancetre de SUC

ancetre(ANC,SUC):- ancetre(ANC,E), parent(E,SUC).
ancetre(ANC,SUC):- parent(ANC,SUC).

En changeant l'ordre des buts on obtient pas les réponses et on boucle à l'infini.
*/
    
	
/*------------------------TEST------------------------*/

/*Question 2.1*/
/* enfant */

/*
34 solutions

E = charles_d_angouleme,
P = marguerite_du_Rohan ;
E = jean_II,
P = jeanne_de_Bourgogne ;
E = charles_V,
P = bonne_de_luxembourg ;
E = charles_VI,
P = jeanne_de_Bourbon ;
E = louis_d_Orleans,
P = jeanne_de_Bourbon ;
E = charles_d_Orleans,
P = valentine_de_milan ;
E = jean_d_angouleme,
P = valentine_de_milan ;
E = charles_VII,
P = isabeau_de_Baviere ;
E = louis_XI,
P = marie_d_anjou ;
E = charles_VIII,
P = charlotte_de_Savoie ;
E = claude_de_france,
P = anne_de_Bretagne ;
E = henri_II,
P = claude_de_france ;
... 

...
   Call: (7) enfant(_G2627, _G2628) ? creep
   Call: (8) mere(_G2628, _G2627) ? creep
   Exit: (8) mere(marguerite_du_Rohan, charles_d_angouleme) ? creep
   Exit: (7) enfant(charles_d_angouleme, marguerite_du_Rohan) ? creep
E = charles_d_angouleme,
P = marguerite_du_Rohan ;
   Redo: (8) mere(_G2628, _G2627) ? creep
   Exit: (8) mere(jeanne_de_Bourgogne, jean_II) ? creep
   Exit: (7) enfant(jean_II, jeanne_de_Bourgogne) ? creep
E = jean_II,
P = jeanne_de_Bourgogne ;
   Redo: (8) mere(_G2628, _G2627) ? creep
   Exit: (8) mere(bonne_de_luxembourg, charles_V) ? creep
   Exit: (7) enfant(charles_V, bonne_de_luxembourg) ? creep
E = charles_V,
P = bonne_de_luxembourg
... */

/* parent */

/*
34 solutions

...
   Call: (7) parent(_G4026, _G4027) ? creep
   Call: (8) enfant(_G4027, _G4026) ? creep
   Call: (9) mere(_G4026, _G4027) ? creep
   Exit: (9) mere(marguerite_du_Rohan, charles_d_angouleme) ? creep
   Exit: (8) enfant(charles_d_angouleme, marguerite_du_Rohan) ? creep
   Exit: (7) parent(marguerite_du_Rohan, charles_d_angouleme) ? creep
P = marguerite_du_Rohan,
E = charles_d_angouleme ;
   Redo: (9) mere(_G4026, _G4027) ? creep
   Exit: (9) mere(jeanne_de_Bourgogne, jean_II) ? creep
   Exit: (8) enfant(jean_II, jeanne_de_Bourgogne) ? creep
   Exit: (7) parent(jeanne_de_Bourgogne, jean_II) ? creep
P = jeanne_de_Bourgogne,
E = jean_II ;
   Redo: (9) mere(_G4026, _G4027) ? creep
   Exit: (9) mere(bonne_de_luxembourg, charles_V) ? creep
   Exit: (8) enfant(charles_V, bonne_de_luxembourg) ? creep
   Exit: (7) parent(bonne_de_luxembourg, charles_V) ? creep
P = bonne_de_luxembourg,
E = charles_V ;
   Redo: (9) mere(_G4026, _G4027) ? creep
   Exit: (9) mere(jeanne_de_Bourbon, charles_VI) ? creep
   Exit: (8) enfant(charles_VI, jeanne_de_Bourbon) ? creep
   Exit: (7) parent(jeanne_de_Bourbon, charles_VI) ? creep
P = jeanne_de_Bourbon,
E = charles_VI ;
...*/

/* grand-pere */

/*
17 solutions

...
   Call: (7) grand_pere(_G5297, _G5298) ? creep
   Call: (8) pere(_G5297, _G5389) ? creep
   Exit: (8) pere(louis_XII, claude_de_france) ? creep
   Call: (8) parent(claude_de_france, _G5298) ? creep
   Call: (9) enfant(_G5298, claude_de_france) ? creep
   Call: (10) mere(claude_de_france, _G5298) ? creep
   Exit: (10) mere(claude_de_france, henri_II) ? creep
   Exit: (9) enfant(henri_II, claude_de_france) ? creep
   Exit: (8) parent(claude_de_france, henri_II) ? creep
   Exit: (7) grand_pere(louis_XII, henri_II) ? creep
P = louis_XII,
E = henri_II ;
   Redo: (9) enfant(_G5298, claude_de_france) ? creep
   Call: (10) pere(claude_de_france, _G5298) ? creep
   Fail: (10) pere(claude_de_france, _G5298) ? creep
   Fail: (9) enfant(_G5298, claude_de_france) ? creep
   Fail: (8) parent(claude_de_france, _G5298) ? creep
   Redo: (8) pere(_G5297, _G5389) ? creep
   Exit: (8) pere(charles_de_Valois, philippe_VI) ? creep
   Call: (8) parent(philippe_VI, _G5298) ? creep
   Call: (9) enfant(_G5298, philippe_VI) ? creep
   Call: (10) mere(philippe_VI, _G5298) ? creep
   Fail: (10) mere(philippe_VI, _G5298) ? creep
   Redo: (9) enfant(_G5298, philippe_VI) ? creep
   Call: (10) pere(philippe_VI, _G5298) ? creep
   Exit: (10) pere(philippe_VI, jean_II) ? creep
   Exit: (9) enfant(jean_II, philippe_VI) ? creep
   Exit: (8) parent(philippe_VI, jean_II) ? creep
   Exit: (7) grand_pere(charles_de_Valois, jean_II) ? creep
P = charles_de_Valois,
E = jean_II ;
   Redo: (8) pere(_G5297, _G5389) ? creep
   Exit: (8) pere(philippe_VI, jean_II) ? creep
   Call: (8) parent(jean_II, _G5298) ? creep
   Call: (9) enfant(_G5298, jean_II) ? creep
   Call: (10) mere(jean_II, _G5298) ? creep
   Fail: (10) mere(jean_II, _G5298) ? creep
   Redo: (9) enfant(_G5298, jean_II) ? creep
   Call: (10) pere(jean_II, _G5298) ? creep
   Exit: (10) pere(jean_II, charles_V) ? creep
   Exit: (9) enfant(charles_V, jean_II) ? creep
   Exit: (8) parent(jean_II, charles_V) ? creep
   ...*/
   
/* frere */ 

/*
10 solutions

...
   Call: (7) frere(_G5267, _G5268) ? creep
   Call: (8) homme(_G5267) ? creep
   Exit: (8) homme(charles_V) ? creep
   Call: (8) pere(_G5358, charles_V) ? creep
   Exit: (8) pere(jean_II, charles_V) ? creep
   Call: (8) pere(jean_II, _G5268) ? creep
   Exit: (8) pere(jean_II, charles_V) ? creep
   Call: (8) mere(_G5358, charles_V) ? creep
   Exit: (8) mere(bonne_de_luxembourg, charles_V) ? creep
   Call: (8) mere(bonne_de_luxembourg, charles_V) ? creep
   Exit: (8) mere(bonne_de_luxembourg, charles_V) ? creep
   Call: (8) charles_V\==charles_V ? creep
   Fail: (8) charles_V\==charles_V ? creep
   Redo: (8) homme(_G5267) ? creep
   Exit: (8) homme(charles_VI) ? creep
   Call: (8) pere(_G5358, charles_VI) ? creep
   Exit: (8) pere(charles_V, charles_VI) ? creep
   Call: (8) pere(charles_V, _G5268) ? creep
   Exit: (8) pere(charles_V, charles_VI) ? creep
   Call: (8) mere(_G5358, charles_VI) ? creep
   Exit: (8) mere(jeanne_de_Bourbon, charles_VI) ? creep
   Call: (8) mere(jeanne_de_Bourbon, charles_VI) ? creep
   Exit: (8) mere(jeanne_de_Bourbon, charles_VI) ? creep
  ? creep
   Fail: (8) charles_VI\==charles_VI ? creep
   Redo: (8) pere(charles_V, _G5268) ? creep
   Exit: (8) pere(charles_V, louis_d_Orleans) ? creep
   Call: (8) mere(_G5358, charles_VI) ? creep
   Exit: (8) mere(jeanne_de_Bourbon, charles_VI) ? creep
   Call: (8) mere(jeanne_de_Bourbon, louis_d_Orleans) ? creep
   Exit: (8) mere(jeanne_de_Bourbon, louis_d_Orleans) ? creep
   Call: (8) charles_VI\==louis_d_Orleans ? creep
   Exit: (8) charles_VI\==louis_d_Orleans ? creep
   Exit: (7) frere(charles_VI, louis_d_Orleans) ? creep
F = charles_VI,
E = louis_d_Orleans ;
   Redo: (8) homme(_G5267) ? creep
  ? creep
   Call: (8) pere(_G5358, charles_VII) ? creep
   ...*/
   
/* oncle */    
   
/*
5 solutions

...
ጀO = charles_VI,
N = charles_d_Orleans ;
   Redo: (11) pere(louis_d_Orleans, _G1459) ? creep
   Exit: (11) pere(louis_d_Orleans, jean_d_angouleme) ? creep
   Exit: (8) oncle(charles_VI, jean_d_angouleme) ? creep
O = charles_VI,
N = jean_d_angouleme ;
   Redo: (10) homme(_G1458) ? creep
   Exit: (10) homme(charles_VII) ? creep
   Call: (10) pere(_G1587, charles_VII) ? creep
   Exit: (10) pere(charles_VI, charles_VII) ? creep
   Call: (10) pere(charles_VI, _G1588) ? creep
   Exit: (10) pere(charles_VI, charles_VII) ? creep
   Call: (10) mere(_G1587, charles_VII) ? creep
   Exit: (10) mere(isabeau_de_Baviere, charles_VII) ? creep
   Call: (10) mere(isabeau_de_Baviere, charles_VII) ? creep
   Exit: (10) mere(isabeau_de_Baviere, charles_VII) ? creep
   Call: (10) charles_VII\==charles_VII ? creep
   Fail: (10) charles_VII\==charles_VII ? creep
   Redo: (10) homme(_G1458) ? creep
   Exit: (10) homme(louis_XI) ? creep
   Call: (10) pere(_G1587, louis_XI) ? creep
   Exit: (10) pere(charles_VII, louis_XI) ? creep
   Call: (10) pere(charles_VII, _G1588) ? creep
   Exit: (10) pere(charles_VII, louis_XI) ? creep
   Call: (10) mere(_G1587, louis_XI) ? creep
   Exit: (10) mere(marie_d_anjou, louis_XI) ? creep
   Call: (10) mere(marie_d_anjou, louis_XI) ? creep
   Exit: (10) mere(marie_d_anjou, louis_XI) ? creep
   Call: (10) louis_XI\==louis_XI ? creep
   Fail: (10) louis_XI\==louis_XI ? creep
   Redo: (10) homme(_G1458) ? creep
   Exit: (10) homme(charles_VIII) ? creep
   ...*/

 /* cousin */    
   
/*
6 solutions

...
   Fail: (9) frere(isabeau_de_Baviere, _G2811) ? creep
   Fail: (8) oncle(isabeau_de_Baviere, _G2720) ? creep
   Redo: (9) enfant(charles_VII, _G2811) ? creep
   Call: (10) pere(_G2810, charles_VII) ? creep
   Exit: (10) pere(charles_VI, charles_VII) ? creep
   Exit: (9) enfant(charles_VII, charles_VI) ? creep
   Exit: (8) parent(charles_VI, charles_VII) ? creep
   Call: (8) oncle(charles_VI, _G2720) ? creep
   Call: (9) frere(charles_VI, _G2811) ? creep
   Call: (10) homme(charles_VI) ? creep
   Exit: (10) homme(charles_VI) ? creep
   Call: (10) pere(_G2810, charles_VI) ? creep
   Exit: (10) pere(charles_V, charles_VI) ? creep
   Call: (10) pere(charles_V, _G2811) ? creep
   Exit: (10) pere(charles_V, charles_VI) ? creep
   Call: (10) mere(_G2810, charles_VI) ? creep
   Exit: (10) mere(jeanne_de_Bourbon, charles_VI) ? creep
   Call: (10) mere(jeanne_de_Bourbon, charles_VI) ? creep
   Exit: (10) mere(jeanne_de_Bourbon, charles_VI) ? creep
   Call: (10) charles_VI\==charles_VI ? creep
   Fail: (10) charles_VI\==charles_VI ? creep
   Redo: (10) pere(charles_V, _G2811) ? creep
   Exit: (10) pere(charles_V, louis_d_Orleans) ? creep
   Call: (10) mere(_G2810, charles_VI) ? creep
   Exit: (10) mere(jeanne_de_Bourbon, charles_VI) ? creep
   Call: (10) mere(jeanne_de_Bourbon, louis_d_Orleans) ? creep
   Exit: (10) mere(jeanne_de_Bourbon, louis_d_Orleans) ? creep
   Call: (10) charles_VI\==louis_d_Orleans ? creep
   Exit: (10) charles_VI\==louis_d_Orleans ? creep
   Exit: (9) frere(charles_VI, louis_d_Orleans) ? creep
   Call: (9) parent(louis_d_Orleans, _G2720) ? creep
   Call: (10) enfant(_G2720, louis_d_Orleans) ? creep
   Call: (11) mere(louis_d_Orleans, _G2720) ? creep
   Fail: (11) mere(louis_d_Orleans, _G2720) ? creep
   Redo: (10) enfant(_G2720, louis_d_Orleans) ? creep
   Call: (11) pere(louis_d_Orleans, _G2720) ? creep
   Exit: (11) pere(louis_d_Orleans, charles_d_Orleans) ? creep
   Exit: (10) enfant(charles_d_Orleans, louis_d_Orleans) ? creep
   Exit: (9) parent(louis_d_Orleans, charles_d_Orleans) ? creep
   Exit: (8) oncle(charles_VI, charles_d_Orleans) ? creep
   Exit: (7) cousin(charles_VII, charles_d_Orleans) ? creep
C = charles_VII,
E = charles_d_Orleans ;
  ? creep
   Exit: (11) pere(louis_d_Orleans, jean_d_angouleme) ? creep
  ? creep
   Exit: (9) parent(louis_d_Orleans, jean_d_angouleme) ? creep
   Exit: (8) oncle(charles_VI, jean_d_angouleme) ? creep
  ? creep
C = charles_VII,
E = jean_d_angouleme ;
   Redo: (8) homme(_G2719) ? creep
   ...*/ 

 /* le_roi_est_mort_vive_le_roi */    
   
/*
12 solutions

...
   Call: (7) le_roi_est_mort_vive_le_roi(_G4092, _G4093, _G4094) ? creep
   Call: (8) roi(_G4092, _G4201, _G4202, _G4093) ? creep
   Exit: (8) roi(charles_V, le_sage, 1364, 1380) ? creep
   Call: (8) roi(_G4094, _G4201, 1380, _G4203) ? creep
   Exit: (8) roi(charles_VI, le_bien_aime, 1380, 1422) ? creep
   Exit: (7) le_roi_est_mort_vive_le_roi(charles_V, 1380, charles_VI) ? creep
R1 = charles_V,
D = 1380,
R2 = charles_VI ;
   Redo: (8) roi(_G4092, _G4201, _G4202, _G4093) ? creep
   Exit: (8) roi(charles_VI, le_bien_aime, 1380, 1422) ? creep
   Call: (8) roi(_G4094, _G4201, 1422, _G4203) ? creep
   Exit: (8) roi(charles_VII, xx, 1422, 1461) ? creep
   Exit: (7) le_roi_est_mort_vive_le_roi(charles_VI, 1422, charles_VII) ? creep
R1 = charles_VI,
D = 1422,
R2 = charles_VII ;
   Redo: (8) roi(_G4092, _G4201, _G4202, _G4093) ? creep
   Exit: (8) roi(charles_VII, xx, 1422, 1461) ? creep
   Call: (8) roi(_G4094, _G4201, 1461, _G4203) ? 
   ...*/ 

   
/*Question 2.2*/
/* version normale 

ANC = valentine_de_milan ;
ANC = louis_d_Orleans ;
ANC = jeanne_de_Bourbon ;
ANC = charles_V ;
ANC = bonne_de_luxembourg ;
ANC = jean_II ;
ANC = jeanne_de_Bourgogne ;
ANC = philippe_VI ;
ANC = charles_de_Valois ;
false.

*/

/* version inversion clauses

ANC = charles_de_Valois ;
ANC = jeanne_de_Bourgogne ;
ANC = philippe_VI ;
ANC = bonne_de_luxembourg ;
ANC = jean_II ;
ANC = jeanne_de_Bourbon ;
ANC = charles_V ;
ANC = valentine_de_milan ;
ANC = louis_d_Orleans.

*/


/* version inversion buts

ANC = valentine_de_milan ;
ANC = louis_d_Orleans ;
ANC = jeanne_de_Bourbon ;
ANC = charles_V ;
ANC = bonne_de_luxembourg ;
ANC = jean_II ;
ANC = jeanne_de_Bourgogne ;
ANC = philippe_VI ;
ANC = charles_de_Valois ;
  

*/

/* version inversion buts et clauses

ANC = valentine_de_milan ;
ANC = louis_d_Orleans ;
ANC = jeanne_de_Bourbon ;
ANC = charles_V ;
ANC = bonne_de_luxembourg ;
ANC = jean_II ;
ANC = jeanne_de_Bourgogne ;
ANC = philippe_VI ;
ANC = charles_de_Valois ;
  

*/



