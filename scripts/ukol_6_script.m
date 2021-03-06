%% �kol 6)
format longE

Fz_sin = tf([sin(T) 0], [1 2*cos(T) 1], 0.2); % diskr�tn� p�enos sin(x)
discrete_Fs; % diskr�tn� p�enos ur�en� v �kolu 1)

syms d3 d2 d1 d0 z c0

% polynomy pot�ebn� pro dal�� v�po�et
a_z = z^2 - 1.875 * z + 0.9305;
b_z = 0.1399 * z + 0.1366;
d_z = d3 * z^3 + d2 * z^2 + d1 * z + d0;
c_z = (z^2 - 2*cos(T) * z + 1) * (z - c0);

polynom =  a_z * c_z + b_z * d_z;
koeficienty = coeffs(polynom, z);

% ru�n� p�epsan� soustava rovnic do maticov�ho tvaru
Matice_A = [0.1366 0 0 0 -0.9305;
            0.1399 0.1366 0 0 3.69878;
            0 0.1399 0.1366 0 -5.6055;
            0 0 0.1399 0.1366 3.835;
            0 0 0 0.1399 -1];
Vektor_b = [0 -0.9305 3.69878 -5.6055 3.835]';
Vektor_x = Matice_A\Vektor_b;

% v�sledn� parametry
d0 = Vektor_x(1);
d1 = Vektor_x(2);
d2 = Vektor_x(3);
d3 = Vektor_x(4);
c0 = Vektor_x(5);

Fr_6 = tf([d3 d2 d1 d0], [1 -c0-1.96 1+1.96*c0 -c0], 0.2); % v�sledn� p�enos regul�toru

%% Vykreslen�

figure
sim('ukol_6_model')
plot(simout)
title('Chov�n� regula�n� smy�ky')
legend('referen�n� sign�l', 'odezva regula�n� smy�ky')
