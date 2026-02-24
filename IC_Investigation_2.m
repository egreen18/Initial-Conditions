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

%% Section 4-0: (Antiquated) A Heat Map to Explore the Space
% Initial attempt at heatmap building; changed method to allow for
% iterative analysis of this large system

% Useful functions
tri_count = @(n) n*(n+1)/2;

% Input IC range
IC_range = [0,10];
IC = IC_range(1):1:IC_range(2);

% Checking for already computed results
name = "results_"+IC_range(1)+"_"+IC_range(2)+".mat";
ignore_existing = 0;    % Ignore pre-computed results?
skip = 0;
if ~ignore_existing
    if exist("birth_death_heat/"+name,"file") == 2
        load("birth_death_heat/"+name);
        skip = 1;
        disp("Loaded pre-computed result from birth_death_heat/"+name)
    end
end

% Skip analysis if a save file was succesfully loaded
if ~skip
    disp("Analyzing IC pairs over range "+IC_range(1)+" to "+IC_range(2)+"...")

    % Initialize the triangular matrix
    heat_matrix = zeros(length(IC));
    
    % Transform IC range into a 2-D triangular space to ignore symmetries
    k = 1;
    for i = 1:length(IC)
        IC1 = IC(i);
        j = 1;
        IC2 = IC(j);
        while IC2 <= IC1
            % Provide two IC's to the model
            IC_in = [IC1, IC2];
            results = dOpt_birth_death(IC_in);
    
            % Store the results into the triangular matrix
            heat_matrix(i,j) = results.dOpt;
    
            % Display Progress
            disp(k+"/"+tri_count(length(IC))+"...")

            % Update counters
            k = k + 1;
            j = j + 1;
    
            % Error proofing
            if j > length(IC)
                IC2 = inf;
            else
                IC2 = IC(j);
            end
        end
    end
    
    
    % Fill in the rest of the matrix using symmetries
    heat_matrix = tril(heat_matrix) + tril(heat_matrix,-1)';
    
    % Transform the matrix to work with imagesc function
    heat_matrix = rot90(heat_matrix);
    heat_matrix = flipud(heat_matrix);
    
    % Saving results
    save("birth_death_heat/"+name) 
    disp("Finished and saved results to birth_death_heat/"+name)

end

% Visualize the results
figure()
    imagesc(heat_matrix)
    set(gca, 'YDir', 'normal'); 
    xlabel('Initial Condition 1')
    ylabel('Initial Condition 2')
    colorbar
    
    % Update axis tick marks
    xticks(1:1:length(IC))
    yticks(1:1:length(IC))
    
    xticklabels(IC_range(1):1:IC_range(2))
    yticklabels(IC_range(1):1:IC_range(2))

%% Section 4 - A Heat Map to Explore the Space
% Observations...

% Input IC range
IC_range = [0,70];

% Pulling the saved progress or initializing if none is present
if exist("birth_death_heat_iterative/results.mat","file") == 2
    load("birth_death_heat_iterative/results.mat");
    disp("Loaded heat_matrix from saved results.");
else
    heat_matrix = zeros(IC_range(2)+1,IC_range(2)+1);
    disp("Initialized heat_matrix.")
end

% Checking to ensure appropriate matrix dimensions
if length(heat_matrix) < IC_range(2)+1
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