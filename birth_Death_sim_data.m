function [theta] = birth_Death_sim_data(IC, nSim, results)
%birth_Death_sim_data is a wrapper for simulating model-data fit
%   This function generates a random set of data to simulate experimental
%   results adhering to the true model parameters. It then fits a model to
%   each data set and logs the resulting parameter pair with the best MLE.
%   INPUTS:
%       IC      -   The initial condition for the model
%       nSim    -   The number of simulated experiments run
%       results -   results structure from the FIM solution
%
%   OUTPUTS:
%       theta   - A 2xnSim matrix of identified model parameters

arguments (Input)
    IC
    nSim
    results
end

arguments (Output)
    theta
end

%% Section 1 - Define Model
% Predefine output matrix
theta = zeros(2,nSim);

% Define model resolution
resolution = 200;
    
% Initiate model
Model = SSIT;    

% Set the times at which distributions will be computed:
Model.tSpan = linspace(0,40,resolution);

% One species in system, protein X
Model.species = {'X'};   

% Initial Conditions
Model.initialCondition = IC;

% Set stoichiometry of reactions
Model.stoichiometry = [1,-1];   % [birth, death]

% Set propensity functions assuming population-independent birth
Model.propensityFunctions = {'k_birth','k_death * X'};

% Set initial guesses for parameters:
Model.parameters = ({'k_birth',1; 'k_death',0.1});

% Print a summary of the Model
% Model.summarizeModel

%% Section 2 - Sampling from FSP Solution
for i = 1:nSim
    % Make a copy of the model for simulating data
    Model_Sim = Model;
    
    % Number of independent data sets to generate:
    Model_Sim.ssaOptions.Nexp = 1;  
    
    % Number of cells to include at each time point for each data set:
    Model_Sim.ssaOptions.nSimsPerExpt = 1;
    
    % Ensure the solution scheme is set to FSP (default):
        Model_Sim.solutionScheme = 'FSP';  
    
    % This function compiles and stores the given reaction propensities  
    % into symbolic expression functions that use sparse matrices to  
    % operate on the system based on the current state. The functions are 
    % stored with the given prefix, in this case, 'STL1_FSP'
    Model_Sim = Model_Sim.formPropensitiesGeneral('STL1_sim_FSP');
        
    % Set FSP 1-norm error tolerance:
    Model_Sim.fspOptions.fspTol = 1e-4; 
        
    % Guess initial bounds on FSP StateSpace:
    Model_Sim.fspOptions.bounds = [30];
        
    % Have FSP approximate the steady state for the initial distribution 
    % by finding the eigenvector corresponding to the smallest magnitude 
    % eigenvalue (i.e., zero, for generator matrix A, d/dtP(t)=AP(t)):
    Model_Sim.fspOptions.initApproxSS = false; 
        
    % Solve Model:
    [Model_Sim_FSPsoln,Model_Sim.fspOptions.bounds] = Model_Sim.solve;
    
    % Generate and save data:
    dataTable = Model_Sim.sampleDataFromFSP(Model_Sim_FSPsoln,...
                                                 ['data/Birth_Death_' ...
                                                 '1_sim.csv'],...
                                                 results.optimalExperiment); 
    %% Section 3 - Load Simulated Data to Model
    % Make new copies of our model:
    Model_Sim_Data = Model_Sim;
    
    % Load the simulated data, matching the species name of the model  
    % (e.g., the model species 'offGene' is column 'exp1_s1' in the file):
    Model_Sim_Data = Model_Sim_Data.loadData('data/Birth_Death_1_sim.csv',...
                    {'X','exp1_s1'});
    
    % Specify how many model parameters will be fit (the rest will be fixed):
    fitpars = 2;
    Model_Sim_Data.fittingOptions.modelVarsToFit = 1:fitpars;
    
    % Set fitOptions, with the maximum allowable number of iterations to fit:
    fitOptions = optimset('Display','iter','MaxIter',100);
    
    % Store parameters for fitting:
    Model_Sim_Data_pars = cell2mat(Model_Sim_Data.parameters(1:fitpars,2));
    
    %% Section 4 - Compute the MLEs:
    [Model_Sim_Data_pars,~] = ...
     Model_Sim_Data.maximizeLikelihood(Model_Sim_Data_pars,fitOptions);
    
    theta(:,i) = Model_Sim_Data_pars;
end

end