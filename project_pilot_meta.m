
clear
clc
global  k rA rB aA aB bA bB EA EB

k = 100;
k = 100;
rA = 1;     rB = 1;
aA = 1;     aB = 0.5; % carrying capacity : k1 = k/aA, k2 = k/aB 
bA = 0.5;     bB =2; % interspecific effect: alpha = bA, beta = bB/aB  
% k1/alpha >= k2
%  k1>= k2/beta
EA = 0.01;  EB = 0.01; % emigration
 %% calculate stochastic parameters   
    k = 20;
    P = 10; % number of patch
    c = 0.2;
    distance = ones(P)-eye(P); % spatial implicit model, c is a dummy
    disp = disp_incidence(distance,c); % dispersal incidence
    n0 = repmat([2 2 ], P, 1); 

    tlim = 100;
    it = 100;
    ntrace = 10;

%%

[t, x] = LVmetaGillespie(n0, tlim, disp);

x1 = permute(x, [1 3 2]); % so the dimensions are [patch, time, species]
 destiny = sum(x( :, :, end),1);
%  sum_destiny =sum([all(destiny, 2), destiny>1, any(destiny, 2)==0]);
str = para2str(k, EA, EB, P);
%% Demo
figure
mysubplot(P,1,0, str);
for p = 1:P
mysubplot(P,1,p)
    myplot(t, x1(p, :, 1), 'L', 3); hold on
    myplot(t, x1(p, :, 2), 'L', 4);
    axis([0 tlim 0  2.5*k ])
    if p~=P
            set(gca, 'xtick',[])
    end
end
%% 
    it = 2;
    sum_destiny = nan(it, 4);
   str = para2str(k, EA, EB, P);   
 
for i = 1 : it
    [t, x] = LVmetaGillespie(n0, tlim, disp);
    % x1 = permute(x, [1 3 2]); % so the dimensions are [patch, time, species]
    destiny = sum(x( :, :, end),1);
    sum_destiny(i, :) =sum([all(destiny, 2), destiny>1, any(destiny, 2)==0]);
end
