%--------------------------------------------------------------------------
%----Include set theory definitions
include('Axioms/SET006+0.ax').
%--------------------------------------------------------------------------

fof(unionOfDiffIntEq, conjecture, 
   ! [A,B] : (subset(A,
                         union(difference(A,B), 
                               intersection(A,B)
                               )
                      )
             )
   ).