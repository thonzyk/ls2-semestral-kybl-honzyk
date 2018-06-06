%% Spuštìní celého úkolu 3)

%% Urèení z GMK

Fs_z_GMK = tf(2.42198, [1 1.84 2.42198]); % hodnoty pro pøesné 10% pøeregulování

epsilon_ideal = 0.591155;
omega_ideal = 1.55627;

[num, den] = tfdata(Fs_z_GMK);
syms s

koeficienty = den{1};
ideal_koreny = roots(koeficienty);

%figure
%rlocus, sgrid, rlocfind(Fs_z_GMK)

%% Urèení z Q-parametrizace

alpha_2 = 1/omega_ideal^2;
alpha_1 = 2 * omega_ideal * epsilon_ideal * alpha_2;
Ks = omega_ideal^2 * 5;

tau = alpha_2 / alpha_1
Kp = (2 * epsilon_ideal * omega_ideal * alpha_1 - (alpha_2 * omega_ideal^2))/(Ks * alpha_1^2)
Ki = omega_ideal^2/(Ks * alpha_1)
Kd = (alpha_1^2 - 2 * epsilon_ideal * omega_ideal * alpha_1 * alpha_2 + alpha_2^2 * omega_ideal^2)/(Ks * alpha_1^3)

Q = tf(1, [alpha_2, alpha_1, 1]);
Fs_3 = tf(1, [1 0.3 1]);
Fr = Q/(Fs*(1-Q));

figure
hold on
Fs_z_Q = feedback(Fs*Fr, 1);
step(Fs_z_Q)
step(Fs_z_GMK)
legend('vypocet z GMK', 'vypocet z Q-parametrizace')
hold off





