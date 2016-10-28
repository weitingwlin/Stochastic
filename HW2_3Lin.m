%% Simulation of an exclusive genetic switch
%  Wei-Ting Lin    
%  
% Simulation part of Homework 2.3
%
%% set parameters
% I used the default parameter set as in Figure 3, 
% but leave alpha0 flexible (the value depends on k).
    clear; clc
global k  gA gB dA dB alpha0 alpha1
    gA = 0.2;      gB = 0.2;
    dA = 0.005;  dB = 0.005;
    alpha1 = 0.01; 
 % initial value, as in the text    
    X0 = [gA/dA, 0, 0 0];      % [A B rA rB]   
    rng(1) % set seed
%% Simulations
%
%  I used the Gillespie method to simulate the system with k = 50, k = 1, k
%  = 0.05, and k = 0.005.
%  
%%
% *k = 50*
   k = 50;
       alpha0 = alpha1*k; 
       tlim = 2e6;
% Simulation:
    [t, x] = switchGillespie(X0, tlim); 
% Plotting the results: The plotting scripts are saved in a separate m-file
    script_plot_switchGillespie
%%  
% *k = 1*
   k = 1;
       alpha0 = alpha1*k; 
       tlim = 2e5;
% simulation
    [t, x] = switchGillespie(X0, tlim);
% plotting the results
    script_plot_switchGillespie
%%  
% *k = 0.05*
   k = 0.05;
       alpha0 = alpha1*k; 
       tlim = 2e4;
% simulation
    [t, x] = switchGillespie(X0, tlim);
% plotting the results
    script_plot_switchGillespie
%%  
% *k = 0.005*
   k = 0.005;
       alpha0 = alpha1*k; 
       tlim = 2e4;
% simulation
    [t, x] = switchGillespie(X0, tlim);
% plotting the results
    script_plot_switchGillespie
%% Synopsis
% (Note that the time scales (x-axes) are different in the four plots.)
%
% The switching time between the two states increased with increasing k (increasing alpha0, the binding rate). 
%
% With larger k (k = 50 and k = 1) and NA and NB reach the "carrying
% capacity" (g/d, the gray lines) between the switches, and the exclusive binding site was
% occupied most of the time (rA = 1 or rB = 1).
%
% With small k (k = 0.05 and k = 0.005),  NA and NB both fluctuate about
% the the carrying capacity, the switches is much more frequent and thus
% not obvious on the plots.  The exclusive binding site was not occupied
% for a lot of times points (rA = rB = 0), thats when the fluctuatuation of NA and NB
% seem unrelated.
% 