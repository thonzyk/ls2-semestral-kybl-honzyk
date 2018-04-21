%% INICIALIZACE PROMÌNNÝCH

K = 5; % Zesílení
epsilon = 0.15; % TODO: doplnit
omega = 1.2; % TODO: doplnit
T = 0.2; % Perioda vzorkování
Fs = tf([K*omega*omega], [1 2*epsilon*omega omega*omega]) % Základní pøenosová funkce

%step(Fs)
hold on

%% PØEVOD NA DISKRÉTNÍ PØENOS

discrete_Fs = c2d(Fs,T,'zoh');

%step(discrete_Fs)
hold off

%% URÈENÍ PARAMETRÙ GRAY-BOX MODELU % 1) a)

% TODO: Zde je nepochybnì nìkde chyba
y = simout.Data(:, 1);
u = simout.Data(:, 2);
chyboveY = simout.Data(:,3);
regresory = [-y(2:end-1),-y(1:end-2),u(2:end-1),u(1:end-2)];
ChyboveRegresory = [-chyboveY(2:end-1),-chyboveY(1:end-2),u(2:end-1),u(1:end-2)];
parametry=pinv(regresory)*y(3:end)
parametrySum = pinv(ChyboveRegresory)*y(3:end);

% nasypání parametrù do pøenosu
prenosova_fce_z_parametru = tf([parametry(3) parametry(4)],[1 parametry(1) parametry(2)], T);

%step(prenosova_fce_z_parametru)
%% 1) b) - Porovnání pøechodových charakteristik

% hodit zpìt na spojitý pøenos a porovnat
% TODO: Ovìøit, zda-li je to takto správnì
zpetna_prenosova_fce_z_parametru = d2c(prenosova_fce_z_parametru, 'zoh')

% plotnutí toho
%figure
%step(zpetna_prenosova_fce_z_parametru)
%hold on
%step(Fs)
%title('Porovnani zpetne prevedeneho prenosu')

%% 1) c) - Diskretizované modely

% Nutno Nahradit pøenosem z pøedchozích cvièení!!!
Fs_pracovni = zpetna_prenosova_fce_z_parametru;

% Tvarovaè 0. rádu
Fs_nulty_rad = c2d(Fs_pracovni,T,'zoh');

% Dopøedná obdélníková aproximace
% TODO: po zjištìní správné zpetna_prenosova_fce_z_parametru zmenit
% parametry
obdelPrenos = tf([7.2 -7.2],[1 0.36 1.44]);
% Tustin
Fs_lichobeznik = c2d(Fs_pracovni,T,'tustin');

% Metoda exaktních nul pólù
% TODO: po zjištìní správné zpetna_prenosova_fce_z_parametru zmenit
% parametry
p12 = roots([1 0.36 1.44]);
p1 = p12(1);
p2 = p12(2);
z1 = exp(p1*T);
z2 = exp(p2*T);
Fs_exact = zpk([], [z1 z2], 1, T);

% 3.616 = korekce zesílení
% TODO: opravit korekci zesílení
Fs_exact = Fs_exact /3.616;

% Vykresleni
%figure
bode(Fs, Fs_nulty_rad,obdelPrenos,Fs_lichobeznik,Fs_exact)
figure
step(Fs, Fs_nulty_rad,obdelPrenos,Fs_lichobeznik,Fs_exact)



