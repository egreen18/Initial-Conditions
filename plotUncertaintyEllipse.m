function [] = plotUncertaintyEllipse(results, sigma, newFigure)
%plotUncertaintyEllipse plots an FIM Uncertainty Ellipse
%   From the results of an FIM solution, extracts the eigenvalues and
%   eigenvectors of the inverse FIM matrix. This is scaled by a provided
%   sigma value and transformed to be centered around the true parameter
%   values and then plotted as an ellipse.
%   INPUTS
%       results     -   The results structure constructed by FIM wrapper
%       sigma       -   Standard deviation of the ellipse, 3 by default
%       newFigure   -   Boolean, generate new figure? 1 by default
%   OUTPUTS
%       ... generates a figure
arguments (Input)
    results
    sigma = 3
    newFigure = 1
end

arguments (Output)
end

% Extracting the true parameter values from the results structure
theta0 = results.parameters(:,2);
center = [theta0{1}; theta0{2}]; 

% Extracting the FIM matrix from the results structure
I = results.fimTotal;

% Calculating the uncertainty matrix from the inverse FIM matrix
unc = I^-1;

% Calculating the eigenvalues and vectors of the uncertainty matrix
[eigVec,D] = eig(unc);
eigVal = diag(D);

% Defining the parametric ellipse function for plotting
ellipse = @(phi) center + (sigma*sqrt(eigVal(1))*eigVec(:,1))*cos(phi)... 
                        + (sigma*sqrt(eigVal(2))*eigVec(:,2))*sin(phi);

% Generating points to define the ellipse
phi = linspace(0, 2*pi, 200);
points = ellipse(phi);
x = points(1,:);
y = points(2,:);

% Plotting the resulting ellipse
if newFigure
    figure()
end
plot(x,y,'LineWidth',3,'DisplayName', 'FIM Uncertainty Ellipse')

% Beautifying
xlabel(results.parameters{1})
ylabel(results.parameters{2})
grid on

end