% Scripts for making plots of the simulation results from switchGillespie.m
    figure
    mysubplot(7, 1, 0, ['Exclusive switch (', para2str(k), ') '])
    mysubplot(7, 1, 1:2)
        mystairs(t, x(:,1), 39); hold on
                set(gca, 'xticklabel', [])
                axis([0 tlim 0 X0(1)*2.5])
                ylabel('N_A')
                hline(X0(1));
    mysubplot(7, 1, 3:4) 
        mystairs(t, x(:,2), 38); hold on
                set(gca, 'xticklabel', [])
                axis([0 tlim 0 X0(1)*2.5])
                ylabel('N_B')
                 hline(X0(1));
    mysubplot(7, 1, 5)  
        mystairs(t, x(:,3), 39);hold on
                set(gca, 'xticklabel', [])
                ylabel('r_A')
                axis([0 tlim 0 1])
    mysubplot(7, 1, 6)    
        mystairs(t, x(:,4), 38); hold on
               axis([0 tlim 0 1])
                ylabel('r_B')
                xlabel('time')
            