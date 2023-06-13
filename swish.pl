/*Source code of expert system*/
go:-
hypothesis(Disease),
write('I believe that the tree has '),
write(Disease),
nl,
write('TAKE CARE '),
undo.
/*Hypothesis that should be tested*/
hypothesis(leaf_spots) :- leaf_spots, !.
hypothesis(curly_leaves) :- curly_leaves, !.
hypothesis(soot_dew) :- soot_dew, !.
hypothesis(leaf_pox) :- leaf_pox, !.
hypothesis(root_rot) :- root_rot, !.
hypothesis(rotten_heart) :- rotten_heart, !.
hypothesis(caterpillar) :- caterpillar, !.
hypothesis(rat) :- rat, !.
hypothesis(unknown). /* no diagnosis*/
/*Hypothesis Identification Rules*/
leaf_spots :-
verify(spot_on_leaves),
verify(yellow_brown),
verify(round_or_irregular_patches),
write('Advices and Sugestions:'),
nl,
write('1: neem oil '),
nl,
write('2: copper based fungicides '),
nl,
write('3: streptomycin spray '),
nl,
write('Please keep plant in a warm environment because '),
nl.

curly_leaves :-
verify(spot_on_leaves),
verify(leaves_are_bulging_or_curly),

write('Advices and Sugestions:'),
nl,
write('1: sulphur spray '),
nl,
write('2: dinotefuran sparay '),
nl,
write('3: imidacloprid tab '),
nl,
write('Please uproot all the affected plants because '),
nl.
soot_dew :-
verify(spot_on_leaves),
verify(black_spots),
verify(young_stems_are_green_kning),
write('Advices and Sugestions:'),
nl,
write('1: apply strobilurins '),
nl,
write('2: thiophnate spray '),
nl,
write('3: Ciprofloxacin '),
nl,
write('4: Azithromycin '),
nl,
write('spray potassium bicarbonate for a more effective treatment because '),
nl.
leaf_pox :-
verify(spot_on_leaves),
verify(bright_yellow_patches),
verify(notched_leaves),
verify(hardened_textured_leaves),
verify(protrusion_is_dark_brown_on_the_leaves),
write('Advices and Sugestions:'),
nl,
write('1: prunning '),
nl,
write('2: fungicide '),
nl,
write('Please destroy all effected plants because '),
nl.
root_rot :-
verify(leaves_turn_yellow_and_wither),
verify(brown_root),
verify(bracnches_covered_with_white_mushrooms),
verify(roots_covered_with_white_mushrooms),
verify(brown_root_rot),
write('Advices and Sugestions:'),
nl,
write('1: chloropicrin '),
nl,
write('2: mathyl bromide '),
nl,
write('3: amonium sulphate '),
nl,
write('4: Mefloquine'),
nl,
write('Please add large quantities of sulphate and soil sulphur and then water deeply because '),
nl.
rotten_heart :-
verify(leaves_turn_yellow_and_wither),
verify(broken_branches_and_wound),
verify(soft_wood_structure),
write('Advices and Sugestions:'),
nl,
write('1: nitrogen rich fertilizer'),
nl,
write('2: prunning'),
nl,
write('Please do annual checks and remove all damaged branches because '),
nl.
caterpillar :-
verify(hollow_leaves),
verify(perforated_leaves),
write('Advices and Sugestions:'),
nl,
write('1: molasses spray'),
nl,
write('2: neem oil'),
nl,
write('3: bacillus thuringiensis'),
nl,
write('Please keep careful watch on the plants to prevent a caterpillar infestation because '),
nl.
rat :-
verify(branches_peel_off),
verify(tree_dries_and_dies),
write('Advices and Sugestions:'),
nl,
write('1: bromethalin spray'),
nl,
write('2: neem oil'),
nl,
write('3: cholecalciferol'),
nl,
write('Please dry/clean water sources,clean debris , store feed in cans and keep grass short because '),
nl.


/* how to ask questions */
ask(Question) :-
write('Does the tree have the following symptom:'),
write(Question),
write('? '),
read(Response),
nl,
( (Response == yes ; Response == y)
->
assert(yes(Question)) ;
assert(no(Question)), fail).
:- dynamic yes/1,no/1.
/*How to verify something */
verify(S) :-
(yes(S)
->
true ;
(no(S)
->
fail ;
ask(S))).
/* undo all yes/no assertions*/
undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.
    