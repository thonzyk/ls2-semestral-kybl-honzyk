%% 1) b) - Porovnání pøechodových charakteristik

% zpìtné pøevedení pøenosù na spojité a porovnání
% TODO: Ovìøit, zda-li je to takto správnì
zpetna_prenosova_fce_z_parametru = d2c(prenosova_fce_z_parametru, 'zoh')
zpetna_prenosova_fce_z_parametru_se_sumem = d2c(prenosova_fce_z_parametru_se_sumem, 'zoh')

% plot section
figure
hold on
step(Fs)
step(zpetna_prenosova_fce_z_parametru)
step(zpetna_prenosova_fce_z_parametru_se_sumem)
hold off
title('Porovnani zpetne prevedeneho prenosu')
legend('puvodni prenos', 'zpetne ziskany prenos z identifikace bez sumu', 'zpetne ziskany prenos z identifikace s sumem')
