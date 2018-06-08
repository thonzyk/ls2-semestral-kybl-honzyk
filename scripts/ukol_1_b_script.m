%% 1) b) - Porovnání pøechodových charakteristik

% zpìtné pøevedení pøenosù na spojité a porovnání
zpetna_prenosova_fce_z_parametru = d2c(prenosova_fce_z_parametru, 'zoh');
zpetna_prenosova_fce_z_parametru_se_sumem = d2c(prenosova_fce_z_parametru_se_sumem, 'zoh');

%% Vykreslení
figure
hold on
step(Fs)
step(zpetna_prenosova_fce_z_parametru)
step(zpetna_prenosova_fce_z_parametru_se_sumem)
hold off
title('Porovnani zpetne prevedeneho prenosu (Step response)')
legend('puvodni prenos', 'zpetne ziskany prenos z identifikace bez sumu', 'zpetne ziskany prenos z identifikace s sumem')
