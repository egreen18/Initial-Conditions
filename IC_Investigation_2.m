%% Content
% This investigation explores which COMBINATION of Initial Conditions 
% provides the most information for a simple Birth-Death system. 
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

%% Section 1: Symetrical Case
% Multi-IC sampling equally weights the two extrema when IC are 
% constrained symetrically about the equilibrium
IC = 0:1:20;
results = dOpt_birth_death(IC);
bubblePlot(results);

%% Section 2: Super Eq Case
% Multi-IC sampling still equally weigths the two extrema when IC 
% are constrained to include significantly super equilibrium points
IC = 0:5:100;
results = dOpt_birth_death(IC);
bubblePlot(results);

%% Section 3: Sub Eq Case
% Multi-IC sampling still equally weigths the two extrema when IC 
% are constrained to disinclude super equilibrium points
IC = 0:1:10;
results = dOpt_birth_death(IC);
bubblePlot(results);
