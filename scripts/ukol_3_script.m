%% �kolu 3)

epsilon_ideal = 0.591155; % epsilon - spo�teno na pap�r pro p�esn� 10% p�eregulov�n�
omega_ideal = 1.55627; % omega - spo�teno na pap�r pro p�esn� 10% p�eregulov�n�

ideal_numerator = 2.42198;
ideal_denominator = [1 1.84 2.42198];

Fs_ideal = tf(ideal_numerator, ideal_denominator); % p�enos ur�en� z vypo�ten�ch hodnot

zeros_pozadovaneho_prenosu = roots(ideal_denominator); % rovno p�l�m ide�ln�ho c�len�ho p�enosu

nulovy_polynom = [1 1.84 2.42192704];

Fr_obecne = tf(nulovy_polynom, [1 0]); % P�enos regull�toru bez p�esn�ho zes�len�

Fs_deleno_7_2 = tf(1, [1 0.36 1.44]); % P�vodn� p�enos vyd�len� 7.2

Fo = Fs_deleno_7_2 * Fr_obecne; % sou�in p�vodn�ho p�enosu s regul�torem v otev�en� smy�ce pro ur�en� spr�vn�ho zes�len�

rlocus(Fo) % GMK

Ko = 31; % ur�eno z GMK

% v�po�et PID konstant
Kd = Ko / 7.2;
Kp = Kd * 1.84;
Ki = Kd * 2.42198;
Fr_vysledny = tf([Kd Kp Ki], [1 0]);

Celkovy_otevreny_prenos = Fs * Fr_vysledny;
Vysledny_prenos_GMK = feedback(Celkovy_otevreny_prenos, 1);

%% Ur�en� z Q-parametrizace

a1 = (2*epsilon_ideal)/omega_ideal;
a2 = 1/omega_ideal^2;

Qp = Fs^-1 * tf(1, [a2 a1 1]);

Fr = Qp / (1 - Qp * Fs);

Fs_celkovy_otevreny = Fs * Fr;

Vysledny_prenos_Qp = feedback(Fs_celkovy_otevreny, 1);

% v�po�et parametr�
Fr2 = minreal(Fr);
num = Fr2.numerator{1} * (1.84^(-1));
den = Fr2.denominator{1} * (1.84^(-1));
Fr2 = tf(num, den);
theta = Fr2.denominator{1}(1);
Ki = Fr2.numerator{1}(3);
Kp = Fr2.numerator{1}(2) - Ki*theta;
Kd = Fr2.numerator{1}(1) - Kp*theta;
Fr2 = tf([(Kp*theta+Kd) (Kp+Ki*theta) Ki], [theta 1 0]);

%% Vykreslen�

figure
step(Vysledny_prenos_GMK)
title('P�echodov� charakteristika regul�toru ur�en�ho z GMK')

figure
step(Vysledny_prenos_Qp)
title('P�echodov� charakteristika regul�toru ur�en�ho Q-parametrizac�')


figure
subplot(3,1,1)
step(Fs_ideal)
title('P�echodov� charakteristika idealizovan�ho p�enosu')
subplot(3,1,2)
step(Vysledny_prenos_GMK)
title('P�echodov� charakteristika regul�toru ur�en�ho z GMK')
subplot(3,1,3)
step(Vysledny_prenos_Qp)
title('P�echodov� charakteristika regul�toru ur�en�ho Q-parametrizac�')


