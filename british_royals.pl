% problem 1, base predicates
male(philip).
male(charles).
male(william).
male(harry).
male(george).
male(archie).

female(elizabeth).
female(diana).
female(camilla).
female(catherine).
female(meghan).
female(charlotte).

deceased(diana).

ever_married_to(elizabeth, philip).
ever_married_to(philip, elizabeth).
ever_married_to(charles, diana).
ever_married_to(diana, charles).
ever_married_to(charles, camilla).
ever_married_to(camilla, charles).
ever_married_to(william, catherine).
ever_married_to(catherine, william).
ever_married_to(harry, meghan).
ever_married_to(meghan, harry).

child_of(charles, elizabeth).
child_of(charles, philip).
child_of(william, diana).
child_of(william, charles).
child_of(harry, diana).
child_of(harry, charles).
child_of(george, william).
child_of(george, catherine).
child_of(charlotte, william).
child_of(charlotte, catherine).
child_of(archie, harry).
child_of(archie, meghan).

% helpers 
% X and Y are siblings
sibling_of(X, Y):- child_of(X, Z), child_of(Y, Z), X \= Y, !.
% X and Y are cousins
cousin_of(X, Y):- child_of(X, Z), child_of(Y, W), sibling_of(Z, W).


% problem 2
% X is a aunt of Y
% case where aunt is by blood
aunt_of(X, Y):- female(X), child_of(Y, Z), sibling_of(X, Z).
% case where aunt is by marriage 
aunt_of(X, Y):- female(X), child_of(Y, Z), sibling_of(Z, W), ever_married_to(W, X).

% X is grandfather of Y
grandfather_of(X, Y):- male(X), child_of(Y, Z), child_of(Z, X).

% X is grandson of Y
grandson_of(X, Y):- male(X), child_of(X, Z), child_of(Z, Y).

% X is granddaughter of Y
granddaughter_of(X, Y):- female(X), child_of(X, Z), child_of(Z, Y).

% X is father of Y
father_of(X, Y):- male(X), child_of(Y, X).

% X is mother of Y
mother_of(X, Y):- female(X), child_of(Y, X).

% X is stepmother of Y
stepmother_of(X, Y):- female(X), not(mother_of(X, Y)), child_of(Y, Z), ever_married_to(X, Z).
