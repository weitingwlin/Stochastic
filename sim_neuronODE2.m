function [t, V, te, ve] = sim_neuronODE2(trange, V0)
global VL J tkick tref
t = [];
V = [];
t0 = trange(1);
%stopcount = 0;
while  t0 < trange(2) 
 options = odeset('Events',@myevent);
 [t1, V1,te, ve] = ode45(@neuronODE2, [t0 trange(2)],  V0, options);
 
 t = [t; t1];    t0 = t(end);
 V = [V; V1];  V0 = V(end);
      if ~isempty(ve)
                 t = [t; t1(end)+tkick; t1(end)+tkick];  t0 = t(end) + tref ;
                 V = [V; V(end)+J; VL];    V0=VL;
        end
% stopcount =  stopcount+1;


end
   function [value, isterminal, direction] = myevent(t, V)
     global  Vth
        value = V - Vth;  % when value = 0, an event is triggered
        isterminal = 1; % terminate after the first event
        direction = 0;  % get all the zeros
   end
end

