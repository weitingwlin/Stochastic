% Simulation of LIF model with Brownian movement part
%  
function [V,t, s] =  LIFbpath(V0, sig, T,dt, smax)
global Vreset Vthresh gamma I

 N = T/dt;
 dW = sqrt(dt) * randn(1, N);
 W = cumsum(dW, 2);
 
 V = zeros(1, N);
 s = nan(1, smax);
 t = [dt:dt: T];
 Vtemp = V0;
 %  myplot(t,W);
 sc =1; % count of s
 for i = 1: N
     Vtemp = Vtemp + dt * (I - gamma*Vtemp) +sig *dW(i);
     if Vtemp >= Vthresh
            Vtemp = Vreset;
            if sc <= smax
                s(sc) = t(i); % record a spike
                sc = sc+1;
            end
     end
     V(i) = Vtemp;
 end
 
 