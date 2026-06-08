%% Content
% Figuring out how to fit a model to simulated data

%% Preliminaries:
clear 
close all
clc
addpath(genpath('../Rotation/SSIT'));

%% Section 1 - Define Model
% Predefine the FIM Result Array
resolution = 80;
    
% Initiate model
Model = SSIT;    

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

% Means and standard deviations:
    % Model_FSP.plotFSP(speciesNames=Model_FSP.species,...
    %     plotType='meansAndDevs', lineProps={'linewidth',4},...
    %     Title='Birth Death', TitleFontSize=26,...
    %     AxisLabelSize=20, TickLabelSize=20, YLabel='Molecule Count',...
    %     XLabel='Time', LegendFontSize=20, LegendLocation='southeast');

% Marginal distributions:
% Model_FSP.plotFSP(speciesNames=Model_FSP.species(1),...
%     plotType='marginals', indTimes=[1,12,24,50,80],...
%     lineProps={'linewidth',3}, XLim=[0,15], Colors=[0.93,0.69,0.13]);

%% Section 3 - Solve SSA Trajectories
% Create a copy of the bursting gene model for SSA:
Model_SSA = Model;

% Set solution scheme to SSA:
Model_SSA.solutionScheme = 'SSA';

% 'nSimsPerExpt' is an SSA option that defaults to 100, sets the number
% of simulations performed per experiment (set small number for demo):
Model_SSA.ssaOptions.nSimsPerExpt=2;

% 'verbose' defaults to false, prints completed sim number to screen.
Model_SSA.ssaOptions.verbose=true;

% Setting the time span; no burn in is appropriate for this model
Model_SSA.tSpan = linspace(0,40,10);

% Set the initial time:
Model_SSA.initialTime = Model_SSA.tSpan(1); 

% Run iterations in parallel with multiple cores, or execute serially:
Model_SSA.ssaOptions.useParallel = true;

% Run SSA:
Model_SSA.Solutions = Model_SSA.solve;

% Plot SSA trajectories and means:
% Model_SSA.plotSSA(speciesIdx='all', numTraj=1,...
%     speciesNames=Model_SSA.species, lineProps={'linewidth',4}, ...
%     Title="Birth Death Trajectories", MeanOnly=false, TitleFontSize=32,...
%     AxisLabelSize=24, TickLabelSize=24, LegendFontSize=20,...
%     LegendLocation='east', XLabel='Time', YLabel='Molecule Count');

%% Section 4 - Sampling from FSP Solution
% Make a copy of the model for simulating data
Model_Sim = Model_FSP;

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
[Model_Sim_FSPsoln,Model_Sim.fspOptions.bounds] = Model_Sim.solve;

% Generate and save data:
dataTable = Model_Sim.sampleDataFromFSP(Model_Sim_FSPsoln,...
                                             ['data/Birth_Death_' ...
                                             '1_sim.csv']); 

% Plot data as histograms:
% for i = 1:4
%     subplot(2,2,i)  % Switch to current subplot
%     histogram(dataTable.exp1_s1(dataTable.time==Model_Sim.tSpan(i*ceil(length(Model_Sim.tSpan)/4))),....
%                                     30,"DisplayStyle","stairs")
% end 

%% Section 5 - Load Simulated Data to Model
% Make new copies of our model:
Model_Sim_Data = Model_FSP;

% Load the simulated data, matching the species name of the model  
% (e.g., the model species 'offGene' is column 'exp1_s1' in the file):
Model_Sim_Data = Model_Sim_Data.loadData('data/Birth_Death_1_sim.csv',...
                {'X','exp1_s1'});

% Specify how many model parameters will be fit (the rest will be fixed):
fitpars = 2;
Model_Sim_Data.fittingOptions.modelVarsToFit = 1:fitpars;

% Set fitOptions, with the maximum allowable number of iterations to fit:
fitOptions = optimset('Display','iter','MaxIter',1000);

% Store parameters for fitting:
Model_Sim_Data_pars = cell2mat(Model_Sim_Data.parameters(1:fitpars,2));

%% Section 6 - Compute the MLEs:
[Model_Sim_Data_pars,Model_Sim_Data_likelihood] = ...
 Model_Sim_Data.maximizeLikelihood(Model_Sim_Data_pars,fitOptions);

disp(Model_Sim_Data_pars)

% for l=1:length(Model_Sim_Data_pars)
%     Model_Sim_Data.parameters{l,2} = Model_Sim_Data_pars(l);
% end

% Make plots of the parameter fits from the MLEs:
% Model_Sim_Data.plotFits(plotType="all",lineProps={'linewidth',2},...
%     TitleFontSize=24, Title='4-state STL1 (MLE)', LegendFontSize=18,...
%     YLabel='Molecule Count', LegendLocation='northeast', AxisLabelSize=20);
