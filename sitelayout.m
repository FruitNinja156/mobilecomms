clear; close all; clc;
figure('Position',[150 150 900 700]);
hold on; grid on; axis equal; xlim([0 2]); ylim([0 2]);
% Plot 7 BS locations (km from bottom-left)
BS_pos = [1.0 1.0;  % BS1 Center
          0.3 0.3; 0.3 1.0; 0.3 1.7;  % BS2,4,6 Left (Zone A)
          1.7 0.3; 1.7 1.0; 1.7 1.7]; % BS3,5,7 Right (Zone C)
plot(BS_pos(:,1), BS_pos(:,2), 'ks', 'MarkerSize',12, 'MarkerFaceColor','k', 'LineWidth',2);
for i=1:7
    text(BS_pos(i,1)+0.05, BS_pos(i,2)+0.05, sprintf('BS%d',i),...
        'FontSize',12,'FontWeight','bold','Color','red');
end
% 600m coverage circles (approximate)
theta = 0:0.01:2*pi;
for i=1:7
    xcirc = BS_pos(i,1) + 0.6*cos(theta);
    ycirc = BS_pos(i,2) + 0.6*sin(theta);
    plot(xcirc, ycirc, 'r--', 'LineWidth',0.5, 'Color',[0.8 0.2 0.2]);
end
% Zones
fill([0 0.6 0.6 0],[0 0 2 2],[0.8 0.9 1],'FaceAlpha',0.1);
fill([0.6 1.4 1.4 0.6],[0 0 2 2],[1 0.9 0.7],'FaceAlpha',0.1);
fill([1.4 2 2 1.4],[0 0 2 2],[0.7 0.9 0.8],'FaceAlpha',0.1);
title('Figure 4: 7-Site Layout (600m Cell Radius)','FontSize',14,'FontWeight','bold');
xlabel('X (km)'); ylabel('Y (km)');
legend('Base Stations','600m Coverage','Zones','Location','northeast');
saveas(gcf,'Figure4_BS_Layout.png');
