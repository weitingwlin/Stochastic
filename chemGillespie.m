
function [t, X] = chemGillespie(X0, tlim)
%% Use global parameters
global k  a1  a2  ka
%% reactiona and vectors
% * reaction 1: A --> X
% * reaction 2: B --> Y
% * reaction 3: X -->
% * reaction 4: Y -->
% * reaction 5: X + Y --> C
% There are five reactions
v = [];
v{1} = [1 0]; v{2} = [0 1];  v{3} = [-1 0];  v{4} = [0 -1];  v{5} = [-1 -1];
%%
S = length(X0);     % number of species
t = zeros(1e6,1);   % 
X = zeros(1e6,S);
X(1, :) = X0; 
point = 1;              % keep track of points: a point can be any change in state


while t(point) < tlim
    % 1. calculate rate of each event
        rates = [k,  ...
                k,  ...
                a1*X(point, 1),  ... %
                a2*X(point, 2),  ... 
                ka*X(point, 1)*X(point, 2)]; 
        a0 = sum(rates, 2); % the rate that "any" event happens
    
    % 2. inter event time
        t(point+1) = t(point) + log(1/rand)/a0; % Calculating the interevent time.
    % 3. witch event
        eventID = datasample(1:5, 1, 'weight', rates); 
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