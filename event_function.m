%% The event function
 function [value, isterminal, direction] = event_function(t, V)
    % global  Vth
        value = V - 0;  % when value = 0, an event is triggered
        isterminal = 1; % terminate after the first event
        direction = 0;  % get all the zeros
 end