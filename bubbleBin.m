function [x,y,sz] = bubbleBin(tSpan,expectedValue,nSamples,nBins)
%BUBBLEBIN Bins count over time data to be visualized by bubblechart
%   Divides tSpan into a given number of bins (nBins) and groups count data into
%   those bins. tSpan and data must have the same dimensions. Bins are
%   named after the average of their time span. Results can be fed into the
%   bubblechart function native to MATLAB
%   tSpan           - Vector, time series data
%   expectedValues  - Vector, X count data from model solution (ODE, etc)
%   nSamples        - Vector, experimental design samples per time point
%   nBins           - Scalar, number of bins for grouping data
arguments (Input)
    tSpan
    expectedValue
    nSamples
    nBins = length(tSpan)/2
end

arguments (Output)
    x
    y
    sz
end

% ERROR CHECKING
% Checking for too many bins
if nBins > length(tSpan)/ 2
    error('Number of bins cannot exceed the 1/2 the length of the time span.');
end

% Binning tSpan and counting data in bins
x_p = ones(1,nBins);
y_p = zeros(1,nBins);
sz_p = zeros(1,nBins);
ratio = ceil(length(tSpan)/nBins);
for i = 1:length(x_p)
    a = 1+ratio*(i-1);
    b = ratio*i;
    if b > length(tSpan)
        b = length(tSpan);
    end
    x_p(i) = mean(tSpan(a:b));
    y_p(i) = mean(expectedValue(a:b));
    sz_p(i) = sum(nSamples(a:b));
end

% Pruning out empty bins
x = [];
y = [];
sz = [];
for i = 1:length(sz_p)
    if sz_p(i)
        x(end+1) = x_p(i);
        y(end+1) = y_p(i);
        sz(end+1) = sz_p(i);
    end
end



end