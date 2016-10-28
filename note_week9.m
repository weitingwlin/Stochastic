
global VL taum J
VL = 0;
V0 = 0.5;
taum =1;
J = 0.2; % the kick

%%
[t1, V1] = ode45('neuronODE', [1 2] ,  V0);
figure
    myplot(t1, V1, 'L'); hold on  % -1 so t starts at 0
    myplot([1 2], [0 0 ], 'B', 1);
    myLatext(1.5, 0, '$$\Delta t$$', 14, 8)
       axis([ 0.5 2.5 -0.1 0.8])
    axis off
%%
[t1, V1] = ode45('neuronODE', [1 1.3] ,  V0);
[t2, V2] = ode45('neuronODE', [1.3 2] ,  V1(end)+J);
figure
    myplot([t1 t2], [V1 V2], 'L'); hold on  % -1 so t starts at 0
    myplot_vec([1.3  V1(end)], [1.3  V1(end)+J ], '',3);
    myplot([1 1.3 2], [0 0 0 ], 'B', 1);
    myLatext(1.15, 0, '$$\Delta t_1$$', 14, 8)
     myLatext(1.65, 0, '$$\Delta t_2$$', 14, 8)
     axis([ 0.5 2.5 -0.1 0.8])
    axis off
%%
[t1, V1] = ode45('neuronODE', [1 1.4] ,  V0);
[t2, V2] = ode45('neuronODE', [1.4 2] ,  V1(end)-J);
figure
    myplot([t1 t2], [V1 V2], 'L'); hold on  % -1 so t starts at 0
    myplot_vec([1.4  V1(end)], [1.4  V1(end)-J ], '',3);
    myplot([1 1.4 2], [0 0 0 ], 'B', 1);
    myLatext(1.2, 0, '$$\Delta t_1 \prime$$', 14, 8)
     myLatext(1.7, 0, '$$\Delta t_2 \prime$$', 14, 8)
    axis([ 0.5 2.5 -0.1 0.8])
    axis off
%% plot9_4
taum = 0.2;
[t1, V1] = ode45('neuronODE', [1 2] ,  V0);
figure
    myplot([0 1 1], [0 0  0.5 ], 'L'); hold on  
    myplot(t1, V1, 'L');% -1 so t starts at 0
    myplot([1 1+taum], [-0.1 -0.1], 'B', 8)
    hline(0, 7, ':')
        myLatext(1.1, -0.1, '$$\tau_m$$', 16, 8)
        myLatext(0.45, 0.5, '$$V$$', 16, 9)
        xlabel('t')
        axis([ 0.5 2 -0.2 0.5])  
        set(gca, 'xtick',[],  'ytick',[])
        box off
