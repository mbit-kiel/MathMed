% Es gibt keine p,q aus ganzen Zahlen, mit 2*q^2 = p^2 
%tff(irrewurzel2, conjecture, ! [P:$int] : ! [Q:$int] : (((~($product(2,$product(Q,Q)) = $product(P,P))) | (P = 0)) | (Q = 0))).

% Es gibt a,b,c aus ganzen Zahlen, mit a^2 + b^2 = c^2 (3^2 + 4^2 = 5^2).
tff(pytTrip, conjecture, ?[A:$int,B:$int,C:$int] : (($sum($product(A, A), $product(B,B)) = $product(C,C)) & ($greater($product(C,C),10000)))).

