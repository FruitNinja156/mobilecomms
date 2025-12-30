clear; close all; clc;
figure('Position',[200 200 800 600]);
[x,y] = meshgrid(0:0.02:2, 0:0.02:2);
% Simplified SINR model: higher near BS, drops with distance
SINR_dB = zeros(size(x));
for i=1:7
    dist = sqrt((x-BS_pos(i,1)).^2 + (y-BS_pos(i,2)).^2);
    SINR_dB = max(SINR_dB, 25 - 15*log10(max(dist,0.01)) - 5*min(dist,0.3)/0.3);
end
SINR_dB(SINR_dB<0) = 0; SINR_dB(SINR_dB>25) = 25;
imagesc([0 2],[0 2],SINR_dB); axis xy; colorbar;
hold on; plot(BS_pos(:,1), BS_pos(:,2), 'ws', 'MarkerSize',10, 'MarkerFaceColor','w');
colormap(jet); caxis([0 25]);
title('Figure 5: SINR Distribution Heatmap (dB)','FontSize',14,'FontWeight','bold');
xlabel('X (km)'); ylabel('Y (km)');
text(0.1,1.9,sprintf('Max SINR: %.1f dB',max(SINR_dB(:))),'FontSize',12);
