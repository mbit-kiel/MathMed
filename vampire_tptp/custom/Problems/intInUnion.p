%--------------------------------------------------------------------------
%----Include set theory definitions
include('Axioms/SET006+0.ax').
%--------------------------------------------------------------------------

%fof(intInUnion, conjecture, 
%  ( ! [A,B] : (subset(intersection(A,B), union(A,B))))).

fof(intInUnion, conjecture, 
  ( ~ ! [A,B] : (subset(union(A,B), intersection(A,B))))).