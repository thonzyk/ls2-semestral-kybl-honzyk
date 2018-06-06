%% Úkol 2) c)

K = 0.9 * K_krit;
Fs_90_procent_K = Fs_proporc * K;
Fs_90_procent_K_se_zpetnou_vazbou = feedback(Fs_90_procent_K, 1);

% vykreslení
figure
margin(Fs_90_procent_K)
figure
step(Fs_90_procent_K_se_zpetnou_vazbou)