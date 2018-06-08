%% Spu�t�n� cel�ho �kolu 4)
%% Dop�edn� vazba
A = [0 1; -1.44 -0.36];
B = [0; 1];
C = [7.2 0; 0 7.2];
D = [0; 0];
C_1 = [7.2 0];

k1 = 0.982;
k2 = 1.8188;

K = [k1 k2]';

pI_A_BK = [0, -1; k1 + 1.44, k2 + 0.36];
korekcni_zesileni =  (1/0.2845944)*(1/(C_1* inv(pI_A_BK)*B)); % vypo�ten� korek�n� zes�len�

%% S integr�torem

k1_2 = 6.645;
k2_2 = 3.083;
kI = 3.767;

%% Vykreslen� - dobredna nafejkov�no korek�n� zes�len� -> dod�lat obr�zky

sim('ukol_5_model_2')

figure
plot(simout)
title('Step (dopredna)')

figure
plot(simout2)
title('Step (s integratorem)')



