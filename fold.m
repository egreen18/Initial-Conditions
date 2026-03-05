function [matrix] = fold(vector)
%FOLD Folds a 1x4 vector into a 2x2 matrix
arguments (Input)
    vector
end

arguments (Output)
    matrix
end

matrix = zeros(2,2);
matrix(1, :) = vector(1:2);
matrix(2, :) = vector(3:4);

end