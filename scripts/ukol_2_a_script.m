%% �kol 2) a)

Fs_servo = Fs * tf(0.01, [1 0]); % P�enos servosyst�mu - p�id�n� integra�n�ho �lenu

% margin(Fs_proporc) % -> 17.1
K_krit = 10^(17.1/20); % kritick� zes�len� z�skan� pomoc� margin()
K = K_krit;

%% Vykreslen�
figure
sim('ukol_2_model')
plot(simout)
title('Odezva proporcionalniho regulatoru na skok pri kritickem zesileni K = 7.1614')