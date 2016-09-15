%% Homework 1: question 5
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
global rB   rD   Im
%% 
% Set seed
rng(123)

%% Parameters
rB = 1; rD = 1.2; Im = 2;
% the equilibrium n* = 10
% simulation
tlim = 20;
n0 = 10;
%% simulation
tic
    [t, x] = BDIGillespie(n0, tlim);
seconds = toc
%%
figure
    stairs(t, x, 'LineWidth',1);hold on
    xlabel('time'); ylabel('states (n )')