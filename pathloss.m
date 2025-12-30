% Distance in meters
d = 1:1:600;          % 1 m to 600 m

% Path loss model parameters
PL = 32.4 ...
     + 20*log10(3.5) ...
     + 31.9*log10(d);

% Apply maximum path loss constraint (<= 132 dB)
PL(PL > 132) = 132;

% Plot
figure;
plot(d, PL, 'LineWidth', 2);
grid on;
xlabel('Distance d (m)');
ylabel('Path Loss PL(d) [dB]');
title('Path Loss vs Distance (3.5 GHz, Max PL = 132 dB)');
