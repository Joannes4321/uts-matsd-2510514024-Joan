% ===============================================================
% UTS Matematika Sains Data - Semester Genap 2025/2026
% Soal 5 - Konvergensi CLV dan Kekontinyuan Biaya
% ---------------------------------------------------------------
% Nama    : Joannes De Britto Luther
% NIM     : 2510514024
% Parameter: N=24, a=2, b=2, K=5
% Tanggal : 2026-04-26
% ===============================================================

clc; clear; close all;

%% Parameter
N = 24; a = 2; b = 2; K = 5;

%% --- BAGIAN (b): Verifikasi Limit L1, L2, L3 ---
syms x;

% L1 = lim (x -> K) [ (x^2 - K^2) / (x - K) ]
f1 = (x^2 - K^2) / (x - K);
L1_val = limit(f1, x, K);

% L2 = lim (x -> 0) [ (sqrt(x + (K+1)^2) - (K+1)) / x ]
f2 = (sqrt(x + (K+1)^2) - (K+1)) / x;
L2_val = limit(f2, x, 0);

% L3 = lim (x -> inf) [ ((a+2)x^3 + b*x + 7) / (x^3 - x + K) ]
f3 = ((a+2)*x^3 + b*x + 7) / (x^3 - x + K);
L3_val = limit(f3, x, inf);

fprintf('--- Verifikasi Soal 5b (Limit) ---\n');
fprintf('Hasil L1: %s\n', char(L1_val));
fprintf('Hasil L2: %s\n', char(L2_val));
fprintf('Hasil L3: %s\n\n', char(L3_val));

%% --- BAGIAN (g): Plot Fungsi C(x) Kontinyu ---

% Menentukan nilai p dan q agar kontinyu di x = K (Hasil dari 5f manual)
% Syarat kontinyu: Lim kiri = f(K) = Lim kanan
% Lim kiri (x->5) dari (x+5) adalah 10. Maka p = 10.
% Lim kanan (x->5) dari (2x + q) adalah 10 + q. Maka 10 + q = 10 -> q = 0.
p = double(L1_val); 
q = p - a*K; % q = 10 - 2*5 = 0

% Definisi fungsi piecewise untuk plotting
C1 = @(x) (x.^2 - K^2) ./ (x - K);
C2 = @(x) a.*x + q;

figure('Color', 'w');
hold on;

% Plot potongan pertama (x < K)
fplot(C1, [0 K], 'b', 'LineWidth', 2);

% Plot potongan kedua (x > K)
fplot(C2, [K 2*K], 'r', 'LineWidth', 2);

% Plot titik sambungan (x = K)
plot(K, p, 'ko', 'MarkerFaceColor', 'g', 'MarkerSize', 8);

% Garis vertikal tipis di x = K
line([K K], [0 p+5], 'Color', [0.5 0.5 0.5], 'LineStyle', '--');

% Format Grafik
xlabel('Volume Produk (x)');
ylabel('Biaya Distribusi C(x)');
title(['Grafik Fungsi Biaya Kontinyu - NIM: ', '2510514024']);
legend('C(x) untuk x < K', 'C(x) untuk x > K', 'Titik Kontinyu (K, p)');
grid on;

fprintf('--- Verifikasi Soal 5g (Kekontinyuan) ---\n');
fprintf('Nilai p agar kontinyu: %d\n', p);
fprintf('Nilai q agar kontinyu: %d\n', q);
