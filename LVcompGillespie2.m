function [t, X] = LVcompGillespie2(X0, tlim)
%% Use global parameters
global   k rA rB sA sB bAB bBA
      dA1 = 1;        bA1 = rA*sA + dA1;          dB1 = 1;         bB1 = rB*sB + dB1;
      dA2 = rA*sA*sA/k ;     bA2 = 0;  
      dA3 = rA*bAB*sA*sB/k ;     bA3 = 0;
      dB2 = rB*sB*sB/k ;       bB2 = 0;  
      dB3 = rB*bBA*sB*sA/k ;       bB3 = 0;
      
      %    bA2 = 1/k;    dA2 = (rA*aA + 1)/k;   bB2 = 1/k;    dB2 = (rB*aB + 1)/k;
     %   bA3 = 1/k;    dA3 = (rA*bA + 1)/k;   bB3 = 1/k;    dB3 = (rB*bB + 1)/k;
% process
v = [];
v{1} =  [1  0];  % birth of species A
v{2} = [-1 0]; % death of species A
v{3} = [0  1];
v{4} = [0  -1];
v{5} = [0  0]; % a pseudo-event: maintain extinct
%%
S = length(X0);     % number of species
t = zeros(1e6,1);   % 
X = zeros(1e6,S);
X(1, :) = X0; 
point = 1;     
%%
while t(point) < tlim   
        nA = X(point,1);
        nB = X(point,2);
    % 1. calculate rate of each event
        rates = [bA1*nA + bA2*nA^2 + bA3*nA*nB, ...
                      dA1*nA + dA2*nA^2 + dA3*nA*nB, ...  
                      bB1*nB  + bB2*nB^2  + bB3*nA*nB, ...
                      dB1*nB  + dB2*nB^2  + dB3*nA*nB, ...  
                     ]; 
        a0 = sum(rates, 2); % the rate that "any" event happens
    
    % 2. inter event time
        t(point+1) = t(point) + log(1/rand)/a0; % Calculating the interevent time.
    % 3. witch event
     %   eventID = datasample(1:2, 1, 'weight', rates); 
        if (nA + nB) >0
            eventID = min(find(rand < cumsum(rates/a0))); % like the above but zero-prove
        else
            eventID = 5;
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