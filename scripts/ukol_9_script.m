%% �kol 9)

% matice ur�eny v p�edchoz�ch cvi�en�ch
A;
B;
C = [7.2 0; 0 7.2];
D = [0; 0];

% parametry ur�eny v p�edchoz�ch cvi�en�ch
k1 = 0.982;
k2 = 1.8188;

%% Vykreslen�

sim('ukol_9_model');
plot(simout)
legend('step', 'puvodni', 'rekonstruktor')