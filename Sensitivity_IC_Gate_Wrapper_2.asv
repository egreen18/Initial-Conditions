% This script serves as a wrapper for passing through a modified y0 to the
% sensitivity function in the SSIT. This modified y0 will ...

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
% Model_FSP.fspOptions.bounds = [30];

% Enable steady state initial distribution approximation
% NOTICE - steady state approximation sets the model to equilibrium at t0
Model_FSP.fspOptions.initApproxSS = false;

% Create symbolic propensity functions
Model_FSP = Model_FSP.formPropensitiesGeneral('Model_FSP_dOpt_2',false);

% Solve Model
Model_FSP.Solutions = Model_FSP.solve;

% Plot marginal distributions at final time
% timeInd = [10,50,100,200];
% Model_FSP.plotFSP(plotType='marginals', indTimes = timeInd)

%% Section 3 - Sensitivity Analysis
% Make a copy of the FSP Solution for sensitivity analysis
Model_sens = Model_FSP;

% Set solution schemes to FSP sensitivity
Model_sens.solutionScheme = 'fspSens'; 
Model_sens.sensOptions.solutionMethod = 'forward';


% Solve the sensitivity problem
[~,~,Model_sens] = Model_sens.solve(Model_FSP.Solutions.stateSpace);

%% Section 4 - Gating
% Make a copy of the Sens Solution for Gating
Model_gate = Model_sens;

% Retrieving state space at last time point
state = Model_sens.Solutions.fsp{end}.p.data.subs';

% Logical gate: only states with 10 or more mRNA
gate = state(3,:)>=10+1; % Plus one to transform for 0-indexing

% -- PROBABILITY MATRIX --
% Retrieving the prob matrix at last time point
prob = Model_gate.Solutions.fsp{end}.p.data.vals;

% Gate the prob matrix
gate_prob = prob(gate); 

% Normalize the resulting matrix
norm_factor = sum(gate_prob);
gate_prob = gate_prob/norm_factor;

% -- SENSITIVITY MATRIX --
gate_sens = zeros(length(Model.parameters),length(gate_prob));
for i = 1:length(Model.parameters)
    % Retrieving per parameter sensitivity
    sens = Model_sens.Solutions.sens.data{end}.S(i).data.vals;

    % Gating
    gate_sens(i,:) = sens(gate);
end

% Normalizing the gate_sens matrix
gate_sens = gate_sens / norm_factor;

% Flipping the gate_sens matrix
gate_sens = gate_sens';


% -- MODEL SOLUTION --

% Redefine model initial conditions
Model_gate.initialCondition = state(:,gate)-1; % Minus one for 0-index
Model_gate.initialProbs = gate_prob;
Model_gate.initialSensitivities = gate_sens;

% Solve the model with gated initial conditions
[~,~,Model_gate] = Model_gate.solve;