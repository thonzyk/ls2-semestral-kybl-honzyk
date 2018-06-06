%% Úkol 2) a)

Fs_proporc = Fs * tf(0.01, [1 0]);

% margin(Fs_proporc) % -> 17.1
K_krit = 10^(17.1/20);
K = K_krit;

% vykreslení
figure
sim('ukol_2_model')
plot(simout)
title('Odezva proporcionalniho regulatoru na skok pri kritickem zesileni K = 7.1614')