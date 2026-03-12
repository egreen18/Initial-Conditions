function [results] = dOpt_birth_death(IC, gene_state)
%DOPT_SOLVE Solves the Toy Bursting-Gene model for the dOpt criterion
%   Takes a scaler Initial Condition value and returns the "results"
%   structure which contains multiple computed results. The function may
%   also accept multiple ICs in a simultaneous optimization problem. 
%   In this event, IC should be a vector containing all Initial Conditions 
%   to be considered. Initial gene on/off distributuion is provided by the
%   variable "gene_state", which must be a vertical vector of length 2. 
arguments (Input)
    IC
    gene_state
end

arguments (Output)
    results
end

%% Section 1 - Define Model
% Predefine the FIM Result Array
resolution = 200;
Model_fimResults = cell(resolution*length(IC),1);

% Intitiate results structure
results = struct;
results.IC = IC;

% Create an SSIT instance and call it 'Model':
Model = SSIT;    

% Set species names for bursting gene expression model:
Model.species = {'offGene';'onGene';'mRNA'}; 

% Iterate for the multi case
for i = 1:length(IC)
    
    % Set initial condition:
    Model.initialCondition = [gene_state; IC(i)];    
    
    % Set stoichiometry of reactions:
    Model.stoichiometry = [-1,1,0,0;...
                            1,-1,0,0;...
                            0,0,1,-1]; 
    
    % Set propensity functions:
    Model.propensityFunctions = {'kon * offGene';'koff * onGene';...
                                 'kr * onGene';'dr * mRNA'}; 
    
    % Set initial guesses for parameters:
    Model.parameters = ({'kon',0.2; 'koff',0.2; 'kr',10; 'dr',1});
    
    % Print a summary of STL1 Model:
    % Model.summarizeModel
    
    %% Section 2 - Solve FSP model
    % Make a copy of the model for FSP
    Model_FSP = Model;
    
    % Set the times at which distributions will be computed:
    Model_FSP.tSpan = linspace(0,40,resolution);
    
    % Set the solution scheme to FSP
    Model_FSP.solutionScheme = 'FSP';
    
    % Set the FSP 1-norm error tolerance
    Model_FSP.fspOptions.fspTol = 1e-4;
    
    % Guess initial bounds on FSP StateSpace
    Model_FSP.fspOptions.bounds = [30];
    
    % Enable steady state initial distribution approximation
    Model_FSP.fspOptions.initApproxSS = false;
    
    % Create symbolic propensity functions
    Model_FSP = Model_FSP.formPropensitiesGeneral('Model_FSP_dOpt_2',false);
    
    % Solve Model
    Model_FSP.Solutions = Model_FSP.solve;
    
    %% Section 3 - Sensitivty Analysis
    % Make a copy of the FSP Solution for sensitivity analysis
    Model_sens = Model_FSP;
    
    % Set solution schemes to FSP sensitivity
    Model_sens.solutionScheme = 'fspSens';
    
    % Solve the sensitivity problem
    Model_sens.Solutions = Model_sens.solve(Model_sens.Solutions.stateSpace);
    
    %% Section 4 - FIM
    % Create a copy of the sens model to compute the FIM
    Model_FIM = Model_sens;
    
    % Compute the FIM
    Model_fimResults_temp = Model_FIM.computeFIM(Model_sens.Solutions.sens); 
    
    % For the multi case, concatenate Model_fimResults
    Model_fimResults(1+(i-1)*resolution:i*resolution) = Model_fimResults_temp;

end


% Compute the optimal experimental design per D-Optimality;
% The resolution of the Time Span is the same as the number of samples
% allowed in the optimization.
optimal_experiment = Model_FIM.optimizeCellCounts(Model_fimResults,...
    resolution,'D-opt');

% Save to results
results.tSpan = Model_FSP.tSpan;
results.optimalExperiment = optimal_experiment;
results.parameters = Model_FSP.parameters;

[Model_fimTotal_opt,~,~] = ...
    Model_FIM.evaluateExperiment(Model_fimResults,optimal_experiment);

% Save to results
results.dOpt = det(Model_fimTotal_opt{1});
results.fimTotal = Model_fimTotal_opt{1};

%% Section 5 - Solve ODE model
% Predefining expected value matrix
expectedValues = zeros(resolution, length(IC));

% Iterating for the multi case:
for i = 1:length(IC)

    % Make a copy of the model for ODE
    Model_ODE = Model;

    % Initial Conditions
    Model_ODE.initialCondition = [gene_state; IC(i)];
    
    % Set the times at which distributions will be computed
    Model_ODE.tSpan = Model_FSP.tSpan;
    
    % Set solution scheme to ODE
    Model_ODE.solutionScheme = 'ODE';
    Model_ODE.odeIntegrator = 'ode23s';
    
    % Create symbolic propensity functions
    Model_ODE = Model_ODE.formPropensitiesGeneral('Model_ODE_bursting',false);
    
    % Solve ODEs
    Model_ODE.Solutions = Model_ODE.solve;
    
    % Update Expected Values matrix, only including mRNA count values
    % (Ignoring trivial ODE prediction of offGene/onGene behavior)
    expectedValues(:,i) = Model_ODE.Solutions.ode(:,3);

end

% Save to results
results.expectedValues = expectedValues;


end