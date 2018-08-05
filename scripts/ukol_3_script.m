%% �kolu 3)



epsilon_ideal = 0.591155; % epsilon - spo�teno na pap�r pro p�esn� 10% p�eregulov�n�
omega_ideal = 1.55627; % omega - spo�teno na pap�r pro p�esn� 10% p�eregulov�n�

Fs_ideal_z_GMK = tf(2.42198, [1 1.84 2.42198]); % p�enos ur�en� z vypo�ten�ch hodnot

Fs;
Kp = 0.34;
Ki = 0.35;
Kd = 0.38;
tau = 0.5;
% 
% zkou�en�
% Kp = 0.0569;
% Ki = 0.2633;
% Kd = 0.0778;
% tau = 0.5435;


% Kp =  0.0569;
% Ki = 0.2633;
% Kd = 0.0778;
% tau = 0.5435;

proporcator = tf(Kp, 1);
integrator = tf(Ki, [1 0]);
derivator = tf([Kd 0], [tau 1]);
regulator = proporcator + integrator + derivator;
T = feedback(Fs*regulator, 1);

figure
step(T)




%[num, den] = tfdata(Fs_z_GMK);
%syms s

%koeficienty = den{1};
%ideal_koreny = roots(koeficienty);

%% Ur�en� z Q-parametrizace

beta_0 = 7.2; % z 1 na 7.2
alpha_2 = beta_0/omega_ideal^2;
alpha_1 = 2 * omega_ideal * epsilon_ideal * alpha_2;
Ks = omega_ideal^2 * 5;

tau = alpha_2 / alpha_1
Kp = (2 * epsilon_ideal * omega_ideal * alpha_1 - (alpha_2 * omega_ideal^2))/(Ks * alpha_1^2)
Ki = (omega_ideal^2)/(Ks * alpha_1)
Kd = (alpha_1^2 - 2 * epsilon_ideal * omega_ideal * alpha_1 * alpha_2 + alpha_2^2 * omega_ideal^2)/(Ks * alpha_1^3)

regulator = Kp + Ki/tf([1 0], 1) + Kd*tf([1 0], [tau 1]);

Q = tf(1, [alpha_2, alpha_1, 1]);
%Fs_3 = tf(1, [1 0.3 1]);
Fr = Q/(Fs*(1-Q))
Fs_ideal_z_Q = feedback(Fs*Fr, 1);

T = feedback(Fs*regulator, 1);

figure
step(T)


%% Vykreslen�

figure
hold on
step(Fs_ideal_z_Q)
step(Fs_ideal_z_GMK)
legend('vypocet z GMK', 'vypocet z Q-parametrizace')
hold off
