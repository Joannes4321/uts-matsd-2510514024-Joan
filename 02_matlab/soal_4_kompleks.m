% ===============================================================
% UTS Matematika Sains Data - Semester Genap 2025/2026
% Soal 4 - Perbaikan Visualisasi Akar Kubik
% ---------------------------------------------------------------
% Nama    : Joannes De Britto Luther
% NIM     : 2510514024
% Parameter: theta0 = 70
% Tanggal : 2026-04-26
% ===============================================================

clc; clear; close all;

%% Parameter
theta0 = 70; 
r_w = 8;
r_root = r_w^(1/3); % Hasilnya 2

%% Hitung Akar Kubik
k = 0:2;
theta_rad = deg2rad(theta0);
phi_k = (theta_rad + 2*pi*k) / 3; 
akar_akar = r_root * (cos(phi_k) + 1i*sin(phi_k));

%% Visualisasi (Solusi Anti-Error)
figure('Color', 'w');

% Menggunakan polarplot untuk titik akar dan garis segitiga
% Kita tambahkan data pertama di akhir agar garisnya menyambung (loop)
phi_plot = [phi_k, phi_k(1)];
r_plot = [repmat(r_root, 1, 3), r_root];

polarplot(phi_plot, r_plot, '-ro', 'LineWidth', 2, 'MarkerFaceColor', 'r');
hold on;

% Menggambar vektor dari pusat (0,0) ke setiap akar secara manual
% Ini menggantikan fungsi 'compass' yang sering menyebabkan error PolarAxes
for m = 1:3
    polarplot([0 phi_k(m)], [0 r_root], 'r', 'LineWidth', 1.5);
end

title(['Plot Akar Kubik w (r=2) - NIM: ', '2510514024']);
ax = gca;
ax.ThetaZeroLocation = 'right'; % Memastikan 0 derajat di sebelah kanan
grid on;

%% Tampilkan Hasil di Command Window
fprintf('--- Hasil Akar-Akar Kubik (Soal 4d) ---\n');
for m = 1:3
    fprintf('Akar ke-%d: %.4f + %.4fi\n', m, real(akar_akar(m)), imag(akar_akar(m)));
end
