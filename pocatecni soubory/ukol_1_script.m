%% INICIALIZACE PROM�NN�CH

K = 5; % Zes�len�
epsilon = 0.15; % TODO: doplnit
omega = 1.2; % TODO: doplnit
T = 0.2; % Perioda vzorkov�n�
Fs = tf([K*omega*omega], [1 2*epsilon*omega omega*omega]) % Z�kladn� p�enosov� funkce

%step(Fs)
hold on

%% P�EVOD NA DISKR�TN� P�ENOS

discrete_Fs = c2d(Fs,T,'zoh');

%step(discrete_Fs)
hold off

%% UR�EN� PARAMETR� GRAY-BOX MODELU % 1) a)

% TODO: Zde je nepochybn� n�kde chyba
y = simout.Data(:, 1);
u = simout.Data(:, 2);
chyboveY = simout.Data(:,3);
regresory = [-y(2:end-1),-y(1:end-2),u(2:end-1),u(1:end-2)];
ChyboveRegresory = [-chyboveY(2:end-1),-chyboveY(1:end-2),u(2:end-1),u(1:end-2)];
parametry=pinv(regresory)*y(3:end)
parametrySum = pinv(ChyboveRegresory)*y(3:end);

% nasyp�n� parametr� do p�enosu
prenosova_fce_z_parametru = tf([parametry(3) parametry(4)],[1 parametry(1) parametry(2)], T);

%step(prenosova_fce_z_parametru)
%% 1) b) - Porovn�n� p�echodov�ch charakteristik

% hodit zp�t na spojit� p�enos a porovnat
% TODO: Ov��it, zda-li je to takto spr�vn�
zpetna_prenosova_fce_z_parametru = d2c(prenosova_fce_z_parametru, 'zoh')

% plotnut� toho
%figure
%step(zpetna_prenosova_fce_z_parametru)
%hold on
%step(Fs)
%title('Porovnani zpetne prevedeneho prenosu')

%% 1) c) - Diskretizovan� modely

% Nutno Nahradit p�enosem z p�edchoz�ch cvi�en�!!!
Fs_pracovni = zpetna_prenosova_fce_z_parametru;

% Tvarova� 0. r�du
Fs_nulty_rad = c2d(Fs_pracovni,T,'zoh');

% Dop�edn� obd�ln�kov� aproximace
% TODO: po zji�t�n� spr�vn� zpetna_prenosova_fce_z_parametru zmenit
% parametry
obdelPrenos = tf([7.2 -7.2],[1 0.36 1.44]);
% Tustin
Fs_lichobeznik = c2d(Fs_pracovni,T,'tustin');

% Metoda exaktn�ch nul p�l�
% TODO: po zji�t�n� spr�vn� zpetna_prenosova_fce_z_parametru zmenit
% parametry
p12 = roots([1 0.36 1.44]);
p1 = p12(1);
p2 = p12(2);
z1 = exp(p1*T);
z2 = exp(p2*T);
Fs_exact = zpk([], [z1 z2], 1, T);

% 3.616 = korekce zes�len�
% TODO: opravit korekci zes�len�
Fs_exact = Fs_exact /3.616;

% Vykresleni
%figure
bode(Fs, Fs_nulty_rad,obdelPrenos,Fs_lichobeznik,Fs_exact)
figure
step(Fs, Fs_nulty_rad,obdelPrenos,Fs_lichobeznik,Fs_exact)



