x = [0:.1:3];
w = x.*(3-x);
figure;
myplot(x,w, 'L', 8); hold on
myplot([0 3], [0 0], 'S', 1);
xlabel('$$x$$', 'Interpreter','latex', 'fontsize', 16);ylabel('$$w(x)$$', 'Interpreter','latex', 'fontsize', 16)
set(gca, 'xticklabel', '', 'yticklabel', '')
box off