% used in `HW3_2Lin`
function [X, t] =  MarkovEM(X0, T, dt)

    N = T/dt;
 
    dW = sqrt(dt) * randn(1, N);
    W = cumsum(dW, 2);
 
    X = zeros( 1, N ) ;
    t = [ dt : dt : T ];
    
     Xt = X0;
     
 for i = 1: N
     Xt = Xt + dt *(-1)* Xt*(Xt + 1.5)*(Xt -1.7)  + 1 *dW(i);
    
     X(i) = Xt;
 end