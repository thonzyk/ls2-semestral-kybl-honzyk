%% 1) b) - Porovn�n� p�echodov�ch charakteristik

% zp�tn� p�eveden� p�enos� na spojit� a porovn�n�
% TODO: Ov��it, zda-li je to takto spr�vn�
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
