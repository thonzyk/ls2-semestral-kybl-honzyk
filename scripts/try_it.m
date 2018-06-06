%jejich_Fs = tf(1, [1 0.3 0.15^2])

%tau = 0.544;
%Kp = 0.6888;
%Ki = 3.1867;
%Kd = 0.9418;


%jejich_PID = tf([Kd+Kp*tau Kp+Ki*tau Ki], [tau 1 0]);

%cely = jejich_PID * jejich_Fs;
%step(feedback(cely, 1))


Q = tf(1, [alpha_2, alpha_1, 1]);
Fs_3 = tf(1, [1 0.3 1]);
Fr = Q/(Fs*(1-Q))

uzav = feedback(Fs*Fr, 1);
step(uzav)