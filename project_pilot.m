% The pilot analysis of the course project
clear; clc
%% parameters
% The stochastic  parameters
global bA1 bA2 bA3 dA1 dA2 dA3  bB1 bB2 bB3 dB1 dB2 dB3
% The deterministic parameters
global k rA rB aA aB bA bB

k = 100;
rA = 1;     rB = 1;
aA = 2;     aB = 1;
bA = 2;    bB = 1;
% with this set of parameters  species B always win 
%% simulation parameters
tlim =20 ;
n0 = [1 1];
rng(1)
%
% plot ODE prediction
    [t, ns] = ode45('LVcompODE',[1 tlim+1],  n0);
    figure
    myplot(t-1, ns(:,1), 'L'); hold on
    myplot(t-1, ns(:,2), 'L', 4); 
    xlabel('time'); ylabel('Population'); title('ODE simulation')
    legend('Species A','Species B')

 %% calculate stochastic parameters   
  k = 20
    dA1 = 1;         bA1 = rA + dA1;                  
    dB1 = 1;         bB1 = rB + dB1;
    bA2 = 1/k;    dA2 = (rA*aA + 1)/k;
    bB2 = 1/k;    dB2 = (rB*aB + 1)/k;
    bA3 = 1/k;    dA3 = (rA*bA + 1)/k; 
    bB3 = 1/k;    dB3 = (rB*bB + 1)/k;

%%
tlim = 20;
it = 100;
n0 = [10 10]; 
% n0 = [2 2];
%%
destiny = nan(it, 2);
rng(1)
figure
mysubplot(1, 5, 1:4)
    for i = 1:it
            [t, x] = LVcompGillespie(n0, tlim);
            if i <= 10
                    stairs(t, x(:,1),'color', mycolor(3)); hold on  % -1 s
                    stairs(t, x(:,2),'color', mycolor(4)); hold on  % -1 s
            end
            destiny(i, :) = x(end, :);
    end
            xlim([0  tlim]);
            set(gca, 'linewidth', 2);
            xlabel('Time', 'fontsize',14); ylabel('Population', 'Fontsize', 14); title('First 10 simulations', 'Fontsize', 14);
            legend('Species A','Species B')
    mysubplot(1, 5, 5)
            sum_destiny =sum([all(destiny, 2), destiny>1, any(destiny, 2)==0]);
            mystackbar(sum_destiny, [1 3 4 40])
            title('Destiny')  
            legend('empty', 'A win', 'B win', 'coexist')

            parastr = para2str(tlim, n0, it, k, aA, aB, bA, bB, [3, 5])      
            mysubplot(1, 5, 0,{'Gillespie simulation', parastr{:}})  