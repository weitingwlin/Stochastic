%% Homework 1: question 3
%
% Wei-Ting Lin   
%
% psID: 1192656
%%
% clean workspace
clear
clc
%%
% set global parameters
global k  a1  a2  ka
%% 
% Set seed
rng(123)
%% case 1
% Parameter set 1
k = 10;      a1 = 10^(-6);  a2 = 10^(-5);  ka =10^(-5) ;
% simulation
tlim = 999;
X0 = [0 0 ];
tic
    [t, x] = chemGillespie(X0, tlim);
seconds = toc
%%
figure
    stairs(t, x(:,1), 'LineWidth',1);hold on
    stairs(t,x(:,2),'LineWidth',1);
    legend('X', 'Y', 'Location','southeast')
    xlabel('time'); ylabel('states (# of X and Y)')
%% case 2
% Parameter set 2
k = 10^3;  a1 = 10^(-4); a2 = 10^(-3);  ka =10^(-3) ;
% simulation
tlim = 9;
X0 = [0 0 ];
tic
    [t, x] = chemGillespie(X0, tlim);
seconds = toc
%%
figure
    stairs(t, x(:,1), 'LineWidth',1);hold on
    stairs(t,x(:,2),'LineWidth',1);
    legend('X', 'Y', 'Location','southeast')
    xlabel('time'); ylabel('states (# of X and Y)')
%% Comparing behavior of the two  cases
% 

