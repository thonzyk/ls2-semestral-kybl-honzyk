%% INICIALIZACE PROMÌNNÝCH

K = 5; % Zesílení
epsilon = 0.15; % TODO: doplnit
omega = 1.2; % TODO: doplnit
T = 0.2; % Perioda vzorkování
Fs = tf(K*omega*omega, [1 2*epsilon*omega omega*omega]) % Základní pøenosová funkce

%% PØEVOD NA DISKRÉTNÍ PØENOS

discrete_Fs = c2d(Fs,T,'zoh');

%% URÈENÍ PARAMETRÙ GRAY-BOX MODELU #1) #a)

sim('ukol_1_a_se_sumem')
y = simout.Data(:, 1);
u = simout.Data(:, 2);
chyboveY = simout.Data(:,3);
regresory = [-y(2:end-1),-y(1:end-2),u(2:end-1),u(1:end-2)];
ChyboveRegresory = [-chyboveY(2:end-1),-chyboveY(1:end-2),u(2:end-1),u(1:end-2)];
parametry = pinv(regresory)*y(3:end);
parametrySum = pinv(ChyboveRegresory)*y(3:end);

% dosazení parametrù do pøenosu
prenosova_fce_z_parametru = tf([parametry(3) parametry(4)],[1 parametry(1) parametry(2)], T);
prenosova_fce_z_parametru_se_sumem = tf([parametrySum(3) parametrySum(4)],[1 parametrySum(1) parametrySum(2)], T);


