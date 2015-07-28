% definition of concatenation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % all y cons(empty,y) = y.
	fof(concat, axiom, ![Y] : (cons(empty, Y) = Y)).
   %  all x all y cons(append(x,y),z) = append(x,cons(y,z)).
	fof(assoziativ, axiom, ![X,Y,Z] : (cons(append(X,Y),Z) = append(X,cons(Y,Z)))).
%	append(empty,y) = y.
	fof(append, axiom, ![Y] : (append(empty,Y) = Y)).
%	all a append(cons(a,x), y) = cons(a, append(x,y)).
	fof(assoziativ2, axiom, ![A,X,Y] : (append(cons(A,X),Y) = cons(A,append(X,Y)))).
	
% induction hypothesis associativity %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
end_of_list.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
formulas(goals).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





%A(empty) & all x all y (A(x) -> A(cons(y,x))) -> all x A(x).
% all y all z append(x,append(y,z)) = append(append(x,y),z).
% % induction base associativity %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   all y all z conc(empty,conc(y,z)) = conc(conc(empty,y),z) &
% % induction step associativity %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   all a all y all z conc(append(a,C),conc(y,z)) = conc(conc(append(a,C),y),z).

end_of_list.

