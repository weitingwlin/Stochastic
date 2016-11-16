function [X, t] =  OU_EM(X0, T, dt)

global k D
    N = T/dt;
 
    dW = sqrt(dt) * randn(1, N);
    W = cumsum(dW, 2);
 
    X = zeros( 1, N ) ;
    t = [ dt : dt : T ];
    
     Xt = X0;
     
 for i = 1: N
     Xt = Xt + dt *k * Xt + sqrt(D) *dW(i);
    
     X(i) = Xt;
 end