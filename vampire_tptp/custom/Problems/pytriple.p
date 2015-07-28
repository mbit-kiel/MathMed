%even-axiom
tff(even, axiom, ![X:$int] : (even(X) => (?[Y:$int] : ($product(Y,2) = X))) ).

tff(pyth, axiom, ![X:$int,Y:$int,Z:$int] : (pyth(X,Y,Z) 
	<=> ($sum($product(X,X),$product(Y,Y)) = $product(Z,Z))) ).


tff(divides, axiom, (![X:$int,Y:$int] : (divides(X,Y) <=> (?[Z:$int] : $product(Z,X) = Y)))).

% tff(primPyth, axiom, ![X:$int,Y:$int,Z:$int] : (primPyth(X,Y,Z) 
			% <=> (pyth(X,Y,Z) & (![A:$int,B:$int,C:$int,D:$int] : ($greater(D,1) 
			% => ($product(A,D) != X | $product(B,D) != Y | $product(C,D) != Z)))))).

tff(primPyth, axiom, (![X:$int,Y:$int,Z:$int] : primPyth(X,Y,Z) <=> (pyth(X,Y,Z) 
		& (~?[D:$int]: D!=1 & divides(D,X) & divides(D,Y) & divides(D,Z))))).
			
tff(unevenZ, conjecture, (![X:$int,Y:$int,Z:$int] : primPyth(X,Y,Z) => ~even(Z))).