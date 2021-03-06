%% Spu�t�n� cel�ho �kolu 4)
k1_2 = 0;
k2_2 = 0;
kI = 0;
%% Dop�edn� vazba
A = [0 1; -1.44 -0.36];
B = [0; 1];
C = [7.2 0; 0 7.2];
D = [0; 0];
C_1 = [7.2 0];

k1 = 0.9821;
k2 = 1.8188;

K = [k1 k2]';

korekcni_zesileni = 1;
sim('ukol_5_model')

data = simout.Data(:, 2);

chyba_zesileni = data(end);

korekcni_zesileni = 1/chyba_zesileni

%% S integr�torem

% k1_2 = 6.645;
% k2_2 = 3.083;
% kI = 3.767;

k1_2 = 3.765;
k2_2 = 2.363;
kI = 0.523;


%% Vykreslen�

sim('ukol_5_model_2')

figure
plot(simout)
title('Step (dopredna)')
legend('vstup', 'v�stup')

figure
plot(simout2)
title('Step (s integratorem)')
legend('vstup', 'v�stup')

figure
plot(simout3)
title('Porovn�n�')
legend('vstup', 'v�stup s dop�edn�m regul�torem', 'v�stup se zp�tnovazebn�m regul�torem')