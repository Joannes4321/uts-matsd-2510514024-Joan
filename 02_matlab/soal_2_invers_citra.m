% ===============================================================
% UTS Matematika Sains Data - Semester Genap 2025/2026
% Soal 2 - Enkripsi Citra Logo Toko dengan Invers Matriks 3x3
% ---------------------------------------------------------------
% Nama    : Joannes De Britto Luther
% NIM     : 2510514024
% Parameter: N=24, a=2, b=2, K=5
% Tanggal : 2026-04-26
% ===============================================================

clc; clear; close all;

%% Parameter Personalisasi
N = 24; a = 2; b = 2;

%% Definisi Matriks Kunci A dan Blok Piksel P
A = [a+1, b, 2; 
     1, a+2, b; 
     b, 1, a+3];

P = [120, 50+N, 200; 
     80, a+2, 10+N; 
     30+N, 90, 170];

%% --- BAGIAN (d): Verifikasi Invers dengan Nested Loop ---

% 1. Hitung Determinan manual (Ekspansi kofaktor baris 1)
det_A = A(1,1)*(A(2,2)*A(3,3) - A(2,3)*A(3,2)) ...
      - A(1,2)*(A(2,1)*A(3,3) - A(2,3)*A(3,1)) ...
      + A(1,3)*(A(2,1)*A(3,2) - A(2,2)*A(3,1));

% 2. Hitung Matriks Kofaktor menggunakan Nested Loop
C = zeros(3,3);
for i = 1:3
    for j = 1:3
        % Mencari indeks baris dan kolom untuk minor
        rows = setdiff(1:3, i);
        cols = setdiff(1:3, j);
        
        % Hitung determinan minor 2x2
        M_ij = A(rows(1), cols(1))*A(rows(2), cols(2)) - ...
               A(rows(1), cols(2))*A(rows(2), cols(1));
           
        % Matriks Kofaktor
        C(i,j) = ((-1)^(i+j)) * M_ij;
    end
end

% 3. Hitung Adjoint dan Invers Manual
Adj_A = C'; % Transpose dari kofaktor
A_inv_manual = (1/det_A) * Adj_A;

% 4. Hitung Error Frobenius
error_frob = norm(A_inv_manual - inv(A), 'fro');

fprintf('--- Verifikasi Soal 2d ---\n');
fprintf('Determinan A: %d\n', det_A);
fprintf('Error Frobenius: %.2e\n', error_frob);
if error_frob < 1e-10
    disp('Status: Verifikasi Berhasil (Error < 1e-10)');
else
    disp('Status: Verifikasi Gagal');
end
fprintf('\n');

%% --- BAGIAN (f): Visualisasi Rekonstruksi Blok 3x3 ---

% Proses Enkripsi
E = A * P;

% Proses Dekripsi
P_prime = inv(A) * E;

% Visualisasi
figure('Name', 'Visualisasi Enkripsi Citra', 'Color', 'w');

% Subplot 1: Citra Asli (P)
subplot(1,2,1);
imshow(uint8(P), []); 
title('Blok Piksel Asli (P)');
xlabel(['NIM: ', '2510514024']);
axis on;

% Subplot 2: Citra Terenkripsi (E)
subplot(1,2,2);
imshow(uint8(E), []); 
title('Blok Piksel Terenkripsi (E)');
axis on;

% Tambahkan informasi di console untuk bagian (e)
fprintf('--- Hasil Enkripsi (E) ---\n');
disp(E);
fprintf('--- Hasil Dekripsi (P'') ---\n');
disp(round(P_prime)); % Pembulatan untuk menghilangkan floating point kecil
