% Investigate how the FIM may be used to optimize controllable initial
% conditions during experimental design

% Begin with a toy model: simple birth-death

%% Preliminaries:
% clear
% close all
addpath(genpath('../Rotation/SSIT'));

%% Section 1 - Define Model
% Initiate model
Model = SSIT;    

% One species in system, protein X
Model.species = {'X'};   

% No protein at time 0
Model.initialCondition = [0];

% Set stoichiometry of reactions
Model.stoichiometry = [1,1];   % [birth, birth2, death]

% Set propensity functions assuming population-independent birth
Model.propensityFunctions = {'k_birth','k_birth_2'};

% Set initial guesses for parameters:
Model.parameters = ({'k_birth',1; 'k_birth_2',1});

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
Model_ODE = Model_ODE.formPropensitiesGeneral('Model_ODE_2_2',false);

% Solve ODEs
Model_ODE.Solutions = Model_ODE.solve;

% Plot ODE Solutions
Model_ODE.plotODE(Model_ODE.species, Model_ODE.tSpan,...
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
Model_FSP.fspOptions.initApproxSS = true;

% Create symbolic propensity functions
Model_FSP = Model_FSP.formPropensitiesGeneral('Model_FSP_2_2',false);

% Solve Model
Model_FSP.Solutions = Model_FSP.solve;

% Plot marginal distributions at final time
Model_FSP.plotFSP(Model_FSP.Solutions, Model_FSP.species, 'marginals', length(Model_FSP.tSpan))

%% Section 5 - Sensitivty Analysis
% Make a copy of the FSP Solution for sensitivity analysis
Model_sens = Model_FSP;

% Set solution schemes to FSP sensitivity
Model_sens.solutionScheme = 'fspSens';

% Create symbolic propensity functions
Model_sens = Model_sens.formPropensitiesGeneral('Model_sens_2_2',false);

% Solve the sensitivity problem
Model_sens.Solutions = Model_sens.solve(Model_sens.Solutions.stateSpace);

% Plot the results from the sensitivity analysis:
Model_sens.plotFSP(Model_sens.Solutions,...
Model_sens.species(1), 'sens', 20, [], {'linewidth',3}, ...
Colors=[0.23,0.67,0.2], AxisLabelSize=14, TickLabelSize=10, ...
Title="Toy Model (Birth Death)", TitleFontSize=18)

%% Section 6 - FIM
% Create a copy of the sens model to compute the FIM
Model_FIM = Model_FSP;

% Compute the FIM
Model_fimResults = Model_FIM.computeFIM(); 

Model_FIM.plotFIMResults(Model_fimResults, Model_FIM.parameters, ...
                         PlotEllipses=true, EllipseLevel=0.9);