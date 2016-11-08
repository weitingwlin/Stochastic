function [V,t] =  LIFbpath(V0, sig, T,dt)
global Vreset Vthresh gamma I

 N = T/dt;
 dW = sqrt(dt) * randn(1, N);
 W = cumsum(dW, 2);
 
 V = zeros(1, N);
 t = [dt:dt: T];
 Vtemp = V0;
 %  myplot(t,W);
 for i = 1: N
     Vtemp = Vtemp + dt * (I - gamma*Vtemp) +sig *dW(i);
     if Vtemp >= Vthresh
            Vtemp = Vreset;
     end
     V(i) = Vtemp;
 end
 
 