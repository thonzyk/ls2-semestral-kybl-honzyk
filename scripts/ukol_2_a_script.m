%% Úkol 2) a)

Fs_servo = Fs * tf(0.01, [1 0]); % Pøenos servosystému - pøidání integraèního èlenu

% margin(Fs_proporc) % -> 17.1
K_krit = 10^(17.1/20); % kritické zesílení získané pomocí margin()
K = K_krit;

%% Vykreslení
figure
sim('ukol_2_model')
plot(simout)
title('Odezva proporcionalniho regulatoru na skok pri kritickem zesileni K = 7.1614')