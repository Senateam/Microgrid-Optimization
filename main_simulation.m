%% main_simulation.m
% Microgrid Optimization: PV + Demand Side Management
% Author: Rasheed Adarijo

clc; clear; close all;

%% Load sample data
loadData = readmatrix('/Users/MAC/Downloads/systems_20250729.csv'); % Example load profile
PV_generation = 0.8 * rand(size(loadData)); % Simplified PV generation (p.u.)

%% Define microgrid parameters
battery_capacity = 100;   % kWh
SOC = 50;                 % initial state of charge (%)
efficiency = 0.95;        % battery efficiency

%% Run demand side management optimization
[optimized_load, SOC_profile] = demand_side_management(loadData, PV_generation, battery_capacity, SOC, efficiency);

%% Plot results
figure;
plot(1:length(loadData), loadData, 'r', 'LineWidth', 1.5); hold on;
plot(1:length(optimized_load), optimized_load, 'b', 'LineWidth', 1.5);
xlabel('Time (hours)');
ylabel('Load (kW)');
legend('Original Load','Optimized Load');
title('Microgrid Load Optimization with PV + DSM');
grid on;

%% Save results
if ~exist('../results/plots','dir')
    mkdir('../results/plots');
end
saveas(gcf, '../results/plots/optimized_load_plot.png');

% Save data
if ~exist('../results/outputs','dir')
    mkdir('../results/outputs');
end
writematrix(optimized_load,'../results/outputs/optimized_load.csv');
writematrix(SOC_profile,'../results/outputs/SOC_profile.csv');

disp('Simulation completed successfully!');