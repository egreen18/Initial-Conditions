function [vector] = flatten(matrix)
%FLATTEN Flattens a 2x2 matrix into a 1x4 vector
arguments (Input)
    matrix
end

arguments (Output)
    vector
end

vector = zeros(1,4);
vector(1) = matrix(1, 1);
vector(2) = matrix(1, 2);
vector(3) = matrix(2, 1);
vector(4) = matrix(2, 2);

end