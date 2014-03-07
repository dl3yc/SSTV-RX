% output frequency = B * REFIN / R / A
ref = 10e6;
f = 145.2e6;
tol = 1e3;

for R = 1:16383
    for B = 3:8191
        for A = 2:31
            out = B * ref / R / A ;
            if abs(out - f) < tol
                sprintf('out = %d\t R = %d\t B = %d\t A = %d\n',out, R, B, A)
            end
        end
    end
end