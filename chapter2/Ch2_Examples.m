% Examples
%{
Author: Hamilton Galindo
Date: March 2021
Update: July 2022
%}
%==========================================================================
%
clear all;

p = mfilename('fullpath');           % the full path of this m-file
[filepath,name,ext] = fileparts(p);  % Split the "full path": We need "name" (of this m-file) 

% Example: ABM (Arithmetic Brownian Motion)
% Define P (stock price) as a ABM
mu = 0.001;
sigma = 0.03;
ABM_P = bm(mu,sigma);

% Example: GBM (Geometric Brownian Motion)
% Define the Y as a GBM
mu = 0.001;
sigma = 0.03;
GBM_P = gbm(mu,sigma);

% Simulate P: ABM vs GBM
nPeriods = 100;
rng('default');                    % make output reproducible
[P_abm, T] = simulate(ABM_P,nPeriods); % "simulate": Simulate multivariate stochastic differential equations (SDEs)
                                       %  P_abm is the "simulated serie" and T is the "time serie".
[P_gbm, T] = simulate(GBM_P,nPeriods);
                                   
% Plot (Fig 1)
figure('Name','Fig1')
plot(T,P_abm,T,P_gbm,'LineWidth', 1.5);
xlabel('Time')
title('P_t: Stock Price')
legend('Arithmetic Brownian Motion (ABM)','Geometric Brownian Motion (GBM)')
grid;

% Save the figure
h=gcf;
set(h,'PaperOrientation','landscape');
set(h,'PaperUnits','normalized');
set(gcf,'PaperPosition', [0 0 1 1]);
print(h, '-dpdf', strcat(name,'_Fig1.pdf'));

ylim([-0.2 1.2])
