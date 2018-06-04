y = simout.Data(:, 1);
u = simout.Data(:, 2);
regresory = [-y(2:end-1),-y(1:end-2),u(2:end-1),u(1:end-2)]
parametry=pinv(regresory)*y(3:end)