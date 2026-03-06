%% Content
% This investigation explores which COMBINATION of Initial Conditions 
% provides the most information for a simple Birth-Death system. 
% Key parameters of the system include:
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

%% Section 1: Symetrical Case
% Multi-IC sampling equally weights the two extrema when IC are 
% constrained symetrically about the equilibrium
IC = 0:1:20;
results = dOpt_birth_death(IC);
bubblePlot(results);
plotFIMResults(results);

%% Section 2: Super Eq Case
% Multi-IC sampling still equally weigths the two extrema when IC 
% are constrained to include significantly super equilibrium points
IC = 0:5:100;
results = dOpt_birth_death(IC);
bubblePlot(results);

%% Section 3: Sub Eq Case
% Multi-IC sampling still equally weigths the two extrema when IC 
% are constrained to disinclude super equilibrium points
IC = 0:1:10;
results = dOpt_birth_death(IC);
bubblePlot(results);

%% Section 4 - A Heat Map to Explore the Space
% Observations...

% Input IC range
IC_range = [0,40];
ellipse_plot = 1;

% Pulling the saved progress or initializing if none is present
if exist("birth_death_heat_iterative/results.mat","file") == 2
    load("birth_death_heat_iterative/results.mat");
    disp("Loaded heat_matrix from saved results.");
end

% Initializing storage matrices if not loaded
if ~exist('heat_matrix', 'var')
    heat_matrix = zeros(IC_range(2)+1,IC_range(2)+1);
    disp("Initialized heat_matrix.")
end

if ~exist('fim_matrix', 'var')
    fim_matrix = zeros(IC_range(2)+1,IC_range(2)+1,4);
    disp("Initialized fim_matrix.")
end

% Checking to ensure appropriate matrix dimensions
if size(heat_matrix,1) < IC_range(2)+1
    old_data = heat_matrix;
    heat_matrix = zeros(IC_range(2)+1,IC_range(2)+1);
    heat_matrix(1:size(old_data, 1), 1:size(old_data, 2)) = old_data;
end

if size(heat_matrix,1) < IC_range(2)+1
    old_data = heat_matrix;
    heat_matrix = zeros(IC_range(2)+1,IC_range(2)+1);
    heat_matrix(1:size(old_data, 1), 1:size(old_data, 2)) = old_data;
end

% Begin analysis
i = IC_range(1);
while i <= IC_range(2)
    j = IC_range(1);
    IC1 = i;
    while j <= IC_range(2)
        IC2 = j;

        % Checking if the analysis has been stored already
        if ~heat_matrix(i+1,j+1) == 0
            % Increment IC2
            j = j + 1; 
            continue
        end
        
        % Compute dOpt for the pair
        IC_in = [IC1, IC2];
        results = dOpt_birth_death(IC_in);

        % Store results symetrically in the heat matrix
        heat_matrix(i+1, j+1) = results.dOpt; 
        heat_matrix(j+1, i+1) = results.dOpt; 
        save("birth_death_heat_iterative/results.mat", 'heat_matrix');
        disp("Processed and saved IC1: " + IC1 + ", IC2: " + IC2);

        % Increment IC2
        j = j + 1; 
    end
    % Increment IC1
        i = i + 1; 
end

% Visualize the updated heat matrix
figure()
    ind = IC_range + 1;
    imagesc(heat_matrix(ind(1):ind(2),ind(1):ind(2)));
    title('Information Heat Map of IC Pairs in the Multi IC Case')
    set(gca, 'YDir', 'normal'); 
    xlabel('Initial Condition 1');
    ylabel('Initial Condition 2');
    colorbar;
    
    % Update axis tick marks
    ticks = 1:1:(ind(2)-ind(1)+1);
    labels = IC_range(1):1:IC_range(2);

    if length(ticks) > 50
        total = max(IC_range)/5+1;
        adjustment = ceil(linspace(1,length(ticks),total));
        ticks = ticks(adjustment);
        labels = labels(adjustment);
    elseif length(ticks) > 20 
        total = max(IC_range)/2+1;
        adjustment = ceil(linspace(1,length(ticks),total));
        ticks = ticks(adjustment);
        labels = labels(adjustment);
    end

    xticks(ticks);
    yticks(ticks);
    xticklabels(labels);
    yticklabels(labels);

%% Section 5 - Normalizing the Heat Map to Expected Values
% Using the linear combination hypothesis, the heat map can be normalized
% to a score which defines the vairation from the expected value.

% Input IC range
IC_range = [0,100];

% Load Single IC data for scoring pairs
load("single_IC_score.mat")

% Load heat matrix from above
load("birth_death_heat_iterative/results.mat");

normalized_heat_matrix = NaN(size(heat_matrix));

for i = 1:size(heat_matrix,1)
    for j = 1:size(heat_matrix,2)
        expected_value = (single_IC_score(i) + single_IC_score(j))/2;
        score = (heat_matrix(i,j) - expected_value) / expected_value;
        normalized_heat_matrix(i,j) = score;
    end
end

% Visualize the updated heat matrix
figure()
    ind = IC_range + 1;
    imagesc(normalized_heat_matrix(ind(1):ind(2),ind(1):ind(2)));
    title('Normalized Information Heat Map of IC Pairs in the Multi IC Case')
    set(gca, 'YDir', 'normal'); 
    xlabel('Initial Condition 1');
    ylabel('Initial Condition 2');
    colorbar;
    
    % Update axis tick marks
    ticks = 1:1:(ind(2)-ind(1)+1);
    labels = IC_range(1):1:IC_range(2);

    if length(ticks) > 50
        total = max(IC_range)/5+1;
        adjustment = ceil(linspace(1,length(ticks),total));
        ticks = ticks(adjustment);
        labels = labels(adjustment);
    elseif length(ticks) > 20 
        total = max(IC_range)/2+1;
        adjustment = ceil(linspace(1,length(ticks),total));
        ticks = ticks(adjustment);
        labels = labels(adjustment);
    end
    
    % Placing ticks
    xticks(ticks);
    yticks(ticks);
    xticklabels(labels);
    yticklabels(labels);