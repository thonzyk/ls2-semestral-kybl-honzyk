%% 1) c) - Diskretizované modely

% Urèení pracovního pøenosu
Fs_pracovni = zpetna_prenosova_fce_z_parametru;

% Tvarovaè 0. rádu
Fs_nulty_rad = c2d(Fs_pracovni,T,'zoh');

% Dopøedná obdélníková aproximace - spoèteno v ruce substitucí 
% s -> (z - 1)/T
obdelPrenos = tf(7.2, [25 -48.2 24.64], T);

% Tustin
Fs_lichobeznik = c2d(Fs_pracovni,T,'tustin');

% Metoda exaktních nul pólù
Fs_exact = c2d(Fs_pracovni,T,'matched');

% Vykresleni
% Impulzni charakteristika
figure
impulse(Fs, Fs_nulty_rad,obdelPrenos,Fs_lichobeznik,Fs_exact)
legend('puvodni prenos', 'tvarovac nulteho radu', 'dopredna obdelnikova aproximace', 'lichobeznikova aproximace', 'exaktni prevod nul a polu')
title('Porovnani impulsnich charakteristik')

% Prechodova charakteristika
figure
step(Fs, Fs_nulty_rad,obdelPrenos,Fs_lichobeznik,Fs_exact)
legend('puvodni prenos', 'tvarovac nulteho radu', 'dopredna obdelnikova aproximace', 'lichobeznikova aproximace', 'exaktni prevod nul a polu')
title('Porovnani prechodovych charakteristik')

% GMK
figure
rlocus(Fs, Fs_nulty_rad,obdelPrenos,Fs_lichobeznik,Fs_exact)
legend('puvodni prenos', 'tvarovac nulteho radu', 'dopredna obdelnikova aproximace', 'lichobeznikova aproximace', 'exaktni prevod nul a polu')
title('Porovnani GMK')


