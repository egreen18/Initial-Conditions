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
    plotFIMResults(results);
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
%% Section 3: A vector of all Single IC scores form 0 to 200
IC = 0:1:200;
info = zeros(1,length(IC));

% Pulling the saved progress or initializing if none is present
if exist("single_IC_score.mat","file") == 2
    load("single_IC_score.mat");
    disp("Loaded single_IC_score from saved results.");
end

% Initializing storage matrices if not loaded
if ~exist('single_IC_score', 'var')
    single_IC_score = zeros(1,length(IC));
    disp("Initialized single_IC_score.")
end

% Checking to ensure appropriate matrix dimensions
if size(single_IC_score,1) < length(IC)
    old_data = single_IC_score;
    single_IC_score = NaN(1,length(IC));
    single_IC_score(1:size(old_data, 1), 1:size(old_data, 2)) = old_data;
end

% Computing scores
for i = 1:length(IC)
    if isnan(single_IC_score(i))
        results = dOpt_birth_death(IC(i));
        single_IC_score(i) = results.dOpt;
        save("single_IC_score.mat", 'single_IC_score');
        disp("Saved D-Opt score for IC = "+string(IC(i)))
    end
end

disp("All Single IC scores have been computed and stored in single_IC_score.mat")