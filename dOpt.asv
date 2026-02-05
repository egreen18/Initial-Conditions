%% Preliminaries:
clear
close all
clc
addpath(genpath('../Rotation/SSIT'));

%% Section 1 - Define Model
% Initiate model
Model = SSIT;    

% One species in system, protein X
Model.species = {'X'};   

% Initial Conditions
Model.initialCondition = [0];

% Set stoichiometry of reactions
Model.stoichiometry = [1,-1];   % [birth, death]

% Set propensity functions assuming population-independent birth
Model.propensityFunctions = {'k_birth','k_death * X'};

% Set initial guesses for parameters:
Model.parameters = ({'k_birth',1; 'k_death',0.1});

% Print a summary of the Model
Model.summarizeModel

%% Section 2 - Solve FSP model
% Make a copy of the model for FSP
Model_FSP = Model;

% Set the times at which distributions will be computed:
Model_FSP.tSpan = linspace(0,40,200);

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

% Plot marginal distributions at provided times
% timeInd = [10, 30, 100, 200];
% Model_FSP.plotFSP(Model_FSP.Solutions, Model_FSP.species, 'marginals', timeInd)

%% Section 3 - Sensitivty Analysis
% Make a copy of the FSP Solution for sensitivity analysis
Model_sens = Model_FSP;

% Set solution schemes to FSP sensitivity
Model_sens.solutionScheme = 'fspSens';

% Solve the sensitivity problem
Model_sens.Solutions = Model_sens.solve(Model_sens.Solutions.stateSpace);

% Plot the results from the sensitivity analysis:
% Model_sens.plotFSP(Model_sens.Solutions,...
% Model_sens.species(1), 'sens', timeInd, [], {'linewidth',3}, ...
% Colors=[0.23,0.67,0.2], AxisLabelSize=14, TickLabelSize=10, ...
% Title="Toy Model (Birth Death)", TitleFontSize=18)

%% Section 4 - FIM
% Create a copy of the sens model to compute the FIM
Model_FIM = Model_sens;

% Compute the FIM
Model_fimResults = Model_FIM.computeFIM(Model_sens.Solutions.sens); 

% Taking one measurement at every time point
Model_cellCounts = ones(size(Model_FIM.tSpan));

% Compute the optimal experimental design per D-Optimality
optimal_experiment = Model_FIM.optimizeCellCounts(Model_fimResults,...
    length(Model_FIM.tSpan),'Determinant');

bar(Model_FIM.tSpan,optimal_experiment);

[Model_fimTotal,~,~] = ...
    Model_FIM.evaluateExperiment(Model_fimResults,Model_cellCounts);

[Model_fimTotal_opt,~,~] = ...
    Model_FIM.evaluateExperiment(Model_fimResults,optimal_experiment);

theta0 = [Model_FIM.parameters{:,2}];

Model_FIM.plotFIMResults(Model_fimTotal_opt, Model_FIM.parameters, theta0, ...
                         PlotEllipses=true, EllipseLevel=0.9);

% Print
fprintf("General Case")
det(Model_fimTotal{1})
fprintf("Optimized Case")
det(Model_fimTotal_opt{1})

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

% Plot ODE Solutions
Model_ODE.plotODE(Model_ODE.species, Model_ODE.tSpan,...
    {'linewidth',4}, Title='Birth-Death ODE Soln', TitleFontSize=24,...
    AxisLabelSize=18, TickLabelSize=18, LegendFontSize=15,...
    LegendLocation='east', XLabel='Time', YLabel='Molecule Count')

hold on

% Add the sample times to the ODE solution
[x,y,sz] = bubbleBin(Model_ODE.tSpan, Model_ODE.Solutions.ode, ...
    optimal_experiment,100);
bubblechart(x,y,sz,'DisplayName','Optimal Sampling')
