function dndt = LVcompODE(t, n)

global k rA rB aA aB bAB bBA
dndt = zeros(2, 1);

 dndt(1) =  rA* n(1) *( 1 - aA*n(1)/k - bAB*n(2)/k);
 dndt(2) =  rB* n(2) *( 1 - aB*n(2)/k - bBA*n(1)/k);
 