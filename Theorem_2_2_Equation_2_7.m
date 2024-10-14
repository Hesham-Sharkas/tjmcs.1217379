clc;
clear;

M = 201;
s = 2*rand(1,M,'double')-1 + 2i*rand(1,M,'double')-1i;

a = 1:M;
x_step = 0.0001*pi;       %Decrease the integration step to e.g., 0.01*pi to see the loss in accuracy
x = -pi : x_step : pi-x_step;
x_length = length(x);

F = zeros(1,x_length);
for x_index = 1:x_length
    F(x_index) = sum(s.*exp(-1i.*a.*x(x_index)));
end

LHS = sum(F.*F.*conj(F.*F)).*x_step;
RHS = 2*pi*L4_f(s);

fprintf(' Left hand side = %f\n',LHS);
fprintf('Right hand side = %f\n',RHS);