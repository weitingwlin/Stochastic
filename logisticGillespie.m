function [t, X] = logisticGillespie(X0, tlim)
%% Use global parameters
global b1 b2 d1 d2
% process
v=[];
v{1} = 1;  % birth
v{2} = -1; % death
v{3} = 0; % a pseudo-event: maintain extinct
%%
S = length(X0);     % number of species
t = zeros(1e6,1);   % 
X = zeros(1e6,S);
X(1, :) = X0; 
point = 1;              % keep track of points: a point can be any change in state
% X0=n0
while t(point) < tlim
    
        n = X(point);
    % 1. calculate rate of each event
        rates = [b1*n + b2*n^2 , ...
                     d1*n + d2*n^2 ]; 
        a0 = sum(rates, 2); % the rate that "any" event happens
    
    % 2. inter event time
        t(point+1) = t(point) + log(1/rand)/a0; % Calculating the interevent time.
    % 3. witch event
     %   eventID = datasample(1:2, 1, 'weight', rates); 
        if n>0
            eventID = min(find(rand < cumsum(rates/a0))); % like the above but zero-prove
        else
            eventID = 3;
        end
     % 4. update state                                       
        X(point+1, :) = X(point, :) + v{eventID}; % Updating the state.
    % 5. update the point counter.
        point = point + 1;  
end

%%
% The last thing we do is get rid of the memory that was not use during the
% simulation and we are done.
t = t(1:point);
X = X(1:point,:);