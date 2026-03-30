%% Content
% This investigation explores which SINGLE Initial Condition provides the 
% most information for the Bursting-Gene system. The system is understood
% to have offGene fixed at 2 and onGene fixed at 0 at time 0; while the IC
% input varies initial mRNA in the system. Key parameters of the 
% system include:
%
% kon   =   0.2
% koff  =   0.2
% kr    =   10
% dr    =   1
%
% This system equilbriates to a population of 10 with a half life of 2.8s

%% Preliminaries:
clear
close all
clc
addpath(genpath('../Rotation/SSIT'));

%% Section 1: IC = 10 is the best case for sub-equilibrium IC, offGene start
% This model demonstrates a sigmoidal lag phase which will see excess mRNA
% dying off while genes are still turning on, which is a byproduct of
% starting all of the genes in the off state. Does starting the genes in
% the on state remove this behavior?
IC = 0:1:10;
gene_state = [2;0];
all_dOpt_off = zeros(1,length(IC));
for i = 1:length(IC)
    results = dOpt_bursting(IC(i), gene_state);
    bubblePlot(results);
    all_dOpt_off(i) = results.dOpt;
end
save("cache/Investigation_4_Results.mat", 'all_dOpt_off', '-append');
disp("Saved results to Investigation_4_Results in the cache.")

%% Section 2: IC = 0 is the best case for sub-equilibrium IC, onGene start
% Interesting! The trend from above is reversed as opposed to seeing the
% effect be removed. The initially unbalanced "on" population produces a
% spike in mRNA growth that diminishes after the genes equilibriate... gene
% state equilibriation is going to be a very important secondary player in
% this model. Do the trends exactly mirror eachother? What about the case
% of starting at equlibriated gene state?
IC = 0:1:10;
gene_state = [0;2];
all_dOpt_on = zeros(1,length(IC));
for i = 1:length(IC)
    results = dOpt_bursting(IC(i), gene_state);
    bubblePlot(results);
    all_dOpt_on(i) = results.dOpt;
end
save("cache/Investigation_4_Results.mat", 'all_dOpt_on', '-append');
disp("Saved results to Investigation_4_Results in the cache.")

%% Section 3: IC = 0 is the best case for sub-equilibrium IC, eqGene start
% Lovely! Starting gene state at equilibrium removes the unique dynamic of
% this system and causes the lag time/spike time to not be observed.
% Intuitively, this decreases available information in the system by
% prohibiting the experimentalist from observing gen equilbriation
% dynamics... Is there a way to control initial gene state?
IC = 0:1:10;
gene_state = [1;1];
all_dOpt_eq = zeros(1,length(IC));
for i = 1:length(IC)
    results = dOpt_bursting(IC(i), gene_state);
    bubblePlot(results);
    all_dOpt_eq(i) = results.dOpt;
end
save("cache/Investigation_4_Results.mat", 'all_dOpt_eq', '-append');
disp("Saved results to Investigation_4_Results in the cache.")

%% Section 4: How does initial gene state effect available information?
% Starting all genese off and starting all genes on result in two curves
% which closesly mirror eachother across a vertical axis of symmetry at
% x=5; this makes sense if we are to imagining the lag time resulting from
% starting without active genes to be inversely analagous to the spike time
% resulting from starting exclusively with active genes. 
%
% The case of starting gene-state at equilibrium demonstrates its own
% dynamics, though available information is significantly diminished when
% compared to the unequilibriated starting points. I observe the
% information maximizing at IC=0, and decreasing as IC increases until an
% apogee at IC=6, whereupon it begins increasing again. I don't
% readily have an explanation for why information would pivot here.
%
% Now lets move on to super-eq studies

load("cache/Investigation_4_Results.mat")
disp("Loaded results from the cache.")

IC = 0:1:10;

figure()
hold on
grid on
plot(IC, all_dOpt_off, 'DisplayName', 'All Genes On at t0', 'LineWidth',2)
plot(IC, all_dOpt_on, 'DisplayName', 'All Genes Off at t0', 'LineWidth',2)
plot(IC, all_dOpt_eq, 'DisplayName', 'Gene Equilibrium at t0', 'LineWidth',2)
legend
xlabel('Initial mRNA Population')
ylabel('D-Optimality Criterion')
title('How does initial gene state affect available information?')

%% Section 5: Repeat the above exploration for super-eq IC

%% Section 5.1 Off Gene - Information increases past eq as with birth-death
IC = 10:1:40;
gene_state = [2;0];
sup_dOpt_off = zeros(1,length(IC));
for i = 1:length(IC)
    results = dOpt_bursting(IC(i), gene_state);
    % bubblePlot(results);
    sup_dOpt_off(i) = results.dOpt;
end
save("cache/Investigation_4_Results.mat", 'sup_dOpt_off', '-append');
disp("Saved results to Investigation_4_Results in the cache.")

%% Section 5.2 On Gene - Information increases non-monotonically past eq
IC = 10:1:40;
gene_state = [0;2];
sup_dOpt_on = zeros(1,length(IC));
for i = 1:length(IC)
    results = dOpt_bursting(IC(i), gene_state);
    % bubblePlot(results);
    sup_dOpt_on(i) = results.dOpt;
end
save("cache/Investigation_4_Results.mat", 'sup_dOpt_on', '-append');
disp("Saved results to Investigation_4_Results in the cache.")

%% Section 5.3 Eq Gene - Information increases monotonically past eq
IC = 10:1:40;
gene_state = [1;1];
sup_dOpt_eq = zeros(1,length(IC));
for i = 1:length(IC)
    results = dOpt_bursting(IC(i), gene_state);
    % bubblePlot(results);
    sup_dOpt_eq(i) = results.dOpt;
end
save("cache/Investigation_4_Results.mat", 'sup_dOpt_eq', '-append');
disp("Saved results to Investigation_4_Results in the cache.")

%% Section 5.4 Comparison Plot
load("cache/Investigation_4_Results.mat")
disp("Loaded results from the cache.")

IC = 10:1:40;

figure()
hold on
grid on
plot(IC, sup_dOpt_off, 'DisplayName', 'All Genes On at t0', 'LineWidth',2)
plot(IC, sup_dOpt_on, 'DisplayName', 'All Genes Off at t0', 'LineWidth',2)
plot(IC, sup_dOpt_eq, 'DisplayName', 'Gene Equilibrium at t0', 'LineWidth',2)
legend
xlabel('Initial mRNA Population')
ylabel('D-Optimality Criterion')
title('How does initial gene state effect available information?')

%% Section 5.5 Total Comparison Plot
% Combining Sub-Eq and Super-Eq plots
load("cache/Investigation_4_Results.mat")


% Defining IC range
IC = [0:1:9,10:1:40];

% Combining like lines
dOpt_off = [all_dOpt_off(1:end-1),sup_dOpt_off];
dOpt_on = [all_dOpt_on(1:end-1),sup_dOpt_on];
dOpt_eq = [all_dOpt_eq(1:end-1),sup_dOpt_eq];

% Plotting
figure()
hold on
grid on
plot(IC, dOpt_off, 'DisplayName', 'All Genes On at t0', 'LineWidth',2)
plot(IC, dOpt_on, 'DisplayName', 'All Genes Off at t0', 'LineWidth',2)
plot(IC, dOpt_eq, 'DisplayName', 'Gene Equilibrium at t0', 'LineWidth',2)
legend
xlabel('Initial mRNA Population')
ylabel('D-Optimality Criterion')
title('How does initial gene state effect available information?')
