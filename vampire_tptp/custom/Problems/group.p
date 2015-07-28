%---- 1*x = x
fof(left_identity,axiom, ! [X] : mult(e,X) = X).
%---- i(x)*x = 1
fof(left_inverse,axiom, ! [X] : mult(inverse(X),X) = e).
%---- (x*y)*z = x*(y*z)
fof(associativity, axiom, ! [X,Y,Z] : mult(mult(X,Y),Z) = mult(X,mult(Y,Z))).
%---- x*x = 1
%fof(group_of_order_2, hypothesis, ).
%---- prove x*y = y*x
fof(commutativity, conjecture, (! [X] : (mult(X,X) = e)) => (! [A,B] : mult(A,B) = mult(B,A))).