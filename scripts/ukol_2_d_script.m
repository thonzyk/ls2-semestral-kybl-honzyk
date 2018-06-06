%% Úkol 2) d)

Fs_integracni_clanek = tf([0.8 0.5], [50 5]);

Fs_with_konekcni_clanek = Fs_90_procent_K * Fs_integracni_clanek;
Fs_with_konekcni_clanek_with_feedback = feedback(Fs_with_konekcni_clanek, 1);

% vykreslení
figure
margin(Fs_with_konekcni_clanek)
figure 
step(Fs_with_konekcni_clanek_with_feedback)