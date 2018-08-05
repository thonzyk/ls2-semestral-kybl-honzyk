%% INICIALIZACE PROM�NN�CH

K = 5; % Zes�len�
epsilon = 0.15; % Epsilon
omega = 1.2; % Omega
T = 0.2; % Perioda vzorkov�n�
Fs = tf(K*omega*omega, [1 2*epsilon*omega omega*omega]); % Z�kladn� p�enosov� funkce

%% P�EVOD NA DISKR�TN� P�ENOS

discrete_Fs = c2d(Fs,T,'zoh'); % Z�kladn� p�enosov� funkce v diskr�tn�m tvaru

%% UR�EN� PARAMETR� GRAY-BOX MODELU #1) #a)

sim('ukol_1_a_se_sumem')
y = simout.Data(:, 1); % v�stup
u = simout.Data(:, 2); % vstup
chyboveY = simout.Data(:,3); % v�stup zat�en� �umem
regresory = [-y(2:end-1),-y(1:end-2),u(2:end-1),u(1:end-2)]; % matice regresor�
ChyboveRegresory = [-chyboveY(2:end-1),-chyboveY(1:end-2),u(2:end-1),u(1:end-2)];% matice regresor� pro vstup zat�en� �umem
parametry = pinv(regresory)*y(3:end); % vypo�ten� parametry p�enosu
parametrySum = pinv(ChyboveRegresory)*chyboveY(3:end); % vypo�ten� parametry p�enosu pro vstup zat�en� �umem

prenosova_fce_z_parametru = tf([parametry(3) parametry(4)],[1 parametry(1) parametry(2)], T); % p�enos vypo�ten�ch parametr�
prenosova_fce_z_parametru_se_sumem = tf([parametrySum(3) parametrySum(4)],[1 parametrySum(1) parametrySum(2)], T); % p�enos vypo�ten�ch parametr�




