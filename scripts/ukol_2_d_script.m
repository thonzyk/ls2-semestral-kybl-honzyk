%% �kol 2) d)

Fs_integracni_clanek = tf([0.8 0.5], [50 5]); % integra�n� korek�n� �l�nek

Fs_with_konekcni_clanek = Fs_90_procent_K * Fs_integracni_clanek; % p�enos s 90% kritick�m zes�len�m a integra�n�m korek�n�m �l�nkem
Fs_with_konekcni_clanek_with_feedback = feedback(Fs_with_konekcni_clanek, 1); % zp�tnovazebn� p�enos s 90% kritick�m zes�len�m a integra�n�m korek�n�m �l�nkem

%% Vykreslen�
figure
margin(Fs_with_konekcni_clanek)
figure 
step(Fs_with_konekcni_clanek_with_feedback)