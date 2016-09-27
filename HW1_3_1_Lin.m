%% Homework 1: question 3
%
% Wei-Ting Lin   ( psID: 1192656)
%%
% clean workspace
    clear; clc
%%
% set global parameters
global k  a1  a2  ka
    X0 = [0, 0];
    it = 100;
%% 
% Set seed

%% case 1
% Parameter set 1
    k = 10;      a1 = 10^(-6);  a2 = 10^(-5);  ka =10^(-5) ;
% simulation
    tlim = 300;
    it = 100;
%%
        xend = zeros(1, it);
        yend = zeros(1, it);
    figure
    mysubplot(1,5,1:3, [], [], 0.1,0.1)
    tic
        rng(123)
        for j = 1:it
        %%%%%%%%%%% simulation   %%%%%%%%%%%%%%%   
                    [t, x] = chemGillespie(X0, tlim);
                            xend(j) = x(end, 1); % record the end point of x
                            yend(j) = x(end, 2); %  
                % plot  the first 15 trajectories
                 if j <= 15
                    stairs(t, x(:,1), 'LineWidth',1, 'color', mycolor(11));hold on
                    stairs(t,x(:,2),'LineWidth',1, 'color', mycolor(13)); hold on
                 end
                                        
        end    
        toc
                   xlabel('time'); ylabel('[X](t) or [Y](t)')
                   xlim([0 tlim])
                         title('the first 15 trajectories')
                        legend('X', 'Y', 'Location','southeast')
                        vaxis = ylim;
   % plot the stationary distribution of X
    mysubplot(1,5,4, [], [], 0.1,0.1)
            histogram(xend,'Orientation','horizontal','BinLimits', vaxis,  'Normalization','pdf'); hold on
            set(gca, 'ytick', []); ylim(vaxis)
            xlabel('pdf'); title('[X] dist.')
    % plot the stationary distribution of Y        
    mysubplot(1,5,5, [], [], 0.1,0.1)
            histogram(yend,'Orientation','horizontal','BinLimits', vaxis,  'Normalization','pdf'); hold on
            set(gca, 'ytick', [])
            xlabel('pdf'); title('[Y] dist.')
%% case 2
% Parameter set 2
    k = 10^3;  a1 = 10^(-4); a2 = 10^(-3);  ka =10^(-3) ;
% simulation
    tlim = 300;
 it = 100;
            xend = zeros(1, it);
            yend = zeros(1, it);
%%  simulation          
    figure
    mysubplot(1,5,1:3, [], [], 0.1,0.1)
    tic
        rng(123)
        for j = 1:it
                % simulation   
                    [t, x] = chemGillespie(X0, tlim);
                % plot
                 if j <= 15
                    stairs(t, x(:,1), 'LineWidth',1, 'color', mycolor(11));hold on
                    stairs(t,x(:,2),'LineWidth',1, 'color', mycolor(13)); hold on
                 end
                    xend(j) = x(end, 1); % record the end point of x
                    yend(j) = x(end, 2); %                                         y
         end      
    toc
                   xlabel('time'); ylabel('[X](t) or [Y](t)')
                   xlim([0 tlim])
                         title('the first 15 trajectories')
                        legend('X', 'Y', 'Location','southeast')
                        vaxis = ylim;
    mysubplot(1,5,4, [], [], 0.1,0.1)
            histogram(xend,'Orientation','horizontal','BinLimits', vaxis,  'Normalization','pdf'); hold on
            set(gca, 'ytick', [])
            xlabel('pdf'); title('[X] dist.')
    mysubplot(1,5,5, [], [], 0.1,0.1)
            histogram(yend,'Orientation','horizontal','BinLimits', vaxis,  'Normalization','pdf'); hold on
            set(gca, 'ytick', [])
            xlabel('pdf'); title('[Y] dist.')