%% 
clear ; clc
global VL taum I Cm J Vth tkick tref 
VL = 0.5;
V0 = 0.5;
taum =1;
Vth = 1;
J = 1; % the kick
I = 0.7;
Cm = 1;
tkick = 0.02;
tref = 0;
%%
clc
[t1, V1, te, ve] = sim_neuronODE2([0 1.5], V0);
    myplot(t1, V1, 'L'); hold on  % -1 so t starts at 0
        hline(Vth, 7, ':')
        xlabel('t');
        ylim([0 2.5])
        set(gca, 'xtick',[],  'ytick',[])
        myLatext(-0.1, 2.5, '$$V$$', 16, 9)
          myLatext(-0.1, Vth, '$$V_{th}$$', 14, 6)
               box off
 %%
figure
mysubplot(1,2,1)
    I = 0.6;
    [t1, V1, te, ve] = sim_neuronODE2([0 4], V0);
    myplot(t1, V1, 'L'); hold on  % -1 so t starts at 0
        hline(Vth, 7, ':')
    title(para2str(I))
    xlabel('t');
    ylim([0 2.5])
    set(gca, 'xtick',[],  'ytick',[])
    myLatext(-0.1, 2.5, '$$V$$', 16, 9)
            myLatext(-0.1, Vth, '$$V_{th}$$', 14, 6)
               box off
mysubplot(1,2,2)
    I = 0.4;
    [t1, V1, te, ve] = sim_neuronODE2([0 4], V0);
    myplot(t1, V1, 'L'); hold on  % -1 so t starts at 0
            hline(Vth, 7, ':')
       title(para2str(I))f
       xlabel('t'); 
       ylim([0 2.5])
           set(gca, 'xtick',[],  'ytick',[])
    myLatext(-0.1, 2.5, '$$V$$', 16, 9)
        myLatext(-0.1, Vth, '$$V_{th}$$', 14, 6)
    box off
%% 9_5
tref = 0.2;
    [t1, V1, te, ve] = sim_neuronODE2([0 2], V0);
    myplot(t1, V1, 'L', 28); hold on  % -1 so t starts at 0
    myplot([1.27 1.47] , [0.3 0.3], 'B', 7 )
        hline(Vth, 7, ':')
        xlabel('t');
        ylim([0 2.5])
        set(gca, 'xtick',[],  'ytick',[])
        myLatext(-0.1, 2.5, '$$V$$', 16, 9)
          myLatext(-0.1, Vth, '$$V_{th}$$', 14, 6)
          myLatext(1.37, 0.25, '$$t_{ref}$$', 16, 8)
               box off
    