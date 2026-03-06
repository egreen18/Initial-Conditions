function [] = bubblePlot_mixed(results)
%BUBBLEPLOT Takes dOpt "results" and plots the ODE solution with bubbles
%   Overlays bubbles on the ODE solutions to visualize the the optimal
%   sampling times and quantites along the solution predicted by the ODE
%   model. Works with the "bubbleBin" function. Checks for
%   multi-dimensional Expected Value arrays and updates behavior
%   accordingly. Optionally standardizes all axes of a subplot to scale to
%   the largest magnitude pair of axis limits.
arguments (Input)
    results
end

arguments (Output)
end


% Calling bubbleBin and plotting for each ODE solution
figure()
hold on

% Plotting the ODE Results
for i = 1:size(results.expectedValues,2)
    ode(i) = plot(results.tSpan, results.expectedValues(:,i), ...
        'LineWidth',3, ...
        'DisplayName',"IC = "+string(results.IC(i)));
end

% Plotting the optimal sampling bubbles
% [x,y,sz] = bubbleBin(results.tSpan, results.expectedValues, ...
%     results.optimalExperiment);
% bubblechart(x,y,sz,'DisplayName','Optimal Sampling')

% Plotting the optimal sampling regions
[x,~,sz] = bubbleBin(results.tSpan, results.expectedValues, ...
    results.optimalExperiment);
high = max(results.expectedValues,[],'all')*2;
color = [201,192,149]/255;
for i = 1:length(x)
    bot_x = x(i) - results.tSpan(end)/10*sz(i)/sum(sz);
    top_x = x(i) + results.tSpan(end)/10*sz(i)/sum(sz);
    region_x = [bot_x top_x top_x bot_x];
    region_y = [0 0 high high];
    block(i) = patch(region_x, region_y, color, 'FaceAlpha', 0.3, ...
        'EdgeColor', 'none', 'DisplayName', 'Optimal Sampling Region');
end


hold off

% Generating a string descrbing the probability distribution
prob_str = string(results.prob(1)*100)+"/"+string(results.prob(2)*100);

% Generating legend components
lgd_comp = [];
for i = 1:length(ode)
    lgd_comp(end+1) = ode(i);
end
lgd_comp(end+1) = block(1);

% Beautifying
title("Optimal Sampling Times for a "+prob_str+" mixed IC of "+results.IC(1)...
    +" and "+results.IC(2))
xlabel("Time")
ylabel("X Count")
grid on
lgd = legend(lgd_comp, 'Location','east');
title(lgd, "dOpt = "+sprintf('%.2e', results.dOpt))
ylim([0 1.2*max(results.expectedValues,[],'all')])

end