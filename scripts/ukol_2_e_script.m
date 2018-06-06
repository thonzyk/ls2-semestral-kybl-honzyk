%% Úkol 2) e)

Fs_citlivostni_s_korekci = tf(1, 1)/ (tf(1, 1) + Fs_with_konekcni_clanek);
Fs_citlivostni_bez_korekce = tf(1, 1)/ (tf(1, 1) + Fs_90_procent_K);

figure 
hold on
bode(Fs_citlivostni_s_korekci)
bode(Fs_citlivostni_bez_korekce)
legend('s korekcnim clankem', 'bez korekcniho clanku')



hold off