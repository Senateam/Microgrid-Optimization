% =========================================================
% Load Curve Plots - Enhancing Microgrid Efficiency Paper
% Figures 3, 4, and 5
% =========================================================

% Time axis (hours of the day)
time = [6, 8, 9, 11, 13, 17, 18, 20, 22, 23];

% -------------------------------------------------------
% Fig. 3 - Typical 24-Hour Load Curve
% -------------------------------------------------------
% Weekday load profile (W) - single representative day
weekday_load = [500, 3500, 2800, 1200, 800, 900, 1500, 2500, 1800, 500];

figure(1);
plot(time, weekday_load, 'r-', 'LineWidth', 1.5);
xlabel('Time (Hours)');
ylabel('Power Consumption (W)');
title('Typical 24 Hour Load Curve of the System');
xlim([6, 23]);
ylim([0, 4000]);
xticks([6, 9, 11, 13, 17, 20, 23]);
xticklabels({'6am', '9am', '11am', '1pm', '5pm', '8pm', '11pm'});
grid off;
set(gca, 'FontSize', 10);
set(gcf, 'Color', 'w');


% -------------------------------------------------------
% Fig. 4 - Typical Weekend Power Consumption Curve
% -------------------------------------------------------
% Weekend load profile tends to be more spread and moderate
weekend_load = [600, 2800, 2200, 1800, 1500, 1600, 2000, 2200, 1500, 400];

figure(2);
plot(time, weekend_load, 'r-', 'LineWidth', 1.5);
xlabel('Time (Hours)');
ylabel('Power Consumption (W)');
title('Typical Weekend Power Consumption Curve');
xlim([6, 23]);
ylim([0, 4000]);
xticks([6, 9, 11, 13, 17, 20, 23]);
xticklabels({'6am', '9am', '11am', '1pm', '5pm', '8pm', '11pm'});
grid off;
set(gca, 'FontSize', 10);
set(gcf, 'Color', 'w');


% -------------------------------------------------------
% Fig. 5 - Weekday vs Weekend Power Consumption Curve
% -------------------------------------------------------
figure(3);
plot(time, weekday_load, 'b-', 'LineWidth', 1.5); hold on;
plot(time, weekend_load, 'r-', 'LineWidth', 1.5);
xlabel('Time (Hours)');
ylabel('Power Consumption (W)');
title('Weekday vs. Weekend Power Consumption Curve');
legend('Weekday', 'Weekend', 'Location', 'northeast');
xlim([6, 23]);
ylim([0, 4000]);
xticks([6, 9, 11, 13, 17, 20, 23]);
xticklabels({'6am', '9am', '11am', '1pm', '5pm', '8pm', '11pm'});
grid off;
set(gca, 'FontSize', 10);
set(gcf, 'Color', 'w');
hold off;