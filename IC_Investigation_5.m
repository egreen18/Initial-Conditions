% This investigation is conducted to verify that the gating method is
% functioning as expected

%% Preliminaries:
clear 
close all
clc
addpath(genpath('../Rotation/SSIT'));
timeInd = [1,50,100,200];


%% Section 1 - Solving with no gate
IC = 10; % Starting with 10 mRNA
gene_state = [2;0];

[~, model_no_gate] = dOpt_bursting(IC, gene_state);
% bubblePlot(results);
% dOpt_no_gate = results.dOpt;
model_no_gate.plotFSP(plotType='marginals', indTimes = timeInd)


%% Section 2 - Solving with gate
IC = 0; % Starting with 0 mRNA
gene_state = [2;0];
gate_param = 3; % Gating for mRNA
gate_val = 10; % Gating at 10 to replicate the above IC

[~, model_gate] = dOpt_bursting_gate(IC, gene_state, gate_param, gate_val);
% bubblePlot(results);
% dOpt_gate = results.dOpt;
model_gate.plotFSP(plotType='marginals', indTimes = timeInd)