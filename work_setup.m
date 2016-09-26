%% Set up working folder and utility path
% for each project, open the  work_setup.m file first
% 
% The setup file should contain
%% Get current machine name
[stt, strout] = system('hostname');

%%% set working directory and path
% mac
if strncmp(strout, 'weitingdeMacBook-Air.local',5)
    cd '/Users/weitinglin/Dropbox/DataCoding/MATLAB/stochastic'
    addpath '/Users/weitinglin/Dropbox/DataCoding/MATLAB/stochastic/utility'
end

% PC
if strncmp(strout,'wlin_pc',5)
 cd 'C:\Users\Wei-Ting\Dropbox\DataCoding\MATLAB\Stochastic'
  addpath 'C:\Users\Wei-Ting\Dropbox\DataCoding\MATLAB\Stochastic\utility'
end

% laptop
if strncmp(strout,'Weiting-PC',5)
 cd 'C:\Users\Weiting\Dropbox\DataCoding\MATLAB\Stochastic'
 % addpath 'C:\Users\Weiting\Dropbox\DataCoding\utility_wtl\mfiles'
end


clear strout stt