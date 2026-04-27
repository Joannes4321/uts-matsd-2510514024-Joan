% ===============================================================
% UTS Matematika Sains Data - Semester Genap 2025/2026
% Soal 3 - Analisis Himpunan Pelanggan dan Fungsi Harga
% ---------------------------------------------------------------
% Nama    : Joannes De Britto Luther
% NIM     : 2510514024
% Parameter: N=24, a=2, b=2, K=5
% Tanggal : 2026-04-26
% ===============================================================

clc; clear; close all;

%% Parameter
N = 24; a = 2; b = 2; K = 5;

%% --- BAGIAN (b): Verifikasi Operasi Himpunan ---

% Definisi Himpunan
A = [N, N+2, N+4, N+7, N+10, N+13, N+15];
B = [N+3, N+5, N+7, N+10, N+12, N+18];
C = [N+1, N+7, N+10, N+11, N+17, N+20];
U = N:(N+20); % Semesta

% 1. |A U B U C| (Kardinalitas Gabungan)
gabungan_semua = union(A, union(B, C));
n_gabungan = length(gabungan_semua);

% 2. |A n B n C| (Irisan Ketiganya)
irisan_semua = intersect(A, intersect(B, C));
n_irisan = length(irisan_semua);

% 3. |(A U B) n C'| (Gabungan A,B yang bukan anggota C)
A_union_B = union(A, B);
C_komplemen = setdiff(U, C);
hasil_c_aksen = intersect(A_union_B, C_komplemen);
n_c_aksen = length(hasil_c_aksen);

% 4. |A ^ B| (Simetris Difference)
sim_diff = setxor(A, B);
n_sim_diff = length(sim_diff);

fprintf('--- Verifikasi Soal 3b ---\n');
fprintf('Kardinalitas |A U B U C| : %d\n', n_gabungan);
fprintf('Kardinalitas |A n B n C| : %d\n', n_irisan);
fprintf('Kardinalitas |(A U B) n C''|: %d\n', n_c_aksen);
fprintf('Kardinalitas |A ^ B|     : %d\n\n', n_sim_diff);

%% --- BAGIAN (d): Invers Fungsi dan Verifikasi Pendapatan ---

syms x;
f = K*x + (a+b); % Definisi f(x) = 5x + 4

% 1. Mencari Invers f^-1(x) secara simbolik
% Caranya: selesaikan y = f(x) untuk x
syms y;
f_inv_sym = solve(y == K*x + (a+b), x);
fprintf('--- Verifikasi Soal 3d ---\n');
fprintf('Invers f^-1(y) = %s\n', char(f_inv_sym));

% 2. Menghitung volume pembelian x
% Pendapatan total: Rp (K*100 + a + b) ribu
pendapatan_target = (K*100 + a + b); % Dalam ribuan rupiah
x_solusi = solve(f == pendapatan_target, x);

fprintf('Jika pendapatan = %d ribu\n', pendapatan_target);
fprintf('Volume pembelian (x) yang dihasilkan: %.0f\n', double(x_solusi));

% Verifikasi dengan subs
cek_hasil = subs(f, x, x_solusi);
fprintf('Verifikasi (f(x_solusi)): %d (Sesuai)\n', double(cek_hasil));
