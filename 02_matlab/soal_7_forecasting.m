% ===============================================================
% UTS Matematika Sains Data - Semester Genap 2025/2026
% Soal 7 - Forecasting Penjualan (Deret dan Regresi)
% ---------------------------------------------------------------
% Nama    : Joannes De Britto Luther
% NIM     : 2510514024
% Parameter: N=24, a=2, b=2, K=5
% Tanggal : 2026-04-26
% ===============================================================

clc; clear; close all;

%% 1. Parameter dan Pembentukan Deret Sn
K = 5; a = 2;
n = 1:12;
Sn = 50 + K*n + (-1).^n * (a+1);

%% --- BAGIAN (c): Verifikasi T1 dan T2 ---
T1 = sum(Sn);
T2 = sum(Sn.^2);

fprintf('--- Verifikasi Soal 7c ---\n');
fprintf('Total Penjualan 12 Bulan (T1) : %.2f\n', T1);
fprintf('Sum of Squares (T2)           : %.2f\n\n', T2);

%% --- BAGIAN (e): Forecasting 6 Bulan ke Depan ---
t = 1:12;
% Menggunakan polyfit derajat 1 untuk garis tren linear
p = polyfit(t, Sn, 1); 
slope = p(1);
intercept = p(2);

% Prediksi S13 sampai S18
t_pred = 13:18;
S_pred = polyval(p, t_pred);

% Plotting
figure('Color', 'w');
plot(t, Sn, 'b-o', 'MarkerFaceColor', 'b', 'DisplayName', 'Data Historis (Biru, Titik)');
hold on;
plot(t, polyval(p, t), 'r--', 'LineWidth', 1.5, 'DisplayName', 'Garis Tren (Merah Putus)');
plot(t_pred, S_pred, 'g^', 'MarkerFaceColor', 'g', 'DisplayName', 'Prediksi 6 Bulan (Hijau, Segitiga)');

% Format Grafik
title(['Forecasting Penjualan - NIM: ', '2510514024']);
xlabel('Bulan ke-n');
ylabel('Penjualan (Juta Rupiah)');
legend('Location', 'best');
grid on;

fprintf('--- Hasil Forecasting Soal 7e ---\n');
fprintf('Koefisien Slope (Kemiringan) : %.4f\n', slope);
fprintf('Koefisien Intercept          : %.4f\n', intercept);
fprintf('Prediksi S13 sampai S18      : \n');
disp(S_pred);
