%% 
clear; clc
%%
T = 3;
dt = 0.001;
it = 10; 
X0 = 0;
plotn = 5;
ss = zeros(it, 1);
global k D
k = 0;
D = 1;
ksim = [-3: 0.01:0];
Varx = zeros(it, length(ksim));
ARx = zeros(it, length(ksim));
%%
rng(2)
tic
for j = 1: it
        for i = 1 : length(ksim)
                k = ksim(i);
                [X, t] =  OU_EM(X0, T, dt);
                Varx(j, i) = var(X);
                    [r] =autocorr(X, 2);
                ARx(j, i) = r(3);
        end
end
toc
ks = repmat(ksim, it, 1);
%%
figure
yy1 = smooth(ks(:), Varx(:), 0.5,'loess');
myplot(ks(:), Varx(:), 'S', 28);hold on
myplot(ks(:), yy1, 'L')
xlabel('k')
%%
figure
yy2 = smooth(ks(:), ARx(:), 0.5,'loess');
myplot(ks(:), ARx(:), 'S', 28);hold on
myplot(ks(:), yy2, 'L')
xlabel('k')
