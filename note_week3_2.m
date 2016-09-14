% note week 3
% logistic equation ODE
%% ODE simulation 
global K r
% parameter
K = 10;
r = 10;
%%
% simulation
[t1, ns1] = ode45('logisticODE',[1 4],  0.01);
[t2, ns2] = ode45('logisticODE',[1 4],  15);
%%
% plot3_2_3
figure
    myplot(t1-1, ns1, 'L'); hold on  % -1 so t starts at 0
    myplot(t2-1, ns2, 'L', 8);
    hline(K, 7 ,':')
        legend('n_0 =  0.01','n_0 = 15', 'K', 'Location','southeast')
        xlabel('time')
        ylabel('n')
        title('ODE of logistic equation')
%%
clear;clc
%% Simulation with  Gellispie method
% Parameter set 1
global b1 b2 d1 d2

b1 = 11; b2 = 1;
d1 = 1;  d2 = 2;
r = b1 -d1;
K = r/(d2-b2);
tlim =5 ;
n0 = 1;
rng(1)
%
% plot ODE prediction
    [t3, ns3] = ode45('logisticODE',[1 tlim+1],  n0);
    figure
    myplot(t3-1, ns3, 'L'); hold on
        hline(K, 7 ,':');
% do simulation
tic
for i=1:7
    [t, x] = logisticGillespie(n0, tlim);
     stairs(t, x); hold on  % -1 s
end
seconds = toc
%
% plot3_2_3
  %  stairs(t, x); hold on  % -1 so t starts at 0
      hline(K, 7 ,':');
   myplot(t3-1, ns3, 'L'); % plot again so this line is on top
    ylimits = ylim;
    axis([ 0  tlim ylimits])
        legend('ODE prediction', 'K')
        xlabel('time')
        ylabel('n')
        title('Stochastic logistic equation')
%% stochastic mean population
tsample = 0 : 0.01 : tlim; 
it =1000;
xsample = nan(it, length(tsample));
tic
for i = 1 : it
    [t, x] = logisticGillespie(n0, tlim);
    xsample(i, :) =  fixsample(t,x, tsample);
end
seconds = toc

%% plot ODE vs. stochastic mean
figure
    myplot(t3-1, ns3, 'L'); hold on
    myplot(tsample, mean(xsample), 'L', 2);
     legend('ODE prediction', ['Mean of ' num2str(it) ' simulations'])
        xlabel('time')
        ylabel('n')
        title('Stochastic vs. ODE logistic equation')