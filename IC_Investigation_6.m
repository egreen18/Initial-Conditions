%% Content
% This investigation explores the application of a psuedo-PDO to the
% initial condition distribution of the bursting gene system using the
% logic gating method developed in Investigation 5.

%% Preliminaries:
clear 
close all
clc
addpath(genpath('../Rotation/SSIT'));

%% Section 1: Perfect Gate Control Case
% -- GATE [0 0 0] to [2 0 0], no PDO ---
IC = 0; % Starting with 0 mRNA
gene_state = [2;0];
gate = [2 0 2];

[results, model_gate] = dOpt_bursting_gate_test(IC, gene_state, gate);
% bubblePlot(results);
dOpt_gate_test = results.dOpt;
% model_gate.plotFSP(plotType='marginals', indTimes = timeInd)
fprintf('The [2 0 0] to [2 0 2] gate case produces a D-Optimality Criterion of %.3e\n',dOpt_gate_test)

%% Section 2: Initial attempts at a leaky gate implementation
% -- GATE [2 0 0] to [2 0 0], no PDO ---
IC = 0; % Starting with 0 mRNA
gene_state = [2;0];
gate = [2 0 0];
sd = 1;

[results, model_gate] = dOpt_bursting_gate_PDO(IC, gene_state, gate, sd);
% bubblePlot(results);
dOpt_gate_PDO = results.dOpt;
% model_gate.plotFSP(plotType='marginals', indTimes = timeInd)
fprintf('The PDO gated [2 0 0] to [2 0 0] with a standard deviation of %.0f produces a D-Optimality Criterion of %.3e\n',...
    [sd,dOpt_gate_PDO])

%% Section 3: Multi-dimensional Gaussian approach to creating a leaky gate
% -- GATE [2 0 0] to [2 0 0], Leaky gate
IC = 0; % Starting with 0 mRNA
gene_state = [2;0];
gate = [2 2;
        0 0;
        2 3];
var = [2 0 0;
       0 2 0;
       0 0 4];

[results, model_gate] = dOpt_bursting_leaky_gate(IC, gene_state, gate,var);
% bubblePlot(results);
dOpt_gate_PDO = results.dOpt;
% model_gate.plotFSP(plotType='marginals', indTimes = timeInd)
fprintf('The [2 0 0] to [2 0 2] leaky gate case produces a D-Optimality Criterion of %.3e\n',...
    dOpt_gate_PDO)

%% Section 4: 0 var leaky gate - same as perfect gate?
% -- GATE [0 0 0] to [2 0 0], no PDO ---
IC = 0; % Starting with 0 mRNA
gene_state = [2;0];
gate = [2 0 2];

[results, ~] = dOpt_bursting_gate_test(IC, gene_state, gate);
% bubblePlot(results);
dOpt_gate_test = results.dOpt;

fprintf('The gated [2 0 0] to [2 0 0] IC case produces a D-Optimality Criterion of %.3e\n',dOpt_gate_test)

% -- GATE [2 0 0] to [2 0 0], Leaky gate
IC = 0; % Starting with 0 mRNA
gene_state = [2;0];
gate = [2;
        0;
        2];
var = [0 0 0;
       0 0 0;
       0 0 0];

[results, ~] = dOpt_bursting_leaky_gate(IC, gene_state, gate,var);
% bubblePlot(results);
dOpt_gate_PDO = results.dOpt;
% model_gate.plotFSP(plotType='marginals', indTimes = timeInd)
fprintf('The [2 0 0] to [2 0 2] leaky gate (0 sd) case produces a D-Optimality Criterion of %.3e\n',...
    dOpt_gate_PDO)

%% Section 5: Testing the equilibrium leak case
% Yay! I got the multi-variate gaussian working for the bursting gene
% model. Let's test the expected behavior of the leaky gate by centering
% the model at equilibrium and seeing if a leaky gate increases the
% available information.

% -- GATE [1 1 0] to [1 1 10], perfect gate ---
IC = 0; % Starting with 0 mRNA
gene_state = [1;1];
gate = [1 1 6];

[results, model_gate] = dOpt_bursting_gate_test(IC, gene_state, gate);
% bubblePlot(results);
dOpt_gate_test = results.dOpt;
fprintf('The gated [1 1 0] to [1 1 6] IC case produces a D-Optimality Criterion of %.3e\n',dOpt_gate_test)

% -- GATE [1 1 0] to [1 1 10], leaky gate
IC = 0; % Starting with 0 mRNA
gene_state = [1;1];
gate = [1;
        1;
        6];
var = [inf 0 0;
       0 inf 0;
       0 0 8];

[results, ~] = dOpt_bursting_leaky_gate(IC, gene_state, gate,var);
% bubblePlot(results);
dOpt_gate_PDO = results.dOpt;
% model_gate.plotFSP(plotType='marginals', indTimes = timeInd)
fprintf('The [1 1 0] to [1 1 6] leaky gate case produces a D-Optimality Criterion of %.3e\n',...
    dOpt_gate_PDO)


% --  OBSERVATIONS --
% (See Investigation 4 Summary Plot for reference)
% The bursting gene system, as demonstrated in investigation 4, has nuanced
% IC vs. information curves which depend on the IC of the gene states, not
% just the IC of the mRNA. None of these curves has a local minimum at the
% mRNA population equilibrium of 10, unlike the simpler poisson birth-death
% model. I did not observe my expected hypothesis of the leaky gate
% increasing information available. This is understandable in the mRNA
% variance case, but when allowing for variance across gene states as well
% I do not yet have an explanation for why available information would not
% increase. The eq-gene curve (IC [1 1 X]) is the lowest of the three gene
% state curves at IC_mRNA = 6. If I conceptualize of the leaky gate as
% blending in different ICs, I would have expected this to pull us up
% towards those higher information curves.