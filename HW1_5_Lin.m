%% Homework 1: question 5
%
% Wei-Ting Lin   
%
% psID: 1192656
%% The Birth-Death-Immigration model 
% $$\frac{dn}{dt} = (\lambda - \mu)n-\upsilon$$
% 
% 1. Show that the mean of the of the corresponding stochastic model, ?n, equals the solution of
% this differential equation, with an appropriate initial condition. 
%
% 2. Give an example to show that this is not true for more general birth and death processes with immigration, 
% and illustrate the example numerically.
%
% clean workspace and set parameters
clear;clc

%% Parameters
global rB   rD   Im
    rB = 1; rD = 1.2; Im = 2;
% equilibrium:
    n_fp = Im/(rD - rB);
% simulation
    tlim = 30;
    n0 = 1;
    it = 100; % interation of simulation
%% ODE
    rng(123); % set seed
    [t1, ns1] = ode45('BDIODE',[1 tlim],  1);
% Figure
    myplot(t1-1, ns1, 'L'); hold on  % -1 so t starts at 0
    hline(n_fp);
        xlabel('time');    
        ylabel('n');
        legend('ODE simulation','Fix point', 'Location','northwest')
        title('ODE of logistic equation')
%% Gillespie Simulation
rng(123)
for i=1:10
    [t, x] = BDIGillespie(n0, tlim);
    stairs(t,x); hold on
end
% re-plot so they lay on top
    myplot(t1-1, ns1, 'L'); hold on  % -1 so t starts at 0
    hline(n_fp);
    xlim([1 tlim]);
     xlabel('time');    
      ylabel('n');
    title('Stochastic (10 simulations) vs. ODE')
%%  ODE vs. stochastic mean
    tsample = 0 : 0.01 : tlim; 
    xsample = nan(it, length(tsample));
    rng(123)
    for i = 1 : it
            [t, x] = BDIGillespie(n0, tlim);
            xsample(i, :) =  fixsample(t,x, tsample);
    end
% plot ODE vs. stochastic mean
    figure
            myplot(t1, ns1, 'L'); hold on
            myplot(tsample, mean(xsample), 'L', 2);
            legend('ODE prediction', ['Mean of ' num2str(it) ' simulations'])
            xlabel('time')
            ylabel('n')
            title('mean of stochastic populations vs. ODE ')

%% General case
% an example is a logistic equation; can be viewed as a special case of
% Birth-Death-Imigration process with immigration = 0
% 
% $$\frac{dn}{dt} = rn(1-\frac{n}{K})$$
% 
% , where r = b1 - d1,  K = r / (d2 - b2).
%
% I chose the parameters so the system has the same fix point as the first
% case
%% Parameters
    global b1 b2 d1 d2 r K
    b1 = 11; b2 = 1;
    d1 = 1;  d2 = 2;
    r = b1 -d1;          % the intrinsic growth rate
    K = r/(d2-b2);   % the carrying capacity; also is the theoretical fixed point
    tlim =5;
%% ODE
    rng(1)
    [t3, ns3] = ode45('logisticODE',[1 tlim+1],  n0);
 
%% Gillespie simulation
   figure
        myplot(t3-1, ns3, 'L'); hold on
        hline(K);
% do simulation
for i=1:7
    [t, x] = logisticGillespie(n0, tlim);
     stairs(t, x); hold on  % -1 s
end
% plot3_2_3
      hline(K);
      myplot(t3-1, ns3, 'L'); % plot again so this line is on top
       ylimits = ylim;
       axis([ 0  tlim ylimits])
        legend('ODE prediction', 'K')
        xlabel('time')
        ylabel('n')
        title('Stochastic logistic equation')
%% Mean of stochastic populations vs. ODE prediction
    tsample = 0 : 0.01 : tlim; 
    xsample = nan(it, length(tsample));
    for i = 1 : it
            [t, x] = logisticGillespie(n0, tlim);
            xsample(i, :) =  fixsample(t,x, tsample);
    end
% plot
    figure
        myplot(t3-1, ns3, 'L'); hold on
        myplot(tsample, mean(xsample), 'L', 2);
            legend('ODE prediction', ['Mean of ' num2str(it) ' simulations'])
            xlabel('time')
            ylabel('n')
            title('Stochastic vs. ODE logistic equation')