global VL taum J
    VL = 0;
    V0 = 0.5;
    taum =0.2;
    J = 0.2; % the kick
%% simulate Poisson events with inter-event time
    Events = [0]; % 0 is a place-holder
    tlim = 30; % number of events
    lambda = 0.2;
    while Events(end) <= tlim
            mu = rand;
            X = - log(mu)/lambda;
            Events = [Events  X+Events(end)];
    end
    Events = Events(2:end); % remove place-holder
  
     %%

   [t, V] = sim_neuronODE([0 tlim], V0, Events);
 
 myplot(t,V, 'L', 8);
myplot_point(Events, 'L',8);
%% many presynaptic neuron
tsample = 0:0.02:tlim; 
Xsample = zeros(4, length(tsample));
simEvents = [];
    taum =0.5;
    lambda = 0.3;
for i=1:4
     Events = [0]; % 0 is a place-holder
    while Events(end) <= tlim
            mu = rand;
            X = - log(mu)/lambda;
            Events = [Events  X+Events(end)];
    end
    Events = Events(2:end); % remove place-holder
    simEvents{i} = Events;
    [t, V] = sim_neuronODE([0 tlim], V0, Events);
    Xsample(i, :) = fixsample(t, V, tsample);
end
% make the 4th one an inhibitory
Xsample(4,:) = -1*Xsample(4,:);
%%
for i = 1 : 4
    mysubplot(7,1,i)
            myplot(tsample,Xsample(i,:), 'L', 7+i);
             set(gca, 'xtick',[],  'ytick',[])
                 %      myLatext(-0.1, 0, '$$V$$', 16, 6)
end

 mysubplot(7,1,6:7)
            myplot(tsample, sum(Xsample), 'L', 3);
             title('At the post-synaptic neuron')
             set(gca, 'xtick',[],  'ytick',[])
                  xlabel('t')
                    myLatext(-0.1, 0, '$$V$$', 16, 6)