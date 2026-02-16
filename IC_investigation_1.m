%% Content
% This investigation explores which SINGLE Initial Condition provides the 
% most information for a simple Birth-Death system. Key parameters of the 
% system include:
%
% k_birth   =   1
% k_death   =   0.1
% tSpan     =  [0,40]
%
% This system equilbriates to a population of 10 with a half life of 6.93s

%% Preliminaries:
clear
close all
clc
addpath(genpath('../Rotation/SSIT'));

%% Section 1: IC = 0 is the best case for sub-equilibrium IC
IC = 0:1:10;
all_dOpt = zeros(1,length(IC));
for i = 1:length(IC)
    results = dOpt_birth_death(IC(i));
    bubblePlot(results);
    all_dOpt(i) = results.dOpt;
end

%% Section 1.1: Information decreases exponentially from IC 0 (sub-eq)
figure()
plot(IC, all_dOpt)
hold on
scatter(IC, all_dOpt,80,'filled')
xlabel('Initial Condition')
ylabel('D-Optimatlity Criterion')
title('Information v. Initial Condition for Sub-Equilibrium Conditions')
grid on

%% Section 2: There is no best case for super-equilbrium IC
IC = 10:10:100;
all_dOpt = zeros(1,length(IC));
for i = 1:length(IC)
    results = dOpt_birth_death(IC(i));
    bubblePlot(results);
    all_dOpt(i) = results.dOpt;
end

%% Section 2.1: Information increases semi-linearly for super-equilibrium IC
figure()
plot(IC, all_dOpt)
hold on
scatter(IC, all_dOpt,80,'filled')
xlabel('Initial Condition')
ylabel('D-Optimatlity Criterion')
title('Information v. Initial Condition for Super-Equilibrium Conditions')
grid on