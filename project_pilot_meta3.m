
clear
clc
k = 100; % community size
sB = 1;
% k1/alpha >= k2
%  k1>= k2/beta
EA = 0.01;  EB = 0.01; % emigration
 %% calculate stochastic parameters   
    k = 20;
    P = 20; % number of patch
    c = 0.2;
    distance = ones(P)-eye(P); % spatial implicit model, c is a dummy
    disp = disp_incidence(distance,c); % dispersal incidence
    n0 = repmat([2 2 ], P, 1); 

    tlim = 100;
    it = 1;
    ntrace = 10;

%%
% LVmetaGillespie3(X0, tlim, disp, k , sB, EA, EB)
tic
[t, x] = LVmetaGillespie3(n0, tlim, disp, k , sB, EA, EB);
toc
x1 = permute(x, [1 3 2]); % so the dimensions in x1 are [patch, time, species]
 destiny = sum(x( :, :, end),1);
%  sum_destiny =sum([all(destiny, 2), destiny>1, any(destiny, 2)==0]);
str = para2str(k, EA, EB, sB, P);
%% Demo
Pshow=10
figure
mysubplot(Pshow,1,0, str);
for p = 1:Pshow
mysubplot(Pshow,1,p)
    myplot(t, x1(p, :, 1), 'L', 3); hold on
    myplot(t, x1(p, :, 2), 'L', 4);
    axis([0 tlim 0  2.5*k ])
    if p~=Pshow
            set(gca, 'xtick',[])
    end
end
%% 
k = 20;
sB=0.5;
    it = 100;
    rng(1);
    nEsim = 4; % number of levels to simulate
    Esim = logspace(-1, -4, nEsim); % range of dispersal rate to simulate
    Coex = zeros(nEsim); % to record simulation result
    Awin = zeros(nEsim);
    Bwin = zeros(nEsim);
    str = para2str(k,  sB, P);   
tic  
parfor a = 1:nEsim
            EA = Esim(a);
    for b = 1:nEsim
            EB = Esim(b);
            sum_destiny = nan(it, 4);
        for i = 1 : it
            [t, x] = LVmetaGillespie3(n0, tlim, disp,k, sB, EA, EB);
            xend = sum(x( :, :, end),1);
            sum_destiny(i, :) = sum([all(xend, 2), all(xend>0 == [1 0]), all(xend>0 == [0 1]), any(xend, 2)==0], 1); % [coexist, Awin, Bwin, extinct]
        end
        Coex(a, b) = mean(sum_destiny(:, 1)); % percentage coexistence result
        Awin(a, b) = mean(sum_destiny(:, 2));
        Bwin(a, b) = mean(sum_destiny(:, 3));
    end
end
toc