%%
% clean workspace
    clear; clc
%%
% set global parameters
global b r N
%% 
b = 1;
r = 1;
N = 100;

%% Set seed
    rng(4)
        tlim = 1000;
    X0 = [95, 5, 0]; % [S, I, R]
figure
        [t, x] = SIRGillespie(X0, tlim);
                stairs(t, x(:,1), 'LineWidth',2);hold on
                stairs(t,x(:,2),'LineWidth',2);
                 stairs(t,x(:,3),'LineWidth',2);
                    legend('S', 'I','R',  'Location','southeast')
                  ylabel('population')     
                    title(['\beta = ' num2str( b ) '; \gamma = '  num2str( r ) ])
                  xlabel('time');
  %% 
  b = 4
      rng(4)
        tlim = 1000;
    X0 = [95, 5, 0]; % [S, I, R]
figure
        [t, x] = SIRGillespie(X0, tlim);
                stairs(t, x(:,1), 'LineWidth',2);hold on
                stairs(t,x(:,2),'LineWidth',2);
                 stairs(t,x(:,3),'LineWidth',2);
                    legend('S', 'I','R',  'Location','southeast')
                  ylabel('population')     
                    title(['\beta = ' num2str( b ) '; \gamma = '  num2str( r ) ])
                  xlabel('time');
                  
%%  Probability of persistence
%%
% 
% $$ X_{n+1}= 1-(1-pX_n)^k $$
% 
%% Cobwebbing
p = 0.5;
k = 3;
X0s = 0 : 0.01 : 1;
X1s = 1 - ( 1 - p * X0s) .^k;

figure
myplot(X0s, X1s, 'L', 10);hold on
myplot(X0s, X0s, 'L', 1);
xlabel('X_n'); ylabel('X_{n+1}')
text(0.1, 0.9, ['p = ' num2str(p) '; k = ' num2str(k)], 'FontSize', 16); 

%% cobwebbing 
s0 = 0.5;
       myplot_vec([s0, 0], [s0, s0], [],7);
for it = 1:10
    s1 = 1 - ( 1 - p * s0) .^k;
        myplot_vec([s0, s0], [s0, s1], [],7);
        myplot_vec([s0, s1], [s1, s1], [],7);
        s0 = s1;
end
myplot(s0, s0, 'S', 1);
xlabel('X_n'); ylabel('X_{n+1}')
text(s0-0.05, s0+0.05, 'q*', 'FontSize', 16)