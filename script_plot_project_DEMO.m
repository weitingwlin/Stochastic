destiny = nan(it, 2);
parastr = para2str(tlim, it, n0, k , [2 2 ]); 
figure
mysubplot(1, 7, 0, {'Gillespie simulation', parastr{:}})  
mysubplot(1, 7, 2:5)
    for i = 1:it
            [t, x] = LVcompGillespie(n0, tlim);
            if i <= ntrace 
                    stairs(t, x(:,1),'color', mycolor(3)); hold on  % -1 s
                    stairs(t, x(:,2),'color', mycolor(4)); hold on  % -1 s
            end
            destiny(i, :) = x(end, :);
    end  
            xlim([0  tlim]);
            set(gca, 'linewidth', 2);
            xlabel('Time', 'fontsize',14); ylabel('Population', 'Fontsize', 14); title(['First ' num2str(ntrace ) ' simulations'], 'Fontsize', 14);
          %  legend('Species A','Species B')
mysubplot(1, 7, 6)
            sum_destiny =sum([all(destiny, 2), destiny>1, any(destiny, 2)==0]);
            mystackbar(sum_destiny, [1 3 4 40])
            ylim([0 100])
            title('Destiny')  
            legend(  'empty','B win', 'A win','coexist')
