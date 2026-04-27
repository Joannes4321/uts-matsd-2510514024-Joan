% ===============================================================
% UTS Matematika Sains Data - Semester Genap 2025/2026
% Soal 4 - Analisis Fasor Kompleks dan Akar Kubik
% ---------------------------------------------------------------
% Nama    : Joannes De Britto Luther
% NIM     : 2510514024
% Parameter: a=2, b=2, theta0=70
% Tanggal : 2026-04-26
% ===============================================================

clc; clear; close all;

%% Parameter
a = 2; b = 2; theta0 = 70; % dalam derajat

%% --- BAGIAN (b): Verifikasi Operasi Kompleks ---

z1 = (a+2) + (b+1)*1i; % 4 + 3i
z2 = (b+1) - (a+2)*1i; % 3 - 4i

% Operasi Kompleks
penjumlahan = z1 + z2;
perkalian   = z1 * z2;
pembagian   = z1 / z2;
selisih_abs = abs(z1 - z2);

fprintf('--- Verifikasi Soal 4b ---\n');
fprintf('z1 + z2       : %s\n', char(penjumlahan));
fprintf('z1 * z2       : %s\n', char(perkalian));
fprintf('z1 / z2       : %s\n', char(pembagian));
fprintf('|z1 - z2|     : %.4f\n\n', selisih_abs);

%% --- BAGIAN (e): Plot Akar Kubik di Bidang Argand ---

% 1. Mencari 3 akar kubik dari w = 8 * cis(70 deg)
% Rumus: wk = r^(1/3) * cis((theta + 360*k)/3) untuk k=0,1,2
r_w = 8;
theta_rad = deg2rad(theta0);
r_root = r_w^(1/3); % Hasilnya adalah 2

k = 0:2;
phi_k = (theta_rad + 2*pi*k) / 3; % Sudut akar-akar dalam radian
akar_akar = r_root * (cos(phi_k) + 1i*sin(phi_k));

% 2. Visualisasi Bidang Argand
figure('Color', 'w');
polarplot(phi_k, repmat(r_root, 1, 3), 'ro', 'MarkerSize', 10, 'LineWidth', 2);
hold on;

% Menggunakan compass untuk menunjukkan vektor fasor
compass(akar_akar, 'r'); 

% Menambahkan garis antar akar untuk membuktikan segitiga sama sisi
phi_loop = [phi_k, phi_k(1)]; % Menutup poligon
akar_loop = [akar_akar, akar_akar(1)];
plot(akar_loop, 'b--', 'LineWidth', 1.5);

title(['Plot Akar Kubik w - NIM: ', '2510514024']);
grid on;

% Menampilkan nilai akar di Command Window
for m = 1:3
    fprintf('Akar ke-%d: %.4f + %.4fi\n', m, real(akar_akar(m)), imag(akar_akar(m)));
end
