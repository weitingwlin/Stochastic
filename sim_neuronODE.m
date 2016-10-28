function [t, V] = sim_neuronODE(trange, V0, events)
global VL J tkick tref 
t = [trange(1);  events(1)];
V = [VL; VL];

%stopcount = 0;
for  v = 1:length(events)-1
    [t1, V1] = ode45(@neuronODE, [events(v) events(v+1)],  V0+J);
    t = [t; t1];    
    V = [V; V1];  V0 = V(end);
end
  [t1, V1] = ode45(@neuronODE, [events(end) trange(2)],  V0);
    t = [t; t1];  
    V = [V; V1]; 
