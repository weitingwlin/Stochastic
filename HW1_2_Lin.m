%% Homework 1: question 2
%
% Wei-Ting Lin   
%
%% Explore theoretical waiting time for the "explosive system"
% clean workspace
    clear; clc
% set global parameter
    global k 
        k = 1.5;    
    for n = 1:20
            N = 1:n; % the N-th event
            t_exp(n) = sum(1./(k .^N)); % time for the n events to happend
    end
    % expected time for population to reach infinity    
    t_exp_infty = 1/k * (1/ (1- (1./(k))));
% plot expected waiting time    
    figure
    myplot(1:20, t_exp, 'B');
        xlabel('state (n)'); ylabel('expect waiting time')
    title({'The "explosive dynamic": $$\lambda_n = k^n $$'}, ...
        'Interpreter','latex',...
        'fontsize', 16);
    text(3, 1, ...
        {'Expected time for populaton to go infinity',...
                ['        $$\sum_{n=1}^{\infty} \frac{1}{\lambda_n} = $$' , num2str(t_exp_infty)]}, ...
        'Interpreter','latex',...
        'fontsize', 14);
 %% simulation
    tlim = 1.5;
    X0 =2;
    figure
        mysubplot(2,1,1)
        rng(1); % set seed
            vline(tlim, 7,':');hold on
        for i =1:20
                [t, x] = explodGillespie(X0, tlim);
                stairs(t,x, 'LineWidth',1, 'color', mycolor(i));hold on     
        end
                vline(tlim, 7,':');% replot so it's on top
                legend('tlim', 'simulation 1', 'simulation 2', 'simulation 3', '...')
                ylabel('state(n)'); 
                title('"Explosive" pure birth process')
                axis([ 0 2 0 2000])
        mysubplot(2,1,2)
        rng(1); % set seed; so this will be identical simulations
        for i =1:20 
                [t, x] = explodGillespie(X0, tlim);
                stairs(t,x, 'LineWidth',1, 'color', mycolor(i));hold on     
        end      
                axis([ 0 2 0 25])
                vline(tlim, 7,':')
                ylabel('state(n)'); 
                xlabel('time'); 
                title('close-up look')
 
          
          