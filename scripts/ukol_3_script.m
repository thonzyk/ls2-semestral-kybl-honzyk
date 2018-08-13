%% Úkolu 3)

epsilon_ideal = 0.591155; % epsilon - spoèteno na papír pro pøesné 10% pøeregulování
omega_ideal = 1.55627; % omega - spoèteno na papír pro pøesné 10% pøeregulování

ideal_numerator = 2.42198;
ideal_denominator = [1 1.84 2.42198];

Fs_ideal = tf(ideal_numerator, ideal_denominator); % pøenos urèený z vypoètených hodnot

zeros_pozadovaneho_prenosu = roots(ideal_denominator); % rovno pólùm ideálního cíleného pøenosu

nulovy_polynom = [1 1.84 2.42192704];

Fr_obecne = tf(nulovy_polynom, [1 0]); % Pøenos regullátoru bez pøesného zesílení

Fs_deleno_7_2 = tf(1, [1 0.36 1.44]); % Pùvodní pøenos vydìlený 7.2

Fo = Fs_deleno_7_2 * Fr_obecne; % souèin pùvodního pøenosu s regulátorem v otevøené smyèce pro urèení správného zesílení

rlocus(Fo) % GMK

Ko = 31; % urèeno z GMK

% výpoèet PID konstant
Kd = Ko / 7.2;
Kp = Kd * 1.84;
Ki = Kd * 2.42198;
Fr_vysledny = tf([Kd Kp Ki], [1 0]);

Celkovy_otevreny_prenos = Fs * Fr_vysledny;
Vysledny_prenos_GMK = feedback(Celkovy_otevreny_prenos, 1);

%% Urèení z Q-parametrizace

a1 = (2*epsilon_ideal)/omega_ideal;
a2 = 1/omega_ideal^2;

Qp = Fs^-1 * tf(1, [a2 a1 1]);

Fr = Qp / (1 - Qp * Fs);

Fs_celkovy_otevreny = Fs * Fr;

Vysledny_prenos_Qp = feedback(Fs_celkovy_otevreny, 1);

% výpoèet parametrù
Fr2 = minreal(Fr);
num = Fr2.numerator{1} * (1.84^(-1));
den = Fr2.denominator{1} * (1.84^(-1));
Fr2 = tf(num, den);
theta = Fr2.denominator{1}(1);
Ki = Fr2.numerator{1}(3);
Kp = Fr2.numerator{1}(2) - Ki*theta;
Kd = Fr2.numerator{1}(1) - Kp*theta;
Fr2 = tf([(Kp*theta+Kd) (Kp+Ki*theta) Ki], [theta 1 0]);

%% Vykreslení

figure
step(Vysledny_prenos_GMK)
title('Pøechodová charakteristika regulátoru urèeného z GMK')

figure
step(Vysledny_prenos_Qp)
title('Pøechodová charakteristika regulátoru urèeného Q-parametrizací')


figure
subplot(3,1,1)
step(Fs_ideal)
title('Pøechodová charakteristika idealizovaného pøenosu')
subplot(3,1,2)
step(Vysledny_prenos_GMK)
title('Pøechodová charakteristika regulátoru urèeného z GMK')
subplot(3,1,3)
step(Vysledny_prenos_Qp)
title('Pøechodová charakteristika regulátoru urèeného Q-parametrizací')


