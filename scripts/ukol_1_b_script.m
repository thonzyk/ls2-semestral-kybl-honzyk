%% 1) b) - Porovn�n� p�echodov�ch charakteristik

% zp�tn� p�eveden� p�enos� na spojit� a porovn�n�
zpetna_prenosova_fce_z_parametru = d2c(prenosova_fce_z_parametru, 'zoh');
zpetna_prenosova_fce_z_parametru_se_sumem = d2c(prenosova_fce_z_parametru_se_sumem, 'zoh');

%% Vykreslen�
figure
hold on
step(Fs)
step(zpetna_prenosova_fce_z_parametru)
step(zpetna_prenosova_fce_z_parametru_se_sumem)
hold off
title('Porovnani zpetne prevedeneho prenosu (Step response)')
legend('puvodni prenos', 'zpetne ziskany prenos z identifikace bez sumu', 'zpetne ziskany prenos z identifikace s sumem')
