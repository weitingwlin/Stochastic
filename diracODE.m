function dy = diracODE(t, y)
mu = 0.2;
 dy = mu*dirac(t - 3)*sin(t);