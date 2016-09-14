%     
% Plot a function
    lambda = 3;
    tau = 2;
    t1 = [0 :0.05 :tau];
    f1 = zeros(1, length(t1));
    t2 = [tau :0.05: 20];
    f2 = lambda .* exp(-(t2-tau) ./ lambda);
%%
    myplot([t1 t2], [f1 f2], 'L'); hold on
    set(gca, 'YTickLabel','','XTickLabel','')
    xlabel('t')
    ylabel('f(x)')
    text(tau, -0.2,'$\tau$', 'Interpreter','latex', 'fontsize', 20)
%% simulate Poisson events with inter-event time
    Events = [0]; % 0 is a place-holder
    n = 6; % number of ecents
    for i = 1 : n
        mu = rand;
        X = - log(mu)/lambda;
        Events = [Events  X+Events(end)];
    end
    Events = Events(2:end); % remove place-holder
%% link Poisson to Erlange process
    myplot_point(Events, 'L');
    % this function plot events ('L' for lines or spikes) on a time line
    for i=1:n
            text(Events(i)-0.02, 0.1, num2str(i), 'Fontsize',14)
    end
    myplot_vec([0, 0.2],[Events(3) 0.2], [], 2, 1 , 3); 
        % this function plot vector from point A to point B
    myplot_vec([Events(3)+0.1, 0.2],[Events(6) 0.2], [], 2, 1 , 3); 
    axis off

%% Erlange process
    lambda = 3
    tau = 2
    t2 = [0 :0.05: 20];
    f2 = lambda .* exp(-(t2-tau) ./ lambda);

