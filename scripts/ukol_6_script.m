%% Spuštìní celého úkolu 6)

Fz_sin = tf([0.199/5 0], [1 -1.96 1], 0.2);
discrete_Fs;

syms d3 d2 d1 d0 z c0

a_z = z^2 - 1.875 * z + 0.9305;
b_z = 0.1399 * z + 0.1366;
d_z = d3 * z^3 + d2 * z^2 + d1 * z + d0;
c_z = (z^2 - 1.96 * z + 1) * (z - c0);

polynom =  a_z * c_z + b_z * d_z;
koeficienty = coeffs(polynom, z)

Matice_A = [0.1366 0 0 0 0; 0.1399 0.1366 0 0 3.69878; 0 0.1399 0.1366 0 -5.6055; 0 0 0.1399 0.1366 3.835; 0 0 0 0.1399 -1];
Vektor_b = [-0.9305 -0.9305 3.69878 -5.6055 3.835]';
Vektor_x = Matice_A\Vektor_b;

d0 = Vektor_x(1);
d1 = Vektor_x(2);
d2 = Vektor_x(3);
d3 = Vektor_x(4);
c0 = Vektor_x(5);

Fr_6 = tf([d3 d2 d1 d0], [1 -c0-1.96 1+1.96*c0 -c0], 0.2);

%% Vykreslení

figure
sim('ukol_6_model')
plot(simout)
title('Chovani rekulacni smycky')
legend('referencni signal', 'odezva regulacni smycky')
