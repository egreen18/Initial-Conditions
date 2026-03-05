function P = uniquePairs(v)
%UNIQUEPAIRS Return all unique unordered pairs from a 1D vector.
%   P = UNIQUEPAIRS(v) takes a numeric/logical vector v and returns an
%   N-by-2 matrix P where each row is a unique pair [a b] with a < b.
%   Duplicate values in v are ignored for pairing purposes.
%
%   Examples:
%       uniquePairs([1 2 3])
%           % -> [1 2; 1 3; 2 3]
%
%       uniquePairs([3 3 1 2 2])
%           % -> [1 2; 1 3; 2 3]
%
%       uniquePairs([5])
%           % -> 0x2 empty (no pairs)
%
%   Notes:
%       - Input must be numeric or logical and a vector (row or column).
%       - Pairs are generated from the unique sorted values of v.
%       - If there are fewer than two unique values, returns an empty N-by-2.

    % Validate input
    validateattributes(v, {'numeric','logical'}, {'vector'}, mfilename, 'v', 1);

    % Work with a column vector and get unique sorted values
    v = v(:);
    u = unique(v, 'sorted');   % ensures deterministic pair order

    n = numel(u);
    if n < 2
        % No possible pairs: return empty with consistent type
        P = zeros(0, 2, 'like', u);
        return;
    end

    % Indices for all 2-combinations (i < j)
    idx = nchoosek(1:n, 2);

    % Form the pairs; each row is [u(i), u(j)]
    P = [u(idx(:,1)) u(idx(:,2))];
end