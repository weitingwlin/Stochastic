
function [t, X, E] = BDIGillespie(X0, tlim)
%% Use global parameters
global rB   rD   Im
%% reactiona and vectors
% * reaction 1: X --> 2X 
% * reaction 2: X -->  
% * reaction 3:     --> X
% There are 3 reactions
v = [];
v{1} = [1];  v{2} = [-1];  v{3} = [1];  
%%
t = zeros(1e6,1);   % 
X = zeros(1e6,1);
E = zeros(1e6,1); % record events
X(1) = X0; 
point = 1;              % keep track of points: a point can be any change in state


while t(point) < tlim
    % 1. calculate rate of each event
        rates = [rB * X(point),  ...
                     rD * X(point),  ...
                     Im]; 
        a0 = sum(rates, 2); % the rate that "any" event happens
    
    % 2. inter event time
        t(point+1) = t(point) + log(1/rand)/a0; % Calculating the interevent time.
    % 3. witch event
        % eventID = datasample(1:3, 1, 'weight', rates); 
      %  if n > 0
            eventID = min(find(rand < cumsum(rates/a0))); % like the above but zero-prove
            E(point+1) = eventID;
      %  else
       %     eventID = 4; % a pseudo event where nothing happ
       % end
    % 4. update state                                       
        X(point+1) = X(point) + v{eventID}; % Updating the state.
    % 5. update the point counter.
        point = point + 1;  
end

%%
% The last thing we do is get rid of the memory that was not use during the
% simulation and we are done.
t = t(1:point);
X = X(1:point);
E = E(1:point);