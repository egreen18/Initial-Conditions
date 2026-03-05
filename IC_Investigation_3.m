%% Content
% This investigation explores which COMBINATION of MIXED Initial Conditions 
% provides the most information for a simple Birth-Death system when the
% IC are mixed with defined starting probabilities.
% Key parameters of the system include:
%
% k_birth   =   1
% k_death   =   0.1
% tSpan     =  [0,40]
%
% This system equilbriates to a population of 10 with a half life of 6.93s
%% Preliminaries:
clear 
close all
clc
addpath(genpath('../Rotation/SSIT'));

%% Section 1: 50/50 Case
IC = 0:1:20;
results = dOpt_birth_death(IC);
bubblePlot(results);
plotFIMResults(results);