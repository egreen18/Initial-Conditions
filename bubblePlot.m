function [] = bubblePlot(results, standardize_axes)
%BUBBLEPLOT Takes dOpt "results" and plots the ODE solution with bubbles
%   Overlays bubbles on the ODE solution to visualize the the optimal
%   sampling times and quantites along the solution predicted by the ODE
%   model. Works with the "bubbleBin" function. Checks for
%   multi-dimensional Expected Value arrays and updates behavior
%   accordingly. Optionally standardizes all axes of a subplot to scale to
%   the largest magnitude pair of axis limits.
arguments (Input)
    results
    standardize_axes = 1
end

arguments (Output)
end

% Examining the results
dim = size(results.expectedValues);
resolution = length(results.tSpan);

% If multi-dimensional result matrix, check for which dimensions were
% identified by the optimal experiment vector
if dim(2) > 1
    indices_temp = find(results.optimalExperiment);
    N_samples_temp = results.optimalExperiment(indices_temp);
    indices_temp = ceil(indices_temp/200);
    multi = 1;
else
    % Should this not be multi-dimensional, set one dimensional indices
    multi = 0;
end

% Combining like indices and summing their samples
indices = unique(indices_temp);
N_samples = zeros(size(indices));
for i = 1:length(indices)
    N_samples(i) = sum(N_samples_temp(indices_temp==indices(i)));
end

% Calling bubbleBin and plotting for each identified index
if multi
    % Pre-req for subplot organization
    grid_1 = ceil(sqrt(length(indices)));
    grid_2 = ceil(length(indices)/grid_1);
    counter = 0;

    % Pre-req for axis standardization
    xLim_bar = [0,0];
    yLim_bar = [0,0];

    % Begin Figure
    figure()
    for i = indices % NOTE NON-STANDARD INDEXING
        counter = counter + 1;
        subplot(grid_1,grid_2,counter)
        % Plotting the ODE Results
        plot(results.tSpan, results.expectedValues(:,i), ...
            'LineWidth',3, ...
            'DisplayName','Expected Solution Path')
        
        hold on
        
        % Plotting the optimal sampling bubbles
        [x,y,sz] = bubbleBin(results.tSpan, results.expectedValues(:,i), ...
            results.optimalExperiment(1+(i-1)*resolution:i*resolution));
        bubblechart(x,y,sz,'DisplayName','Optimal Sampling')
        
        hold off
        
        % Beautifying
        title("Optimal Sampling Distribution at IC = "+results.IC(i))
        xlabel("Time")
        ylabel("X Count")
        grid on
        lgd = legend('Location','east');
        title(lgd, 'N_{samples} = '+string(N_samples(counter)))

        % Checking the current axes
        xLim_now = get(gca, 'XLim');
        yLim_now = get(gca, 'YLim');

        % Updating to the "bar" (current highest magnitude axes)
        [xLim_bar,yLim_bar] = standard_axes(xLim_bar,yLim_bar,xLim_now,yLim_now);
        
    end
    sgtitle("Multi-IC Sampling with Combined dOpt = "...
        +sprintf('%.2e', results.dOpt))

    % Standardizing axes
    if standardize_axes
        for i = 1:length(indices)
            subplot(grid_1,grid_2,i)
            xlim(xLim_bar)
            ylim(yLim_bar)
        end
    end
else
    figure()
    % Plotting the ODE Results
    plot(results.tSpan, results.expectedValues, ...
        'LineWidth',3, ...
        'DisplayName','Expected Solution Path')
    
    hold on
    
    % Plotting the optimal sampling bubbles
    [x,y,sz] = bubbleBin(results.tSpan, results.expectedValues, ...
        results.optimalExperiment);
    bubblechart(x,y,sz,'DisplayName','Optimal Sampling')
    
    hold off
    
    % Beautifying
    title("Optimal Sampling Distribution at IC = "+results.IC)
    xlabel("Time")
    ylabel("X Count")
    grid on
    lgd = legend('Location','east');
    title(lgd, "dOpt = "+sprintf('%.2e', results.dOpt))
end

end