function [xlim, ylim] = standard_axes(xlim1,ylim1,xlim2,ylim2)
%STANDARD_AXES Iteratively standardize axes to the largest magnitude pair
%   Takes in two pairs of xlim and ylim, compares them, and returns the
%   largest magnitude arrangement of axis limits
arguments (Input)
    xlim1
    ylim1
    xlim2
    ylim2
end

arguments (Output)
    xlim
    ylim
end

% Predfining output limits
xlim = [0,0];
ylim = [0,0];

% Constructing output limits by input comparison
xlim(1) = min(xlim1(1),xlim2(1));
xlim(2) = max(xlim1(2),xlim2(2));

ylim(1) = min(ylim1(1),ylim2(1));
ylim(2) = max(ylim1(2),ylim2(2));

end