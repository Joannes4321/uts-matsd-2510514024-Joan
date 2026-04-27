% ===============================================================
% UTS Matematika Sains Data - Semester Genap 2025/2026
% Soal 1 - Eksplorasi Awal dan Profil Data Transaksi
% ---------------------------------------------------------------
% Nama    : Joannes De Britto Luther
% NIM     : 2510514024
% Parameter: N=7, a=2, b=2, K=5, theta0=70, alpha=0.003
% Tanggal : 2026-04-26
% ===============================================================

clc; clear; close all;

% Parameter personalisasi (N disesuaikan menjadi 7 sesuai kertas)
N = 7; 
a = 2; 
b = 2; 
K = 5;
theta0 = 70;    % derajat
alpha_lr = 0.003;

%% 1. Pembentukan Data Toko (D_i)
i = 1:N;
% Rumus: D_i = 20 + (K*i) + mod(a*i, 7) - mod(b*i, 5)
D = 20 + (K .* i) + mod(a .* i, 7) - mod(b .* i, 5);

% Menampilkan data untuk verifikasi manual
fprintf('Indeks (i) | Hasil D_i\n');
fprintf('-----------|----------\n');
for j = 1:N
    fprintf('    %2d     |    %2d\n', j, D(j));
end
fprintf('\n');

%% 2. Verifikasi Statistik (Soal 1b)
rata_rata = mean(D);
median_data = median(D);
modus_data = mode(D); % Akan menghasilkan nilai terkecil jika semua frekuensi sama
rentang = range(D);
simpangan_baku = std(D, 1); % '1' untuk Standar Deviasi Populasi (sesuai kertas)

fprintf('--- HASIL VERIFIKASI STATISTIK (Soal 1b) ---\n');
fprintf('Mean           : %.4f\n', rata_rata);
fprintf('Median         : %.4f\n', median_data);
if length(unique(D)) == length(D)
    fprintf('Modus          : Tidak ada (semua nilai unik)\n');
else
    fprintf('Modus          : %.4f\n', modus_data);
end
fprintf('Range          : %.4f\n', rentang);
fprintf('Standar Deviasi: %.4f\n\n', simpangan_baku);

%% 3. Visualisasi (Soal 1c)
figure('Color', 'w');
bar(i, D, 'FaceColor', [0.2 0.6 0.8], 'EdgeColor', 'k');
hold on;

% Garis rata-rata horizontal
yline(rata_rata, 'r', 'LineWidth', 2, 'Label', ['Rata-rata: ', num2str(rata_rata, '%.2f')]);

% Format label Bahasa Indonesia & NIM
xlabel('Nomor Toko');
ylabel('Penjualan (Juta Rupiah)');
title(['Diagram Batang Penjualan - NIM: ', '2510514024']);
grid on;
set(gca, 'XTick', 1:7);

% Simpan file
saveas(gcf, 'Grafik_Penjualan_Toko_2510514024.png');

fprintf('Proses selesai. Grafik disimpan sebagai file PNG.\n');

%% .. kode selesai ..
