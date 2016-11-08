%% LIF model
clear
clc
%%
global Vreset Vthresh gamma I
Vreset = 0;
Vthresh = 1;
gamma = 0;
I = 0;
sig = 0.1;

T = 100;
dt = 0.01;
it = 10; 
V0 = 0;
%%
rng(2)
for i = 1 : it
 [V, t] =  LIFbpath( V0, sig, T, dt ) ;
 mystairs(t, V, i ) ; hold on
end
%% 
gamma = -1