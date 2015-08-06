% even-Praedikat: X ist gerade
tff(even, axiom, ![X:$int] : (even(X) =>
   (?[Y:$int] : ($product(Y,2) = X)))).

% Teilbarkeits-Praedikat: X teilt Y <=> es ex. Z mit Z*X = Y
tff(divides, axiom, (![X:$int,Y:$int] : (divides(X,Y) <=>
   (?[Z:$int] : $product(Z,X) = Y)))).

% pyth-Praedikat: X,Y,Z ist pyth. Tripel mit Z Hypotenuse
tff(pyth, axiom, ![X:$int,Y:$int,Z:$int] : (pyth(X,Y,Z)
   <=> ($sum($product(X,X),$product(Y,Y)) = $product(Z,Z)))).

% Primitives-Pyth.-Tripel Praedikat
tff(primPyth, axiom, (![X:$int,Y:$int,Z:$int] : primPyth(X,Y,Z) <=>
   (pyth(X,Y,Z) & (~?[D:$int]: ($product(D,D) != 1) & divides(D,X) & divides(D,Y) & divides(D,Z))))).

% Behauptung: Die Hypotenuse jedes prim. pyth. Tripels ist ungerade.
tff(oddHyp, conjecture, (![X:$int,Y:$int,Z:$int] : primPyth(X,Y,Z) => ~even(Z))).