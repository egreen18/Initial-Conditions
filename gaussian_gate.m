function gate_gaus = gaussian_gate(gate,standard_deviation, normalize)
%GAUSSIAN_GATE transforms a sparse logical gate vector by blurring
%probabilities around 1's in the vector according to a provide standard
%deviation
%   Detailed explanation goes here
arguments (Input)
    gate
    standard_deviation
    normalize = true
end

arguments (Output)
    gate_gaus
end

% Locate open gates (gaussian sources)
source_idx = find(gate == 1);

% Define an empte vector for creating the gaussian transformation
gate_gaus = zeros(size(gate));

% Iterate through each source and add the resulting distribution to the vector
for source = source_idx
    gate_temp = 1:length(gate);
    gate_temp = exp(-1/2*((gate_temp-source)/standard_deviation).^2);
    gate_gaus = gate_gaus + gate_temp;
end

% Normalizing the resulting gate
if normalize
    gate_gaus = gate_gaus/sum(gate_gaus);
end

end