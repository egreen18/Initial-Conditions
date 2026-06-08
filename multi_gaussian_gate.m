function gate_gaus = multi_gaussian_gate(gate, state, var_mat)
%GAUSSIAN_GATE transforms a sparse logical gate vector by blurring
%probabilities around 1's in the vector according to a provide standard
%deviation
%   Detailed explanation goes here
arguments (Input)
    gate
    state
    var_mat
end

arguments (Output)
    gate_gaus
end

% Define an empty vector for creating the gaussian transformation
gate_gaus = zeros(1, length(state));

% Index over all gate states
for i = 1:size(gate,2)

% Define dX, distance from the gated state at each state
dX = state-gate(:,i);


% Calculate the gaussian around the gated state
% Implementing a multi-variate gaussian with a small perturbation to
% avoid NaN results (eye)
gaus_temp = diag(exp(-1/2*dX'*(var_mat+1e-10*eye(3))^-1*dX));

% Add the gaussian to the sum vector
gate_gaus = gate_gaus + gaus_temp';

end


end