%% �kol 8)

% Matice ur�eny v p�edchoz�ch cvi�en�ch
A;
B;
C = C_1;
D = 0;


syms p l1 l2

pI = [p 0; 0 p];
L = [0.505555; 0.173555]; % vypo�teno na pap��e
to_determinate = pI - A + L*C;
determinant = det(to_determinate);
koeficienty = coeffs(determinant, p);

%% Vykreslen�

sim('ukol_8_model')
plot(simout)