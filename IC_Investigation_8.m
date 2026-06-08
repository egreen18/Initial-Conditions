%% Content
% This investigation uses the developed birth_Death_sim_data and
% plotUncertaintyEllipse functions to check the ability of the FIM to
% correctly predict uncertainty for various initial conditions of the Birth
% Death model with the following parameters:
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

%% Section 1 - Testing the infrastructure
% Parameterizing the model
IC = 0;
nSim = 20;

% Solving the FIM
results = dOpt_birth_death(IC);

% Simulating data
[theta] = birth_Death_sim_data(IC, nSim, results);

% Unpacking results
param1 = theta(1,:);
param2 = theta(2,:);

% Plotting
plotUncertaintyEllipse(results)
hold on
scatter(param1, param2, 'filled', 'DisplayName', 'Simulated Data MLE Pairs')
legend
title("Observing the FIM's ability to Predict Parameter Uncertainty")

% Quantitative Comparison via Empirical Covariance Matrix
empiricalCov = cov(theta');
disp("The FIM predicted a Uncertainty Volume of "+det(results.fimTotal^-1))
disp("The simulated data yielded an Uncertainty Volume of "+det(empiricalCov))

%% Section 2 - Creating and Testing Saving Infrastructure
% Parameterizing the model
IC = 0;
nSim = 10;
save_name = "birth_death_IC_"+string(IC)+"_nSim_"+string(nSim)+".mat";
bypass = 0;

% Checking for Simulated Data
if exist("cache/"+save_name,"file") == 2
    load("cache/"+save_name);
    bypass = 1;
    disp("Loaded "+save_name+" from saved results.");
end

% Simulating Data
if not(bypass)
    % Solving the FIM
    results = dOpt_birth_death(IC);
    
    % Simulating data
    [theta] = birth_Death_sim_data(IC, nSim, results);

    % Save results 
    save("cache/"+save_name, 'results');
    save("cache/"+save_name, 'theta', '-append');
    disp("Simulated and saved data for IC = "+string(IC)+" and nSim = "+string(nSim)+".");
end

% Unpacking Data
param1 = theta(1,:);
param2 = theta(2,:);

% Plotting
plotUncertaintyEllipse(results)
hold on
scatter(param1, param2, 'filled', 'DisplayName', 'Simulated Data MLE Pairs')
legend
title("Observing the FIM's ability to Predict Parameter Uncertainty for IC = "+string(IC))

% Quantitative Comparison via Empirical Covariance Matrix
empiricalCov = cov(theta');
disp("The FIM predicted a Uncertainty Volume of "+det(results.fimTotal^-1))
disp("The simulated data yielded an Uncertainty Volume of "+det(empiricalCov))

% After observing functionality, the above code was packaged into a wrapper
% and is utilized as "birth_Death_sim_vs_FIM" henceforth.

%% Section 3 - Running simulations for a range of initial conditions
nSim = 200;
IC = [5,15];
ratio = zeros(1,length(IC));

for i = 1:length(IC)
    % disp("Observing IC = "+string(IC))
    ratio(i) = birth_Death_sim_vs_FIM(IC(i), nSim, 1);
end

% Visualizing Results
% figure()
% plot(IC,ratio, 'LineWidth',3)
% grid on
% xlabel("IC")
% ylabel("Ratio of Uncertainty Volumes")
% title("Comparing FIM vs Empirical Uncertainty Volumes in the Birth-Death Model Across ICs, nSim = "+nSim)
