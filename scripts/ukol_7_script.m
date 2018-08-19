%% �kol 7)
format longE

Fs_servo_discrete = c2d(Fs_servo, 0.1, 'zoh'); % diskr�tni p�enos servosyst�mu

Ks = 1.188e-05; % hodnota ur�en� vytknut�m z p�enosu

syms z c1 c0 Kr

% p�eveden� ru�n� sestaven� soustavy rovnic do maticov�ho tvaru
Matice_A = [0 1 Ks; 1 -1 3.963*Ks; -1 0 Ks*0.9825];
Vektor_b = [1 0 0]';
Vektor_x = Matice_A\Vektor_b;

Matice_A = [0 1 Ks;
            1 -1 3.963*Ks; 
           -1 0 Ks*0.9825];
       
Matice_A = [0 1 Ks;
            1 -1 3.96296*Ks; 
           -1 0 Ks*0.9823];      
       
Vektor_b = [1 0 0]';
Vektor_x = Matice_A\Vektor_b;

% v�sledn� parametry
c0 = Vektor_x(1);
c1 = Vektor_x(2);
Kr = Vektor_x(3);

Fr_7 = tf([1 -1.951 0.9646], [1 c1 c0], 0.1) * Kr; % p�enos regul�toru

Fs_celkem_7 = feedback(Fr_7*Fs_servo_discrete, 1); % v�sledn� p�enos
sim('ukol_7_model')

%% Vykreslen�
figure
step(Fs_celkem_7)
figure
plot(simout)
title('Prubeh rizeni')


