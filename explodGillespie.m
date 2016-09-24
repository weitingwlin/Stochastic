
function [t, x] = explodGillespie(X0, tlim)
%% Use global parameters
global k 
%% reactiona and vectors
% * reaction 1:  X --> X

%%

t = zeros(1, 1e4);
x = zeros(1, 1e4);
x(1) = X0;
point = 1; %This variable is to keep track of the amount of points.
%%
while (t(point) < tlim) && (~isinf(k^x(point))) 
    % 1. calculate rate of each event
        a0 = k^x(point);    
        if isinf(a0)
            warning('rate reach infinity');
        end
    % 2. inter event time
        t(point+1) = t(point) + log(1/rand)/a0; % Calculating the interevent time.
    % 3. update state                                       
        x(point+1) = x(point) +1; % Updating the state.
    % 5. update the point counter.
        point = point + 1;  
end

%%
% The last thing we do is get rid of the memory that was not use during the
% simulation and we are done.
t = t(1:point);
x = x(1:point);