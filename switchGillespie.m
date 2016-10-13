% Gillespie function used in HW2_3Lin.m
function [t, X, E] = switchGillespie(X0, tlim)
%% reactiona and vectors
% There are 8 reactions; outcome of each is:
v = []; % (A, B, rA, rB)
v{1} = [1 0 0 0];      % * reaction 1:     --> A
v{2} = [0 1 0 0];     % * reaction 2:     --> B
v{3} = [-1 0 0 0];    % * reaction 3: A  -->
v{4} = [0 -1 0 0];    % * reaction 4: B  -->
v{5} = [-1 0 1 0];    % * reaction 5: A  --> rA
v{6} = [0 -1 0 1];    % * reaction 6: B  --> rB
v{7} = [1 0 -1 0];    % * reaction 7: rA --> A
v{8} = [0 1 0 -1];    % * reaction 8: rB --> B
%%
global gA gB dA dB alpha0 alpha1
S = length(X0);     % number of species
t = zeros(1e6,1);   % 
X = zeros(1e6,S);
E = zeros(1e6,1); % record events
X(1, :) = X0; 
point = 1;              % keep track of points: a point can be any change in state


while t(point) < tlim
        A = X(point, 1);
        B = X(point, 2);
        rA = X(point, 3);
        rB = X(point, 4);
    % 1. calculate rate of each event
        rates = [gA * (1 - rB),  ...
                     gB * (1 - rA),  ...
                     dA * A, ...
                     dB * B, ...
                     alpha0 * A * (1 - rA - rB),  ... %
                     alpha0 * B *(1- rA - rB),  ... 
                     alpha1 * rA,...
                     alpha1 * rB ]; 
        a0 = sum(rates, 2); % the rate that "any" event happens
    
    % 2. inter event time
        t(point+1) = t(point) + log(1/rand)/a0; % Calculating the interevent time.
    % 3. witch event
        eventID = datasample(1:8, 1, 'weight', rates); 
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