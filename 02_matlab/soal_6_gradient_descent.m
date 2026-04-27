% ===============================================================
% UTS Matematika Sains Data - Semester Genap 2025/2026
% Soal 6 - Optimasi Harga Produk Via Gradient Descent
% ---------------------------------------------------------------
% Nama    : Joannes De Britto Luther
% NIM     : 2510514024
% Parameter: a=2, b=2, K=5, alpha=0.003
% Tanggal : 2026-04-26
% ===============================================================

clc; clear; close all;

%% 1. Parameter Deskriptif
a = 2; b = 2; K = 5; alpha = 0.003;
x0 = 1; % Titik awal
iterasi = 500;

%% 2. Definisi Fungsi (Anonymous Functions)
pi_x = @(x) -3*x.^3 + 35*x.^2 + 100*x - 250;
d_pi_x = @(x) -9*x.^2 + 70*x + 100;

%% 3. Algoritma Gradient Descent
x_history = zeros(iterasi + 1, 1);
pi_history = zeros(iterasi + 1, 1);

x_history(1) = x0;
pi_history(1) = pi_x(x0);

for k = 1:iterasi
    % Update Rule: x_{k+1} = x_k + alpha * pi'(x_k)
    x_history(k+1) = x_history(k) + alpha * d_pi_x(x_history(k));
    pi_history(k+1) = pi_x(x_history(k+1));
end

x_final = x_history(end);

%% 4. Solusi Analitik (Menggunakan Rumus Kuadratik pi'(x)=0)
% -9x^2 + 70x + 100 = 0
A_quad = -9; B_quad = 70; C_quad = 100;
D = sqrt(B_quad^2 - 4*A_quad*C_quad);
x_analitik_1 = (-B_quad + D) / (2*A_quad);
x_analitik_2 = (-B_quad - D) / (2*A_quad);
% Pilih x yang positif dan merupakan maksimum lokal (uji turunan kedua)
x_optimum = max(x_analitik_1, x_analitik_2); 

%% 5. Plotting
figure('Color', 'w', 'Position', [100, 100, 1000, 400]);

% Subplot 1: Kurva Konvergensi pi(x) vs Iterasi
subplot(1,2,1);
plot(0:iterasi, pi_history, 'LineWidth', 2, 'Color', [0 .5 0]);
grid on;
xlabel('Iterasi (k)'); ylabel('\pi(x)');
title('Kurva Konvergensi Profit');

% Subplot 2: Posisi pada Kurva Profit pi(x)
subplot(1,2,2);
fplot(pi_x, [0 15], 'LineWidth', 1.5); hold on;
plot(x0, pi_x(x0), 'ro', 'MarkerSize', 8, 'DisplayName', 'Titik Awal (x_0)');
plot(x_final, pi_x(x_final), 'gx', 'MarkerSize', 10, 'LineWidth', 2, 'DisplayName', 'Solusi GD');
plot(x_optimum, pi_x(x_optimum), 'ks', 'DisplayName', 'Solusi Analitik');
grid on;
xlabel('Harga (x)'); ylabel('Profit \pi(x)');
title('Perbandingan Solusi pada Kurva \pi(x)');
legend('show');

fprintf('Hasil Akhir x* (Gradient Descent): %.6f\n', x_final);
fprintf('Hasil Solusi Analitik: %.6f\n', x_optimum);
