A
B
C = [7.2 0; 0 7.2];
D = [0; 0]
k1 = 0.982;
k2 = 1.8188;

sim('ukol_9_model');
plot(simout)
legend('step', 'puvodni', 'rekonstruktor')