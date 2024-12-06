% Written by Hesham Sharkas, on 22 October, 2024
% This code implements Theorem 2.1, equation (2.2), introduced in the open
% access article DOI: http://dx.doi.org/10.47000/tjmcs.1217379

clc;
clear;

M = 201;
z = 2*rand(1,M,'double')-1;

a = 1:M;
x_step = 0.0001*pi;       %Decrease the integration step to e.g., 0.01*pi to see the loss in accuracy
x = -pi : x_step : pi-x_step;
x_length = length(x);

f = zeros(1,x_length);
for x_index = 1:x_length
    f(x_index) = sum(z.*exp(1i.*a.*x(x_index)));
end

LHS = sum(f.*f.*conj(f.*f)).*x_step;
RHS = 2*pi*L4_f_real(z);

fprintf(' Left hand side = %f\n',LHS);
fprintf('Right hand side = %f\n',RHS);
