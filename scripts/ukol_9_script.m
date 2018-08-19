%% Úkol 9)

% matice urèeny v pøedchozích cvièeních
A;
B;
C = [7.2 0; 0 7.2];
D = [0; 0];

% parametry urèeny v pøedchozích cvièeních
k1 = 0.982;
k2 = 1.8188;

%% Vykreslení

figure
sim('ukol_9_model');
plot(simout)
legend('vtup (po èástech konstantní funkce)', 'reálný stav x1', 'rekonstruovaný stav x1')
title('')

figure
sim('ukol_9_integr_model');
plot(simout)
legend('vtup (po èástech konstantní funkce)', 'reálný stav x1', 'rekonstruovaný stav x1')