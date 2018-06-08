%% �kol 4)

Fs_4_ideal = tf(2.44, [1 2.4 2.44]); % p�enos ze zad�n�

%% Pro kompenza�n� polynom (p + 0.2)
t0 = 0.2; % z kompenzacniho polynomu
% v�po�ty parametr� provedeny na pap�r
c0 = 2.24;
d0 = -0.3802222222;
d1 = 0.09355555;
a0 = 1.44;
a1 = 0.36;
b0 = 7.2;
alpha = 2.44/7.2;

% polynomy pot�ebn� pro dal�� v�po�et
kompenzacni_polynom = tf([1 t0], 1);
d_p = tf([d1 d0], 1);
c_p = tf([1 c0], 1);
a_p = tf([1 a1 a0], 1);
b_p = b0;

Fs_4_1 = (alpha * kompenzacni_polynom * b_p)/(b_p * d_p + a_p * c_p); % v�sledn� p�enos pro kompenza�n� polynom (p + 0.2)
Fs_4_citlivostni_1 = (a_p * c_p)/(a_p * c_p + b_p * d_p); % p�enos citlivostn� funkce pro kompenza�n� polynom (p + 0.2)

%% Pro kompenza�n� polynom (p + 2)
t0 = 2; % z kompenzacniho polynomu
% v�po�ty parametr� provedeny na pap�r
c0 = 4.04;
d0 = -0.13022222;
d1 = 0.60355555;

% polynomy pot�ebn� pro dal�� v�po�et
kompenzacni_polynom = tf([1 t0], 1);
d_p = tf([d1 d0], 1);
c_p = tf([1 c0], 1);
a_p = tf([1 a1 a0], 1);
b_p = b0;

Fs_4_2 = (alpha * kompenzacni_polynom * b_p)/(b_p * d_p + a_p * c_p); % v�sledn� p�enos pro kompenza�n� polynom (p + 2)
Fs_4_citlivostni_2 = (a_p * c_p)/(a_p * c_p + b_p * d_p); % p�enos citlivostn� funkce pro kompenza�n� polynom (p + 2)


%% Vykreslen�
figure
step(Fs_4_ideal ,Fs_4_1, Fs_4_2);
legend('ocekavany prubeh', 'prubeh pro (p + 0.2)', 'prubeh pro (p + 2)')

figure
bode(Fs_4_citlivostni_1, Fs_4_citlivostni_2);
legend('citlivostni fce pro (p + 0.2)', 'citlivostn� fce pro (p + 2)')

