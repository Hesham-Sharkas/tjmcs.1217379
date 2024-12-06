% Written by Hesham Sharkas, on 22 October, 2024
% This code implements formula appears in RHS of equations (2.1) and (2.7)
% in the open access article DOI: http://dx.doi.org/10.47000/tjmcs.1217379

function out = L4_f(z)
M = length(z);
out_a = 0;
out_b = 0;
for a = 0 : M-1
    for b = 0 : M-1
        if a>=b
            a_b = a - b;
            c = a_b : M-1;
            out_c = sum( conj(z(c+1)) .* z(c+1-a_b) );
        else
            b_a = b - a;
            c = b_a : M-1;
            out_c = sum( conj(z(c+1-b_a)) .* z(c+1) );
        end
        out_b = out_b + ( conj(z(b+1)) .* out_c );
    end
    out_a = out_a + ( z(a+1) .* out_b);
    out_b = 0;
end
out = out_a;
end
