%% HW3_2
x = [-3.5 :0.1 : 3.5];
B = 1;  k=1;
phi = 0.5 * (x .^ 4) - 0.4 /3* (x .^ 3) - 5.1/2* (x .^ 2);
P = (k/B) .* exp(-1* phi);

myplot(x, P, 'L', 15); hold on
myplot(x, phi, 'L', 13); 
xlim([ -3.5 3.5])
legend('Propablility density: P(x)', 'Potential function: \phi(x)')
xlabel('x');
ylabel('(y axis normalized)');
title({'The Markov process',' (analytical result)'})

set(gca, 'Ytick', '')
%%
T = 100;
dt = 0.01;
it = 10000; 
X0 = 1;
plotn = 5;
ss = zeros(it, 1);
%%
rng(2)
tic
for i = 1 : it
  [X, t] =  MarkovEM(X0, T, dt);
        if i <= plotn 
       %     mystairs(t, X, i+21 ) ; hold on
        end
        ss(i) = X(end);
end
toc
%%
 str1 = para2str(T, dt);
figure
 histogram(ss, 40, 'normalization', 'pdf')
      set(gca,'FontSize',14,'linewidth',2);  
 xlabel('x');
 ylabel('pdf');
xlim([ -3.5 3.5]) 
title({'The Markov process',' (simulation result; 10,000 realizations)', str1{1}})
