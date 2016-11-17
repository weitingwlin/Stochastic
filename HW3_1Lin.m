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

T = 3000;
dt = 0.01;
it = 10000; 
V0 = 0;
N = T/dt; 
smax = 2
%Vs = zeros(it, N);
ss = zeros(it, smax);
plotn = 5;
%%
rng(2)
tic
for i = 1 : 10
 [V, t, s] =  LIFbpath( V0, sig, T, dt , smax) ;
 ss(i, : )= s;
        if i <= plotn 
            mystairs(t, V, i+21 ) ; hold on
        end
end
toc
% Rate having 2 passages:
    mean(sum(ss, 2) >=2) 
    xlabel('Time')
    ylabel('V(t)')
    title(['Trace of 5 realizations']) 
    
%% first passage time
    figure
    str1 =para2str(gamma, I);
    histogram(ss(:,1), 'normalization', 'pdf')
        title({'First passage time', str1{1}})
%% 1st - 2nd
    myplot(ss(:,1), ss(:,2)-ss(:,1));
    xlabel('First inter-spike interval')
    ylabel('Second inter-spike interval')
%% 
gamma = -1;
I=1.1;
it = 1;
T=3;
%%
rng(2)
tic
for i = 1 : 10
 [V, t, s] =  LIFbpath( V0, sig, T, dt , smax) ;
 ss(i, : )= s;
        if i <= plotn 
            mystairs(t, V, i+21 ) ; hold on
        end
end
toc
    xlabel('Time')
    ylabel('V(t)')
    title(['Trace of 5 realizations']) 
    