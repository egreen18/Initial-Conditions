%% Content
% This investigation is a preliminary exploration of the application of the
% PDO to simulate data and the FIM
%
% k_birth   =   1
% k_death   =   0.1
% tSpan     =  [0,40]
%
% This system equilbriates to a population of 10 with a half life of 6.93s

%% Preliminaries:
clear
close all
clc
addpath(genpath('../Rotation/SSIT'));

%% Section 1
% Define model resolution
resolution = 200;
    
% Initiate model
Model = SSIT;    

% Set the times at which distributions will be computed:
Model.tSpan = linspace(0,40,resolution);

% One species in system, protein X
Model.species = {'X'};   

% Initial Conditions
Model.initialCondition = 0;

% Set stoichiometry of reactions
Model.stoichiometry = [1,-1];   % [birth, death]

% Set propensity functions assuming population-independent birth
Model.propensityFunctions = {'k_birth','k_death * X'};

% Set initial guesses for parameters:
Model.parameters = ({'k_birth',1; 'k_death',0.1});

% Print a summary of the Model
Model.summarizeModel

%% Section 2 - Simulation Data
% Make a copy of the model for simulating data
Model_Sim = Model;

% Number of independent data sets to generate:
Model_Sim.ssaOptions.Nexp = 1;  

% Number of cells to include at each time point for each data set:
Model_Sim.ssaOptions.nSimsPerExpt = 10;

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
[Model_Sim_FSPsoln,Model_Sim.fspOptions.bounds, Model_Sim] = Model_Sim.solve;

% Generate and save data:
dataTable = Model_Sim.sampleDataFromFSP(Model_Sim_FSPsoln,...
                                             ['data/Birth_Death_' ...
                                             '1_sim.csv']); 
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

disp(Model_Sim_Data_pars)

%% Section 5 - PDO
% Create a copy of the model for PDO:
Model_PDO = Model_Sim_Data;

% Set PDO to Binomial for X
Model_PDO.pdoOptions.type = 'Binomial';
% Model_PDO.pdoOptions.unobservedSpecies = 'onGene';

% Vary this variable of interest
% Setting to one should return non-distorted results
Model_PDO.pdoOptions.props.CaptureProbabilityS1 = 0.95;    % Gene State is not measured

% Model_PDO.pdoOptions.props.CaptureProbabilityS2 = 0.05; % 95% drop out from RNA
[~,Model_PDO] = Model_PDO.generatePDO();

%% Section 6 - Distorted Simulation
% Generate and save data:
dataTable = Model_PDO.sampleDataFromFSP(Model_Sim_FSPsoln,...
                                             ['data/Birth_Death_' ...
                                             '1_sim.csv']); 

% Load the simulated data, matching the species name of the model  
% (e.g., the model species 'offGene' is column 'exp1_s1' in the file):
Model_PDO = Model_PDO.loadData('data/Birth_Death_1_sim.csv',...
                {'X','exp1_s1'});

% Specify how many model parameters will be fit (the rest will be fixed):
fitpars = 2;
Model_PDO.fittingOptions.modelVarsToFit = 1:fitpars;

% Set fitOptions, with the maximum allowable number of iterations to fit:
fitOptions = optimset('Display','iter','MaxIter',100);

% Store parameters for fitting:
Model_PDO_pars = cell2mat(Model_PDO.parameters(1:fitpars,2));

[Model_PDO_pars,~] = ...
 Model_PDO.maximizeLikelihood(Model_PDO_pars,fitOptions);

disp(Model_PDO_pars)