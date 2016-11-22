
clear
clc
global  k rA rB sA sB bAB bBA EA EB

k = 100; % community size
rA = 1;           rB = 1;
sA = 1;           sB = 1; % carrying capacity : k1 = k/aA, k2 = k/aB 
bAB = 0.5;      bBA =2; % interspecific effect: alpha = bA, beta = bB/aB  
P = 20; % number of patch
    c = 0.2;
    distance = ones(P)-eye(P); % spatial implicit model, c is a dummy
    disp = disp_incidence(distance,c); % dispersal incidence
    n0 = repmat([5 5 ], P, 1); 
    tlim = 100;

%% simulation across gradients of dispersal rates
k = 20;
sB = 0.5;
    it = 100;
    rng(1);
    nEsim = 4; % number of levels to simulate
    Esim = logspace(-1, -4, nEsim); % range of dispersal rate to simulate
    Coex = zeros(nEsim); % to record simulation result
    Awin = zeros(nEsim);
    Bwin = zeros(nEsim);
    str = para2str(k,  sB, P, it);   
tic  
for a = 1:nEsim
            EA = Esim(a);
    for b = 1:nEsim
            EB = Esim(b);
            sum_destiny = nan(it, 4);
        for i = 1 : it
            [t, x] = LVmetaGillespie2(n0, tlim, disp);
            xend = sum(x( :, :, end),1);
            sum_destiny(i, :) = sum([all(xend, 2), all(xend>0 == [1 0]), all(xend>0 == [0 1]), any(xend, 2)==0], 1); % [coexist, Awin, Bwin, extinct]
        end
        Coex(a, b) = mean(sum_destiny(:, 1)); % percentage coexistence result
        Awin(a, b) = mean(sum_destiny(:, 2));
        Bwin(a, b) = mean(sum_destiny(:, 3));
    end
end
toc
% save simresult Coex Awin Bwin str 
%%
figure  
    colormap(flipud(gray)) 
    imagesc( flipud(Coex),[0 1]);
        set(gca, 'fontsize', 12, 'linewidth', 2)
        xticks([ 1 2 3 4]); xticklabels({'0.1','0.01','0.001', '0.0001'})
        yticks([ 1 2 3 4]); yticklabels({'0.0001','0.001','0.01', '0.1'})
    colorbar 
        ylabel(colorbar, 'Coexistence Rate', 'fontsize', 14)
        xlabel('E_B'); ylabel('E_A'); 
        title({'Metacommunity results', str{1} })
%%
figure  
green4 =  [linspace(1, 0.1, 64)' linspace(1, 0.5, 64)' linspace(1, 0.1, 64)'];
colormap(green4);
    imagesc( flipud(Bwin),[0 1]);
        set(gca, 'fontsize', 12, 'linewidth', 2)
        xticks([ 1 2 3 4]); xticklabels({'0.1','0.01','0.001', '0.0001'})
        yticks([ 1 2 3 4]); yticklabels({'0.0001','0.001','0.01', '0.1'})
    colorbar 
        ylabel(colorbar, 'B-win', 'fontsize', 14)
        xlabel('E_B'); ylabel('E_A'); 
        title({'Metacommunity results', str{1} })
%%
figure  
blue3 =  [linspace(1, 0, 64)' linspace(1, 0.2, 64)' linspace(1, 0.6, 64)'];
colormap(blue3);
    imagesc( flipud(Awin),[0 1]);
        set(gca, 'fontsize', 12, 'linewidth', 2)
        xticks([ 1 2 3 4]); xticklabels({'0.1','0.01','0.001', '0.0001'})
        yticks([ 1 2 3 4]); yticklabels({'0.0001','0.001','0.01', '0.1'})
    colorbar 
        ylabel(colorbar, 'A-win', 'fontsize', 14)
        xlabel('E_B'); ylabel('E_A'); 
        title({'Metacommunity results', str{1} })