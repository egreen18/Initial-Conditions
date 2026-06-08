function [ratio] = birth_Death_sim_vs_FIM(IC, nSim, plot)
%birth_Death_sim_vs_FIM conveniently wraps a Simulation v FIM workstream
%   This function takes initial condition (IC) and simulation number (nSim)
%   arguments, simulates birth death experimental results by sampling an
%   experimentally optimized FSP, solves the FIM using the same
%   parameterization, and presents results visually as well as
%   quantitatively in the form of the Uncertainty Volume (the determinant
%   of the inverse FIM matrix, analgaous to the determinant of the empircal
%   covariance matrix)
%
%   INPUTS
%       IC      -   Scalar, initial condition for model simulation and solution
%       nSim    -   Scalar, number of simulations to run
%       plot    -   Boolean, plot? default 1
%
%   OUTPUTS
%       ratio   -   Scalar, ratio of Empirical Uncertainty Volume to FIM
%                           Uncertainty Volume

arguments (Input)
    IC
    nSim
    plot = 1
end

arguments (Output)
    ratio
end

% Preliminaries
save_start = "birth_death_IC_"+string(IC);
save_name = @(n) save_start+"_nSim_"+string(n)+".mat";

% Checking for Simulated Data

% Examining IC simulation progress
n = 0;
file = "cache/"+save_start+"*";
if ~isempty(dir(file))
    % Selecting the highest progress save file
    file_check = dir(file);
    for i = 1:length(file_check)
        n_temp = str2double(regexp(file_check(i).name, '(?<=nSim_)\d+', 'match', 'once'));
        if n_temp > n
            n = n_temp;
        end
    end
end

% Loading progress
if n > 0
    load("cache/"+save_name(n),'results','theta');
else
    % Solving the FIM
    results = dOpt_birth_death(IC);

    % Initializing simulation matrix
    theta = [];
end


% Iterating while progress hasn't met goal
while n < nSim
    if nSim - n - 20 >= 0
        step = 20;
    else
        step = nSim - n;
    end
    
    % Simulating data
    [theta_new] = birth_Death_sim_data(IC, step, results);

    % Saving data
    theta = [theta, theta_new];
    
    % Delete old cache
    delete("cache/"+save_name(n))

    % Iterate
    n = n + step;

    % Save results 
    save("cache/"+save_name(n), 'results');
    save("cache/"+save_name(n), 'theta', '-append');
    disp("Simulated and saved data for IC = "+string(IC)+" and nSim = "+string(n)+".");
end

% Unpacking Data
param1 = theta(1,1:nSim);
param2 = theta(2,1:nSim);

% Uncertainty Volume Determination
empiricalCov = cov(theta(:,1:nSim)');
FIM_vol = det(results.fimTotal^-1);
Emp_vol = det(empiricalCov);
ratio = Emp_vol/FIM_vol;

if plot
    % Plotting
    sigma = 2;
    newFigure = 1;
    plotUncertaintyEllipse(results, sigma, newFigure)
    hold on
    scatter(param1, param2, 'filled', 'DisplayName', 'Simulated Data MLE Pairs')
    legend
    title("Observing the FIM's ability to Predict Parameter Uncertainty for IC = "+string(IC))

    % Quantitative Report
    % disp("The FIM predicted a Uncertainty Volume of "+FIM_vol)
    % disp("The simulated data yielded an Uncertainty Volume of "+Emp_vol)

end

end