%Fs =( 5 * (1.2)^2)/s^2 + 2*0.15*1.2*s + (1.2)^2
Fs = tf([5*(1.2)^2],[1 2*0.15*1.2 (1.2)^2]);
oslik = tf([0 0.01], [1 0]);
shrek = Fs * oslik

[kritickeK kritickyw] = margin(shrek)
figure

K = tf([kritickeK], [1]);

fiona = (shrek * K*0.9)/(1 +shrek * K*0.9)

margin(fiona)
figure

step(fiona)