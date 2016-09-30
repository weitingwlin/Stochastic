
function [t, X, E] = SIRGillespie(X0, tlim)
%% Use global parameters
global b r N
%% reactiona and vectors
% * reaction 1: S + I --> I
% * reaction 2: I --> R
v = [];
v{1} = [-1 1 0]; v{2} = [0 -1 1]; v{3} = [0 0 0];
%%
S = length(X0);     % number of species
t = zeros(1e6,1);   % 
X = zeros(1e6,S);
E = zeros(1e6,1); % record events
X(1, :) = X0; 
point = 1;              % keep track of points: a point can be any change in state

while t(point) < tlim
    % 1. calculate rate of each event
        rates = [b/N *X(point, 1)*X(point, 2),  ... 
                    r*X(point, 2)]; 
        a0 = sum(rates, 2); % the rate that "any" event happens   
    % 2. inter event time
        t(point+1) = t(point) + log(1/rand)/a0; % Calculating the interevent time.
    % 3. witch event
        if X(point, 2) > 0
                eventID = datasample(1:2, 1, 'weight', rates); 
        else
                eventID = 3; % nothing happens
        end
        E(point+1) = eventID; %record event
        
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