function [results, model] = dOpt_bursting_gate_test(IC, gene_state, gate)
%DOPT_SOLVE Solves the Toy Bursting-Gene model for the dOpt criterion
%   Takes a scaler Initial Condition value and returns the "results"
%   structure which contains multiple computed results. The function may
%   also accept multiple ICs in a simultaneous optimization problem. 
%   In this event, IC should be a vector containing all Initial Conditions 
%   to be considered. Initial gene on/off distributuion is provided by the
%   variable "gene_state", which must be a vertical vector of length 2. 
%
%   After initial sensitivity calculations, the system is gated using the
%   provided inputs and the solution continues with a reconstructed initial
%   condition, initial probability, and initial sensitivity. 
%
%   This modification of the gate wraper is meant to test if the gate logic
%   is able to produce the same results as the initial condition logic as
%   measured by the D-Optimality Criterion. 
%
%   Takes "gate" as an inpute, which is a vector of 3 gate values.
arguments (Input)
    IC
    gene_state
    gate
end

arguments (Output)
    results
    model
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
    [~,~,Model_sens] = Model_sens.solve(Model_FSP.Solutions.stateSpace);
    %% Section 4 - Gating
    % Make a copy of the Sens Solution for Gating
    Model_gate = Model_sens;
    
    % Retrieving state space at last time point
    state = Model_sens.Solutions.fsp{end}.p.data.subs';
    
    % Logical gate: only states with 10 or more mRNA
    gate_1 = state(1,:)==gate(1)+1; % Plus one to transform for 0-indexing
    gate_2 = state(2,:)==gate(2)+1;
    gate_3 = state(3,:)==gate(3)+1;
    gate = gate_1 & gate_2 & gate_3;
    
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
    for j = 1:length(Model.parameters)
        % Retrieving per parameter sensitivity
        sens = Model_sens.Solutions.sens.data{end}.S(j).data.vals;
    
        % Gating
        gate_sens(j,:) = sens(gate);
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

    %% Section 5 - FIM
    % Create a copy of the sens model to compute the FIM
    Model_FIM = Model_gate;
    
    % Compute the FIM
    Model_fimResults_temp = Model_FIM.computeFIM(Model_sens.Solutions.sens); 
    
    % For the multi case, concatenate Model_fimResults
    Model_fimResults(1+(i-1)*resolution:i*resolution) = Model_fimResults_temp;
    
    %% Section 6 - Second FSP Solution
    % Make a copy of the model for FSP
    Model_FSP2 = Model_gate;
    
    % Set the times at which distributions will be computed:
    Model_FSP2.tSpan = linspace(0,40,resolution);
    
    % Set the solution scheme to FSP
    Model_FSP2.solutionScheme = 'FSP';
    
    % Set the FSP 1-norm error tolerance
    Model_FSP2.fspOptions.fspTol = 1e-4;
    
    % Guess initial bounds on FSP StateSpace
    Model_FSP2.fspOptions.bounds = [30];
    
    % Enable steady state initial distribution approximation
    Model_FSP2.fspOptions.initApproxSS = false;
    
    % Create symbolic propensity functions
    Model_FSP2 = Model_FSP2.formPropensitiesGeneral('Model_FSP2_dOpt_2',false);
    
    % Solve Model
    Model_FSP2.Solutions = Model_FSP2.solve;
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
model = Model_FSP2;


end