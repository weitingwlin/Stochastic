% plots for week 7 note 

x = [-3:.1:3];
norm = normpdf(x,0,1);
figure;
myplot(x,norm, 'L'); hold on
    hline(0, 1, '-')
    axis([-4 4 -0.02 0.6])
    vline(0,7,':')
    vline(-2, 1)
    text(-2, -0.06, '$$0$$', 'fontsize', 16,'Interpreter','latex', 'horizontalalignment','center')
    text(0 , -0.06, '$$Nt$$', 'fontsize', 16,'Interpreter','latex', 'horizontalalignment','center')
    quiver(-1.9, 0.5, 1.9,0, 'Linewidth', 2)
    axis off
%%
x = [-3:.1:3];
norm = normpdf(x,0,1);
figure;
myplot(x,norm, 'L'); hold on
xlabel('$$x$$', 'Interpreter','latex', 'fontsize', 16);ylabel('$$\rho (x)$$', 'Interpreter','latex', 'fontsize', 16)
set(gca, 'xticklabel', '', 'yticklabel', '')
box off