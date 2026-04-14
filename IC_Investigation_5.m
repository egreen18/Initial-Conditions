% This investigation is conducted to verify that the gating method is
% functioning as expected

%% Preliminaries:
clear 
close all
clc
addpath(genpath('../Rotation/SSIT'));
timeInd = [1,50,100,200];

%% Section 1 - Solving with no gate
IC = 0; % Starting with 0 mRNA
gene_state = [2;0];

[results, model_no_gate] = dOpt_bursting(IC, gene_state);
% bubblePlot(results);
dOpt_no_gate = results.dOpt;
model_no_gate.plotFSP(plotType='marginals', indTimes = timeInd)
fprintf('The standard [2 0 0] IC case produces a D-Optimality Criterion of %.3e\n',dOpt_no_gate)

%% Section 2 - Solving with gate
% IC = 0; % Starting with 0 mRNA
% gene_state = [2;0];
% gate_param = 3; % Gating for mRNA
% gate_val = 10; % Gating at 10 to replicate the above IC
% 
% [results, model_gate] = dOpt_bursting_gate(IC, gene_state, gate_param, gate_val);
% % bubblePlot(results);
% dOpt_gate = results.dOpt;
% model_gate.plotFSP(plotType='marginals', indTimes = timeInd)

%% Section 3 - Solving with gate test for comparison to standard IC case
IC = 0; % Starting with 0 mRNA
gene_state = [2;0];

[results, model_gate] = dOpt_bursting_gate_test(IC, gene_state, [2 0 0]);
% bubblePlot(results);
dOpt_gate_test = results.dOpt;
model_gate.plotFSP(plotType='marginals', indTimes = timeInd)
fprintf('The gated [2 0 0] IC case produces a D-Optimality Criterion of %.3e\n',dOpt_gate_test)

% -- OBSERRVATIONS -- 
% System A solves for D-Opt via the standard route for the system with IC [2 0 0].
% System B solves for D-Opt by running the [2 0 0] IC simulation to steady
% state, and then gating again for a reset IC of [2 0 0]. This process is
% able to produce equivelant information values per D-Opt, which is a good
% proof of concept. Let's consider different starting points? Are all
% steady states of the same quality? Or does a system retain some
% information about it's initial conditions even after sitting in steady
% state for a while?
%% Section 4 - Considering varied starting points
% -- NO GATE [2 0 0] --
IC = 0; % Starting with 0 mRNA
gene_state = [2;0];

[results, model_no_gate] = dOpt_bursting(IC, gene_state);
% bubblePlot(results);
dOpt_no_gate = results.dOpt;
model_no_gate.plotFSP(plotType='marginals', indTimes = timeInd, Title="No Gate Case")
fprintf('The standard [2 0 0] IC case produces a D-Optimality Criterion of %.3e\n',dOpt_no_gate)

% -- GATE [2 0 10] to [2 0 0] ---
IC = 10; % Starting with 0 mRNA
gene_state = [2;0];

[results, model_gate] = dOpt_bursting_gate_test(IC, gene_state, [2 0 0]);
% bubblePlot(results);
dOpt_gate_test = results.dOpt;
model_gate.plotFSP(plotType='marginals', indTimes = timeInd)
fprintf('The gated [2 0 10] to [2 0 0] IC case produces a D-Optimality Criterion of %.3e\n',dOpt_gate_test)
