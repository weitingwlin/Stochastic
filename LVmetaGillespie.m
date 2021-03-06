%% The Gillespie simulation of the stochastic metacommunity model

function [t, X] = LVmetaGillespie(X0, tlim, disp)
%% Use global parameters
global bA1 bA2 bA3 dA1 dA2 dA3  bB1 bB2 bB3 dB1 dB2 dB3  k rA rB aA aB bA bB EA EB
        dA1 = 1;        bA1 = rA + dA1;          dB1 = 1;         bB1 = rB + dB1;
        bA2 = 1/k;    dA2 = (rA*aA + 1)/k;   bB2 = 1/k;    dB2 = (rB*aB + 1)/k;
        bA3 = 1/k;    dA3 = (rA*bA + 1)/k;   bB3 = 1/k;    dB3 = (rB*bB + 1)/k;
% process (per patch)
v = [];
v{1} =  [1  0];  % birth of species A
v{2} = [-1 0];  % death of species A
v{3} = [0  1];
v{4} = [0  -1];
v{5} = [-1  0]; % Emigration of species A
v{6} = [0  -1];
v{7} = [0  0]; % a pseudo-event: maintain extinct
nv = 6; % number of event

%%
 [P, S] = size(X0); % number of patches, number of species
 t = zeros(1e5,1);   % 
 X = zeros(P,S, 1e5);
 X(:,:,1) = X0; 
 point = 1;     
 L = reshape(1:nv*P, nv, P); % event locator, used later
%%
while t(point) < tlim    
    % 1. calculate rate of each event (for each patch)
          rates = [];
    for p =1:P    
          nA = X(p, 1, point);
          nB = X(p, 2, point);
          temp = [bA1*nA + bA2*nA^2 + bA3*nA*nB, ...
                     dA1*nA + dA2*nA^2 + dA3*nA*nB, ...  
                     bB1*nB  + bB2*nB^2  + bB3*nA*nB, ...
                     dB1*nB  + dB2*nB^2  + dB3*nA*nB, ...  
                     EA * nA,...
                     EB * nB
                     ]; 
          rates = [rates, temp]; 
    end
        a0 = sum(rates, 2); % the rate that "any" event happens
    
    % 2. inter event time
        t(point+1) = t(point) + log(1/rand)/a0; % Calculating the interevent time.
    % 3. witch event
     %   eventID = datasample(1:2, 1, 'weight', rates); 
        if a0 >0
            eventID = min(find(rand < cumsum(rates/a0))); % like the above but zero-prove
             [event, patch] = find( L == eventID ); % which of the 6 events in which patch
        else
            t(point + 1) = tlim; % end the simulation
            event = 7; patch = 1; % nothing happen
        end
     % 4. update state                                       
         X(:,:, point+1) = X(:, :, point);
         X(patch, : , point + 1) = X(patch, :, point) + v{event}; % Updating the state.
         % if the event is dispersal, we also update the state of the
         % setination site
         if any(event == [5 6])
             dest_patch = datasample( 1:P, 1, 'weight', disp(patch, :) ); % chose a destination patch
             X(dest_patch, : , point + 1) = X(dest_patch, :, point) - v{event};  % add immigrant
         end
    % 5. update the point counter.
        point = point + 1;  
end
%%
% The last thing we do is get rid of the memory that was not use during the
% simulation and we are done.
t = t(1:point);
X = X(:,:, 1:point);