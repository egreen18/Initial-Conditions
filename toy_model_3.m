%% Preliminaries:
clear
close all
clc
addpath(genpath('../Rotation/SSIT'));

%% Section 1 - Define Model
% Intitiate results structure
IC = [2;0;0];
results = struct;
results.IC = IC;

% Create an SSIT instance and call it 'Model':
Model = SSIT;    

% Set species names for bursting gene expression model:
Model.species = {'offGene';'onGene';'mRNA'}; 

% Set initial condition:
Model.initialCondition = IC;           

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
Model.summarizeModel

%% Section 2 - Solve ODE model
% Make a copy of the model for ODE
Model_ODE = Model;

% Set the times at which distributions will be computed
Model_ODE.tSpan = linspace(0,20,200);

% Set solution scheme to ODE
Model_ODE.solutionScheme = 'ODE';
Model_ODE.odeIntegrator = 'ode23s';

% Create symbolic propensity functions
Model_ODE = Model_ODE.formPropensitiesGeneral('Model_ODE_2_2',false);

% Solve ODEs
Model_ODE.Solutions = Model_ODE.solve;

% Plot ODE Solutions
Model_ODE.plotODE(Model_ODE.species, Model_ODE.tSpan,...
    {'linewidth',4}, Title='Bursting-Gene ODE Soln', TitleFontSize=24,...
    AxisLabelSize=18, TickLabelSize=18, LegendFontSize=15,...
    LegendLocation='east', XLabel='Time', YLabel='Molecule Count')

%% Section 2.1 - Solve FSP model
% Make a copy of the model for FSP
Model_FSP = Model;

% Set the times at which distributions will be computed:
Model_FSP.tSpan = linspace(0,20,200);

% Set the solution scheme to FSP
Model_FSP.solutionScheme = 'FSP';

% Set the FSP 1-norm error tolerance
Model_FSP.fspOptions.fspTol = 1e-4;

% Guess initial bounds on FSP StateSpace
Model_FSP.fspOptions.bounds = [30];

% Enable steady state initial distribution approximation
Model_FSP.fspOptions.initApproxSS = false;

% Create symbolic propensity functions
Model_FSP = Model_FSP.formPropensitiesGeneral('Model_FSP_dOpt',false);

% Solve Model
Model_FSP.Solutions = Model_FSP.solve;

% Plot marginal distributions at final time
timeInd = [10,30,50,70];
Model_FSP.plotFSP(Model_FSP.Solutions, Model_FSP.species, 'marginals', ...
    timeInd)

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
Model_fimResults = Model_FIM.computeFIM(Model_sens.Solutions.sens); 


% Compute the optimal experimental design per D-Optimality
optimal_experiment = Model_FIM.optimizeCellCounts(Model_fimResults,...
    length(Model_FIM.tSpan),'Determinant');

[Model_fimTotal_opt,~,~] = ...
    Model_FIM.evaluateExperiment(Model_fimResults,optimal_experiment);

% Save to results
results.dOpt = det(Model_fimTotal_opt{1});

%% Section 5 - Solve ODE model
% Make a copy of the model for ODE
Model_ODE = Model;

% Set the times at which distributions will be computed
Model_ODE.tSpan = linspace(0,40,200);

% Set solution scheme to ODE
Model_ODE.solutionScheme = 'ODE';
Model_ODE.odeIntegrator = 'ode23s';

% Create symbolic propensity functions
Model_ODE = Model_ODE.formPropensitiesGeneral('Model_ODE_2',false);

% Solve ODEs
Model_ODE.Solutions = Model_ODE.solve;

% Save to results
results.tSpan = Model_ODE.tSpan;
results.expectedValues = Model_ODE.Solutions.ode;
results.optimalExperiment = optimal_experiment;

