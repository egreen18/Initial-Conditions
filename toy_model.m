% Investigate how the FIM may be used to optimize controllable initial
% conditions during experimental design

% Begin with a toy model: simple birth-death

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
Model.initialCondition = 0;
% Model.initialProbs = [0.75, 0.25];

% Set stoichiometry of reactions
Model.stoichiometry = [1,-1];   % [birth, death]

% Set propensity functions assuming population-independent birth
Model.propensityFunctions = {'k_birth','k_death * X'};

% Set initial guesses for parameters:
Model.parameters = ({'k_birth',1; 'k_death',0.1});

% Print a summary of the Model
Model.summarizeModel

%% Section 2 - Solve ODE model
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
Model_ODE.plotODE(Model_ODE.species,...
    {'linewidth',4}, Title='Birth-Death ODE Soln', TitleFontSize=24,...
    AxisLabelSize=18, TickLabelSize=18, LegendFontSize=15,...
    LegendLocation='east', XLabel='Time', YLabel='Molecule Count')

%% Section 3 - Solve SSA model
% Make a copy of the model for SSA
Model_SSA = Model;

% Set the times at which distributions will be computed for SSIT
Model_SSA.tSpan = linspace(0, 40, 200);

% Set the solution scheme to SSA
Model_SSA.solutionScheme = 'SSA';

% Set the number of simulations
Model_SSA.ssaOptions.nSimsPerExpt=10;

% A negative initial time is used to allow model to equilibrate 
% before starting (burn-in). Large burn-in times cause long run times.
Model_SSA.tSpan = [-1,Model_SSA.tSpan];

% Set the initial time:
Model_SSA.initialTime = Model_SSA.tSpan(1);

% Create symbolic propensity functions
Model_SSA = Model_SSA.formPropensitiesGeneral('Model_SSA');

% Run SSA:
Model_SSA.Solutions = Model_SSA.solve;

% Plot SSA trajectories and means:
Model_SSA.plotSSA('all', 100, Model_SSA.species, {'linewidth',4}, ...
    Title="Bursting Gene", MeanOnly=true, TitleFontSize=24,...
    AxisLabelSize=18, TickLabelSize=18,...
    LegendFontSize=15, LegendLocation='northeast',...
    XLabel='Time', YLabel='Molecule Count');

%% Section 4 - Solve FSP model
% Make a copy of the model for FSP
Model_FSP = Model;

% Set the times at which distributions will be computed:
Model_FSP.tSpan = linspace(0,40,200);

% Set the solution scheme to FSP
Model_FSP.solutionScheme = 'FSP';

% Set the FSP 1-norm error tolerance
Model_FSP.fspOptions.fspTol = 1e-4;

% Guess initial bounds on FSP StateSpace
Model_FSP.fspOptions.bounds = [50];

% Enable steady state initial distribution approximation
Model_FSP.fspOptions.initApproxSS = false;

% Create symbolic propensity functions
Model_FSP = Model_FSP.formPropensitiesGeneral('Model_FSP_2',false);

% Solve Model
Model_FSP.Solutions = Model_FSP.solve;

timeInd = [10, 30, 200];
% Plot marginal distributions at final time
Model_FSP.plotFSP(Model_FSP.Solutions, Model_FSP.species, 'marginals', timeInd)

%% Section 5 - Sensitivty Analysis
% Make a copy of the FSP Solution for sensitivity analysis
Model_sens = Model_FSP;

% Set solution schemes to FSP sensitivity
Model_sens.solutionScheme = 'fspSens';

% Solve the sensitivity problem
Model_sens.Solutions = Model_sens.solve(Model_sens.Solutions.stateSpace);

indTime = [10,30,200];
% Plot the results from the sensitivity analysis:
Model_sens.plotFSP(Model_sens.Solutions,...
Model_sens.species(1), 'sens', indTime, [], {'linewidth',3}, ...
Colors=[0.23,0.67,0.2], AxisLabelSize=14, TickLabelSize=10, ...
Title="Toy Model (Birth Death)", TitleFontSize=18)

%% Section 6 - FIM
% Create a copy of the sens model to compute the FIM
Model_FIM = Model_sens;

% Compute the FIM
Model_fimResults = Model_FIM.computeFIM(Model_sens.Solutions.sens); 

% Generate a count of measured cells (in place of real data):
Model_cellCounts = 10*ones(size(Model_FIM.tSpan));
% Model_cellCounts(1:30) = 400;

%% Section 6.1
optimal_experiment = Model_FIM.optimizeCellCounts(Model_fimResults,sum(Model_cellCounts));
bar(Model_FIM.tSpan,optimal_experiment);

%% 
% Evaluate the provided experiment design (in "cellCounts") 
% and produce an array of FIMs (one for each parameter set):
[Model_fimTotal,~,~] = ...
    Model_FIM.evaluateExperiment(Model_fimResults,Model_cellCounts);
% dOptim_criteria = det(Model_fimTotal{1}) % to maximize (if using argument for dopt)
[v,d] = eig(Model_fimTotal{1}); % maximize the minimum eigenvalue
min_eig = min(v)

[Model_fimTotal_opt,~,~] = ...
    Model_FIM.evaluateExperiment(Model_fimResults,optimal_experiment);
% dOptim_criteria_opt = det(Model_fimTotal_opt{1}) % to maximize (if using argument for dopt)
[v2,d2] = eig(Model_fimTotal_opt{1});
min_eig_opt = min(v)

theta0 = [Model_FIM.parameters{:,2}];

%%

Model_FIM.plotFIMResults(Model_fimTotal, Model_FIM.parameters, theta0, ...
                         PlotEllipses=true, EllipseLevel=0.9);
xlim = get(gca,'XLim');
ylim = get(gca,'YLim');
hold on
plot([theta0(2), theta0(2)+1/sqrt(d(1,1))*v(2,1)],[theta0(1),theta0(1)+1/sqrt(d(1,1))*v(1,1)])
plot([theta0(2), theta0(2)+1/sqrt(d(2,2))*v(2,2)],[theta0(1),theta0(1)+1/sqrt(d(2,2))*v(1,2)])

Model_FIM.plotFIMResults(Model_fimTotal_opt, Model_FIM.parameters, theta0, ...
                         PlotEllipses=true, EllipseLevel=0.9);
set(gca,'XLim', xlim);
set(gca,'YLim', ylim);

% optimize for dOptimality - maximize the determinant of the FIM which
% will minimize the volume of the ellipse