% ODE for logistic equation
function dndt = BDIODE(t, n)
global rB   rD   Im
dndt= (rB - rD) * n  + Im;
