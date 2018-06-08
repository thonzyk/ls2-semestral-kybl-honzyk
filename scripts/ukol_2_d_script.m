%% Úkol 2) d)

Fs_integracni_clanek = tf([0.8 0.5], [50 5]); % integraèní korekèní èlánek

Fs_with_konekcni_clanek = Fs_90_procent_K * Fs_integracni_clanek; % pøenos s 90% kritickým zesílením a integraèním korekèním èlánkem
Fs_with_konekcni_clanek_with_feedback = feedback(Fs_with_konekcni_clanek, 1); % zpìtnovazební pøenos s 90% kritickým zesílením a integraèním korekèním èlánkem

%% Vykreslení
figure
margin(Fs_with_konekcni_clanek)
figure 
step(Fs_with_konekcni_clanek_with_feedback)