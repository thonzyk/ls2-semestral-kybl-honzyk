%% �kol 2) c)

K = 0.9 * K_krit; % 90 % kritick�ho zes�len�
Fs_90_procent_K = Fs_servo * K; % p�enos s 90% kritick�m zes�len�m
Fs_90_procent_K_se_zpetnou_vazbou = feedback(Fs_90_procent_K, 1); % zp�tnovazebn� p�enos s 90% kritick�m zes�len�m

%% Vykreslen�
figure
margin(Fs_90_procent_K)
figure
step(Fs_90_procent_K_se_zpetnou_vazbou)