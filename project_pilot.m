% The pilot analysis of the course project
clear; clc
%% parameters
% The stochastic  parameters
global bA1 bA2 bA3 dA1 dA2 dA3  bB1 bB2 bB3 dB1 dB2 dB3
% The deterministic parameters
global k rA rB aA aB bA bB

k = 100;
rA = 1;     rB = 1;
aA = 1;     aB = 0.5; % carrying capacity : k1 = k/aA, k2 = k/aB 
bA = 0.5;     bB =2; % interspecific effect: alpha = bA, beta = bB/aB  
% k1/alpha >= k2
%  k1>= k2/beta
% with this set of parameters  species A always win 
%% simulation parameters
tlim =40 ;
n0 = [ 1 10];
rng(1)
%
% plot ODE prediction
    [t, ns] = ode45('LVcompODE',[1 tlim+1],  n0);
    figure
    myplot(t-1, ns(:,1), 'L'); hold on
    myplot(t-1, ns(:,2), 'L', 4); 
    xlabel('time'); ylabel('Population'); title({'ODE simulation', para2str(k)})
    legend('Species A','Species B')
%% landscape
dnAdt = nan(k + 1);
dnBdt = nan(k + 1);
for nA = 0 : k
        for nB = 0 : k
                dnAdt(nA+1, nB+1) = rA* nA *( 1 - aA*nA/k - bA*nB/k);
                dnAdt(nA+1, nB+1) =  rB* nB *( 1 - aB*nB/k - bB*nA/k);
        end
end
    cmap = mycolor('redblue')   ;
colormap(cmap); 
image(dnAdt); caxis([-1 1]); colorbar

 %% calculate stochastic parameters   
    k = 50;
    n0 = [10 10 ]; %     n0 = [2 2 ];       n0 = [2 10 ];
    it = 100;
    ntrace = 10;

%% A demograph
rng(1)
for k = [20 50 100]
script_plot_project_DEMO
end
%% Get destiny
    it = 10;
    n0spec = [10 10; 2 2 ; 2 10]; 
    kspec = 20:10:200;
    indDetS = [];
    indEmpS = [];
 parastr = para2str(tlim, it, n0, k , [2 2 ]);
tic
for n =1: length(n0spec)
        n0 = n0spec(n, :);
        indDet =zeros(length(kspec), 1);
        indEmp =zeros(length(kspec), 1);
        for j = 1:length(kspec)
                destiny = nan(it, 2);
                k = kspec(j);
            for i = 1:it
                [t, x] = LVcompGillespie(n0, tlim);
                destiny(i, :) = x(end, :);
            end  
            sum_destiny =sum([all(destiny, 2), destiny>1, any(destiny, 2)==0]);
        indDet(j) = sum_destiny(2) / (sum_destiny(2) + sum_destiny(3));
        indEmp(j) = sum_destiny(4)/it;
        end
        indDetS{n} = indDet;
        indEmpS{n} = indEmp;
        
end
 toc
 %% 
for n = 1:3
    figure
n0 = n0spec(n, :);
 parastr = para2str(tlim, it, n0);
 mysubplot(1, 2, 0, {'Local competition results', parastr{:}})
 mysubplot(1, 2, 1)
    myplot(kspec, indDetS{n}(1:19));
        xlabel('k')
        ylabel('Determinitic index')
        axis([kspec(1) kspec(end) 0 1])
mysubplot(1, 2, 2)       
    myplot(kspec, indEmpS{n});
        xlabel('k')
        ylabel('Extinction index')
             axis([kspec(1) kspec(end) 0 1])
end