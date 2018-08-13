epsilon_ideal = 0.591155; % epsilon - spoèteno na papír pro pøesné 10% pøeregulování
omega_ideal = 1.55627; % omega - spoèteno na papír pro pøesné 10% pøeregulování

a1 = (2*epsilon_ideal)/omega_ideal;
a2 = 1/omega_ideal^2;

Qp = Fs^-1 * tf(1, [a2 a1 1]);

Fr = Qp / (1 - Qp * Fs);

Fr = minreal(Fr);

Fr2 = minreal(Fr);

num = Fr2.numerator{1} * (1.84^(-1));
den = Fr2.denominator{1} * (1.84^(-1));
 
Fr2 = tf(num, den)

theta = Fr2.denominator{1}(1);
Ki = Fr2.numerator{1}(3);
Kp = Fr2.numerator{1}(2) - Ki*theta;
Kd = Fr2.numerator{1}(1) - Kp*theta;

Fr2 = tf([(Kp*theta+Kd) (Kp+Ki*theta) Ki], [theta 1 0])


Fs_celkovy_otevreny = Fs * Fr2;

Vysledny_prenos_Qp = feedback(Fs_celkovy_otevreny, 1);

step(Vysledny_prenos_Qp)