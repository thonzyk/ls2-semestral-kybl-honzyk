A
B
C = C_1
D = 0


syms p l1 l2

pI = [p 0; 0 p]
L = [l1; l2]
L = [0.505555; 0.173555];
to_determinate = pI - A + L*C;
determinant = det(to_determinate);
koeficienty = coeffs(determinant, p);

sim('ukol_8_model')
plot(simout)