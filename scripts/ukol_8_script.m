%% Úkol 8)

% Matice urèeny v pøedchozích cvièeních
A;
B;
C = C_1;
D = 0;


syms p l1 l2

pI = [p 0; 0 p];
L = [0.505555; 0.173555]; % vypoèteno na papíøe
to_determinate = pI - A + L*C;
determinant = det(to_determinate);
koeficienty = coeffs(determinant, p);

%% Vykreslení

figure
sim('ukol_8_model')
plot(simout)
title('Step response')
legend('x1 - skuteènı stav', 'x2 - skuteènı stav', 'x1 - rekonstruovanı stav', 'x2 - rekonstruovanı stav')