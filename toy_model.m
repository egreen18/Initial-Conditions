% Investigate how the FIM may be used to optimize controllable initial
% conditions during experimental design

% Begin with a toy model: simple birth-death

%% Section 1 - Define Model
% Initiate model
Model = SSIT;    

% One species in system, protein X
Model.species = {'X'};   

% No protein at time 0
Model.initialCondition = [0];

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
Model_ODE.odeIntegrator = 'ode23';

% Create symbolic propensity functions
Model_ODE = Model_ODE.formPropensitiesGeneral('Model_ODE',false);

% Solve ODEs
[~,~,Model_ODE] = Model_ODE.solve;

% Plot ODE Solutions
Model_ODE.plotODE(Model_ODE.species, Model_ODE.tSpan,...
    {'linewidth',4}, Title='Birth-Death ODE Soln', TitleFontSize=24,...
    AxisLabelSize=18, TickLabelSize=18, LegendFontSize=15,...
    LegendLocation='east', XLabel='Time', YLabel='Molecule Count')

%% Section 3 - Solve FSP model
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

% Solve Model
[FSP_soln, Model_FSP.fspOptions.bounds] = Model_FSP.solve;

% Plot marginal distributions at final time
Model_FSP.plotFSP(FSP_soln, Model_FSP.species, 'marginals', length(Model_FSP.tSpan))