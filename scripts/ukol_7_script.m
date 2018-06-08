%% Spu�t�n� cel�ho �kolu 7)


Fs_servo_discrete = c2d(Fs_proporc, 0.1, 'zoh')

Ks = (10^5 / 1.188)^(-1)



syms z c1 c0 Kr

%polynom = (z-1)*(z^2+c1*z+c0) + (Ks*Kr*(z^2 + 3.963*z + 0.9825));
%koeficienty = coeffs(polynom, z)

Matice_A = [0 1 Ks; 1 -1 3.963*Ks; -1 0 Ks*0.9825];
Vektor_b = [1 0 0]'

Vektor_x = Matice_A\Vektor_b;

c0 = Vektor_x(1)
c1 = Vektor_x(2)
Kr = Vektor_x(3)

Fr_7 = tf([1 -1.951 0.9646], [1 c1 c0], 0.1) * Kr

Fs_celkem_7 = feedback(Fr_7*Fs_servo_discrete, 1);
sim('ukol_7_model')

%% Vykreslen�
figure
step(Fs_celkem_7, 0.5)
title('Step response - detail na zacatek regulace')
figure
step(Fs_celkem_7)
title('Step response - dalsi prubeh regulace')
figure
plot(simout)
title('Prubeh rizeni')


