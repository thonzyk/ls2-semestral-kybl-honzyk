%% Úkol 2) c)

K = 0.9 * K_krit; % 90 % kritického zesílení
Fs_90_procent_K = Fs_servo * K; % pøenos s 90% kritickým zesílením
Fs_90_procent_K_se_zpetnou_vazbou = feedback(Fs_90_procent_K, 1); % zpìtnovazební pøenos s 90% kritickým zesílením

%% Vykreslení
figure
margin(Fs_90_procent_K)
figure
step(Fs_90_procent_K_se_zpetnou_vazbou)