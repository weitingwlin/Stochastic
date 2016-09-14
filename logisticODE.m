% ODE for logistic equation
function dndt = logisticODE(t, n)
global r K
dndt= r*n*(1 - n./K);
