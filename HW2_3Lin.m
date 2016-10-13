% HW2_3
% clean workspace
    clear; clc
%%
% set global parameters
global k  gA gB dA dB alpha0 alpha1
    k = 20;
    gA = 0.2;      gB = 0.2;
    dA = 0.005;  dB = 0.005;
    alpha0 = 0.2; 
    alpha1 = alpha0/k; 
%%
    X0 = [gA/dA, 0, 0 0];
    it = 1;
    tlim = 1e6;
    
%%
rng(1)
tic
    [t, x] = switchGillespie(X0, tlim);
toc
%% 
    mysubplot(6, 1, 0, 'Exclusive switch')
    mysubplot(6,1,1:2)
        stairs(t, x(:,1), 'LineWidth',1, 'color', mycolor(39));hold on
        ylabel('N_A')
    mysubplot(6,1,3:4) 
        stairs(t,x(:,2),'LineWidth',1, 'color', mycolor(38)); hold on
          ylabel('N_B')
    mysubplot(6,1,5)  
        stairs(t, x(:,3), 'LineWidth',1, 'color', mycolor(39));hold on
          ylabel('r_A')
    mysubplot(6,1,6)    
        stairs(t,x(:,4),'LineWidth',1, 'color', mycolor(38)); hold on
          ylabel('r_B')
          xlabel('time')
            