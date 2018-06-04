%Fs =( 5 * (1.2)^2)/s^2 + 2*0.15*1.2*s + (1.2)^2
Fs = tf([5*(1.2)^2],[1 2*0.15*1.2 (1.2)^2]);
clen = tf([0 0.01], [1 0]);
clen_plus_Fs = Fs * clen

[v_zesileni ve_fazi] = margin(clen_plus_Fs);
figure
title('Bezpeènost v zesílení a ve fázi')
K = tf([v_zesileni], [1]);

Fuzav_90p = (clen_plus_Fs * K*0.9)/(1 + clen_plus_Fs * K*0.9)

margin(clen_plus_Fs * K*0.9);
figure
title('Bezpeènost v zesílení a ve fázi pro Kkrit 90%')
step(Fuzav_90p)


Wmin = 1 % z bodeho charakteristiky v okoli bodu pro bezp. v zesileni
Wmax = 1.4
Td = 1/Wmin
alfa = Wmax * Td
Ti = 1/Wmax
alpha1 = 1/Ti*Wmin
Fd = tf([1*Td 1],[1*Td/alfa 1])
Fi = tf([1*Ti 1],[1*Ti*alfa 1])
figure
step((clen_plus_Fs * K*0.9 * Fd)/ (1 + clen_plus_Fs * K*0.9 * Fd))
figure
step((clen_plus_Fs * K*0.9 * Fi)/ (1 + clen_plus_Fs * K*0.9 * Fi))

Fuzav_Fd = (clen_plus_Fs * K*0.9 * Fd)
Fuzav_Fi = (clen_plus_Fs * K*0.9 * Fi)
margin(Fuzav_Fi)