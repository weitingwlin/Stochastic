%% HW2_3
%  Wei-Ting Lin
    clear; clc
%%
% set global parameters
global k  gA gB dA dB alpha0 alpha1
% use the default parameter set as in Figure 3, 
% but leave k and alpha0 flexible
    gA = 0.2;      gB = 0.2;
    dA = 0.005;  dB = 0.005;
    alpha1 = 0.01; 
    X0 = [gA/dA, 0, 0 0]; % the initial value   
%% k = 50
   k = 50;
       alpha0 = alpha1*k; 
       tlim = 2e6;
%
rng(1)
    [t, x] = switchGillespie(X0, tlim);
% plotting the results
script_plot_switchGillespie
%%  k = 1
   k = 1;
       alpha0 = alpha1*k; 
       tlim = 2e5;
%
rng(1)
    [t, x] = switchGillespie(X0, tlim);
% plotting the results
script_plot_switchGillespie
%%  k = 0.05
   k = 0.05;
       alpha0 = alpha1*k; 
       tlim = 2e4;
%
rng(1)
    [t, x] = switchGillespie(X0, tlim);
% plotting the results
script_plot_switchGillespie
%%
% note that the time scales (x-axes) are different in the two plots
% with larger k (k = 50), the switching  between the two states was much
% longer, and between the switch