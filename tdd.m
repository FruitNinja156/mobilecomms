clear; close all; clc;

figure('Position', [100, 100, 800, 400]);
hold on; 
pattern = 'DDDSU';
colors = [0.2 0.6 0.9; 0.2 0.6 0.9; 0.2 0.6 0.9; 0.5 0.9 0.5; 0.9 0.4 0.2]; % D,D,D,S,U
for s = 1:5
    rectangle('Position', [s-0.4, 0.5, 0.8, 0.8], 'FaceColor', colors(s,:), 'Curvature', 0.2);
    text(s, 0.9, pattern(s), 'FontSize', 14, 'FontWeight', 'bold', 'HorizontalAlignment', 'center');
end
title('Figure 2: Synchronized TDD Frame Structure (DDDSU)');
set(gca, 'YTick', [], 'XTick', 1:5, 'XTickLabel', {'1ms','2ms','3ms','4ms','5ms'});
xlim([0.5 5.5]); ylim([0 2]);
