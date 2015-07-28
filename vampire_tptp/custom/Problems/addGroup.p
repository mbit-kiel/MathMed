%----------------------------------------------------------------------------
%%%%% Axioms %%%%%
%----------------------------------------------------------------------------

% Assoziativität

	% all x all y all z (x+(y+z) = (x+y)+z).
	fof(assoziativ, axiom, ![X,Y,Z] : (product(X, product(Y,Z)) = product(product(X,Y),Z))).
	  
% Neutrales Element

	% all x (0+x = x).
	fof(neutral_element, axiom, ![X]:(product(neutral_element,X) = X)).
   
% Inverses Element

	% all x (-x+x = 0).
	fof(invers_element, axiom, ![X]:(product(inverse(X),X) = neutral_element)).

% predicates for neutral and inverse elements

	% lneutral(x) <-> (all y (x+y = y)).
	fof(lneutral, axiom, ![X]:((lneutral(X)) <=> (![Y]: (product(X,Y) = Y)))).
	% rneutral(x) <-> (all y (y+x = y)).
	fof(rneutral, axiom, ![X]:((rneutral(X)) <=> (![Y]:(product(Y,X) = Y)))).
	% linverse(x,y) <-> x+y = 0.
	fof(linverse, axiom, ![X,Y]:((linverse(X,Y)) <=> (product(X,Y) = neutral_element))).
	% rinverse(x,y) <-> y+x = 0.
	fof(rinverse, axiom, ![X,Y]:((rinverse(X,Y)) <=> (product(Y,X) = neutral_element))).
	
	
%----------------------------------------------------------------------------
%%%%% Conjectures %%%%%
%----------------------------------------------------------------------------
	
	% rneutral(0).
	%fof(oneProof1, conjecture, (rneutral(neutral_element))).
	% all x (lneutral(x) -> x = 0).
	%fof(oneProof2, conjecture, (![X]:((lneutral(X)) => (X = neutral_element)))).
	%  all x (rneutral(x) -> lneutral(x)).
	%fof(oneProof3, conjecture, (![X]:((rneutral(X)) => (lneutral(X))))).
	% all x all y (linverse(y,x) -> y = -x).
	%fof(oneProof4, conjecture, (![X,Y]:((linverse(Y,X)) => (Y = inverse(X))))).
	% all x (lneutral(x) -> rneutral(x)).
	%fof(oneProof5, conjecture, (![X]:((lneutral(X)) => (rneutral(X))))).
	% all x all y (rinverse(y,x) -> linverse(y,x)).
	%fof(oneProof6, conjecture, (![X,Y]:((rinverse(Y,X)) => (linverse(Y,X))))).
	
	 % fof(twoProofs, conjecture, ((rneutral(neutral_element)) 
		 % & (![X]:((lneutral(X)) => (X = neutral_element))))).
		
	% fof(threeProofs, conjecture, ((rneutral(neutral_element)) 
		% & (![X]:((lneutral(X)) => (X = neutral_element))) 
		% & (![X,Y]:((linverse(Y,X)) => (Y = inverse(X)))))).
		
	% fof(fourProofs, conjecture, ((rneutral(neutral_element)) 
		% & (![X]:((lneutral(X)) => (X = neutral_element))) 
		% & (![X,Y]:((linverse(Y,X)) => (Y = inverse(X))))
		% & (![X]:((rneutral(X)) => (lneutral(X)))))).
		
	 fof(fiveProofs, conjecture, ((rneutral(neutral_element)) 
		& (![X]:((lneutral(X)) => (X = neutral_element))) 
		& (![X,Y]:((linverse(Y,X)) => (Y = inverse(X))))
		& (![X]:((rneutral(X)) => (lneutral(X))))
		& (![X]:((lneutral(X)) => (rneutral(X)))))).
		
	% fof(sixProofs, conjecture, ((rneutral(neutral_element)) 
		% & (![X]:((lneutral(X)) => (X = neutral_element))) 
		% & (![X,Y]:((linverse(Y,X)) => (Y = inverse(X))))
		% & (![X]:((rneutral(X)) => (lneutral(X))))
		% & (![X]:((lneutral(X)) => (rneutral(X))))
		% & (![X,Y]:((rinverse(Y,X)) => (linverse(Y,X)))))).
									
	% fof(testProof, conjecture, (
								% ![X,Y,Z] : (
											% inverse(
												% product(
													% inverse(
														% product(
															% Z,
															% inverse(
																% product(
																	% inverse(X),
																	% inverse(
																		% product(
																			% Y,
																			% inverse(
																				% product(
																					% inverse(Y),
																					% Y
																				% )
																			% )
																		% )
																	% )
																% )
															% )
														% )
													% ),
													% product(Z,Y)
												% )
											% ) = X
										% )
								% )
		% ).
		
	% cnf(prove_these_axioms,negated_conjecture,
    % ( product(inverse(a1),a1) != product(inverse(b1),b1)
    % | product(product(inverse(b2),b2),a2) != a2
    % | product(product(a3,b3),c3) != product(a3,product(b3,c3)) )).
