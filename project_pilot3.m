% The pilot analysis of the course project
clear; clc
%% parameters
% The deterministic parameters

%% simulation parameters
tlim =20 ;
n0 = [ 5 5];


%% Demo
  for i = 1:9
      rng(i)
  [t, x] = LVcompGillespie2(n0, tlim);
        subplot(3,3, i);
        stairs(t, x(:,1),'color', mycolor(3)); hold on  % -1 s
        stairs(t, x(:,2),'color', mycolor(4));
            xlim([0  tlim]);
            set(gca, 'linewidth', 2);
            xlabel('Time', 'fontsize',14); ylabel('Population', 'Fontsize', 14); 
            
  end
 %% calculate stochastic parameters   
    k = 10;
    n0 = [10 10 ]; %     n0 = [2 2 ];       n0 = [2 10 ];
    it = 1;
    ntrace = 10;


%% Get destiny
    it = 10;
    n0spec = [10 10; 2 2 ; 2 10]; 
    kspec = 20:10:200;
    indDetS = [];
    indEmpS = [];
 parastr = para2str(tlim, it, n0, k , [2 2 ]);
tic
for n =1: length(n0spec)
        n0 = n0spec(n, :);
        indDet =zeros(length(kspec), 1);
        indEmp =zeros(length(kspec), 1);
        for j = 1:length(kspec)
                destiny = nan(it, 2);
                k = kspec(j);
            for i = 1:it
                [t, x] = LVcompGillespie(n0, tlim);
                destiny(i, :) = x(end, :);
            end  
            sum_destiny =sum([all(destiny, 2), destiny>1, any(destiny, 2)==0]);
        indDet(j) = sum_destiny(2) / (sum_destiny(2) + sum_destiny(3));
        indEmp(j) = sum_destiny(4)/it;
        end
        indDetS{n} = indDet;
        indEmpS{n} = indEmp;
        
end
 toc
 %% 
for n = 1:3
    figure
n0 = n0spec(n, :);
 parastr = para2str(tlim, it, n0);
 mysubplot(1, 2, 0, {'Local competition results', parastr{:}})
 mysubplot(1, 2, 1)
    myplot(kspec, indDetS{n}(1:19));
        xlabel('k')
        ylabel('Determinitic index')
        axis([kspec(1) kspec(end) 0 1])
mysubplot(1, 2, 2)       
    myplot(kspec, indEmpS{n});
        xlabel('k')
        ylabel('Extinction index')
             axis([kspec(1) kspec(end) 0 1])
end