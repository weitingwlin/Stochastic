%% Homework 1: question 4
%
% Wei-Ting Lin   
%
% psID: 1192656
%
%%
% clean workspace
clear; clc
%% The Yule process
% Model parameter
    lambda = 1; % per capita birth rate
% Simulation parameters
    n0 = 10 % initial value
    tau= 0.2; % "tau"
    T = 10;  % total time
        points =T/tau; % number of time points in the simulation
% Variable
    N =nan(1, points); % state, population size
    it = 1000; % iteration
    NendPois = nan(1, it);    % end points of the Poisson simulation
    NendNorm = nan(1, it); % end points of the Normal 
%% Poisson algorism
    rng(123)
    figure 
    tic
        mysubplot(1,3,1:2, [], [], 0.1,0.1)
    for i = 1: it
            N( 1 ) = n0;
    %%%% The tau-leaping algoristhm  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            for p = 1: ( points - 1)
                    n = N(  p ); % N at the begining of interval
                    events = random( 'Poisson', tau * lambda * n ) ; % number of events
                    N( p + 1 ) = n + events ;
            end
            if i <= 20 % plot the first  20 trajectories
                    stairs( ( 1 : points ) * tau , N ) ; hold on
            end
            NendPois( i ) = N( end ) ;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        
    end
    second = toc;
            ylim( [ 0 200000 ] );
            vaxis = ylim; % record axis so the can set the next plot
            ylabel( 'n (population size)' ) ; 
            xlabel( 'time' ); 
            title( 'the first 20 trajectories' )
% Plot distribution of states N(T)
    mysubplot( 1, 3, 3, [], [], 0.1, 0.1 )
    histogram( NendPois, ...
                      'Orientation', 'horizontal', ...
                      'BinLimits',  vaxis,  ...
                      'Normalization', 'pdf' )
            haxis = xlim; % record axis so the can set the next plot
            xlabel( 'pdf' ); 
            title( 'Distribution of n(T)' )
            set( gca, 'ytick', [] )
 % make major title
     mysubplot(1,3, 0, {'\tau-leapping simulation (Poisson)',  ...
                                   [num2str(it) ' simulations'], ...
                                   ['simulation time = ' num2str(second) 's']});


 %% Normal algorism
    rng( 123 ) % set seed
    figure
    tic
    mysubplot(1,3,1:2, [], [], 0.1,0.1)
    for i = 1: it
            flag = 1; % include this in records
            N(1) = n0;
     %%%% The tau-leaping algoristhm  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            for p = 1: ( points-1)
                    n = N( p ); % N at the begining of interval
                    rate = tau * lambda * n;
                    events = randn * sqrt( rate ) + rate; % number of events
                                                  % std,           mean
                    N(p+1) = n + events;
                    if   N(p+1) < 0    % normal random variable could give unreasonable negative numbers
                                               % exclude those with negative populations
                            N(p+1) =0;  % 
                            flag = 0;     % this simulation will be excluded in the recorded sample
                    end
            end
     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if i <= 20 % plot the first  20 trajectories
                    stairs((1:points) * tau,N); hold on
            end
            if flag ==  1 % include in the sample
                    NendNorm(i) = N(end);
            end
    end
    second = toc;
            ylim( vaxis );% so it is the same as in the first figure
            ylabel('n (population size)'); 
            xlabel('time'); 
            title('the first 20 trajectories');
 % Plot distribution of states N(T)
    mysubplot( 1, 3, 3, [], [], 0.1, 0.1 )
    histogram( NendNorm, 'Orientation', 'horizontal', 'BinLimits', vaxis,  'Normalization', 'pdf' )
            xlabel( 'pdf' ); 
            title( 'Distribution of N(T)' )
            xlim(haxis); % so it is the same as in the first figure
            set( gca, 'ytick', [] )
% make major title
    mysubplot( 1, 3, 0, { '\tau-leapping simulation (Normal approximation)', ...
                                     [num2str(it)  ' simulations'] , ...
                                     ['simulation time = ' num2str(second) 's']} );
