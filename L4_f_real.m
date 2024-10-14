function out = L4_f_real(z)
M = length(z);
out_a = 0;
out_b = 0;
for a = 0 : M-1
    for b = 0 : M-1
        abs_a_b = abs(a - b);
        c = abs_a_b : M-1;
        out_c = sum( z(c+1) .* z(c+1-abs_a_b) );
        out_b = out_b + ( conj(z(b+1)) .* out_c );
    end
    out_a = out_a + ( z(a+1) .* out_b);
    out_b = 0;
end
out = out_a;
end