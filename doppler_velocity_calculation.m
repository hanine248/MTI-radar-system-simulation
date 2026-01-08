%% ===========================
%  Pulse-Doppler FFT Analysis
%  Using bins k = 40 and 88
% ============================

clear; clc; close all;

%% Parameters (same as your Simulink model)
N = 128;           % FFT length
PRF = 50000;        % Pulse repetition frequency (Hz)
lambda = 0.03;     % Wavelength (example: 10 GHz radar → λ = 3 cm)
            % pulse repetition frequency

% Frequency-bin resolution
df = PRF / N;

% Indices of Doppler peaks (from your Simulink result)
k1 = 43;     
k2 = 91;     % = 128 - 42 (negative Doppler)

%% Convert FFT indices to Doppler frequencies
fd1 = (k1) * df;                 % positive Doppler frequency
fd2 = (k2 - N) * df;             % negative Doppler frequency

%% Convert Doppler to radial velocity
v1 = (lambda * fd1) / 2;
v2 = (lambda * fd2) / 2;

%% Make a synthetic Doppler spectrum for demonstration
% Just to show your teacher what real Doppler looks like
f = (-N/2 : N/2-1) * df;
S = zeros(1, N);
S(k1+1) = 1;                  % positive Doppler
S(k2+1) = 1;                  % negative Doppler
S = fftshift(S);

%% Plot the Doppler Spectrum
figure;
stem(f, S, 'LineWidth', 2);
grid on; hold on;

xlabel('Doppler Frequency (Hz)');
ylabel('Magnitude');
title('Doppler Spectrum with Peaks at k=40 and k=88');

% Annotate peaks
text(fd1, 1.1, sprintf('k=40 → f_d = %.1f Hz', fd1), 'FontSize', 12);
text(fd2, 1.1, sprintf('k=88 → f_d = %.1f Hz', fd2), 'FontSize', 12);

%% Display results
fprintf('\n=========== Doppler Results ===========\n');
fprintf('FFT Bin k1 = 40 →  f_d1 = %.2f Hz → v = %.2f m/s\n', fd1, v1);
fprintf('FFT Bin k2 = 88 →  f_d2 = %.2f Hz → v = %.2f m/s\n', fd2, v2);
fprintf('========================================\n\n');
