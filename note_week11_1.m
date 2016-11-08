%% Note_week11

x = [-1.5 :0.1 : 1.5];
B = 1; k=1;
phi = (x .^2) ./B;
P = (k/B) .* exp(-1* phi);
%%
myplot(x, P, 'L', 15); hold on
myplot(x, phi, 'L', 13); 
    hline(0, 1);vline(0, 7 ,':');
    myLatext(0, 0, 'x', 16, 8);
axis off
legend('P(x)', '\phi(x)')