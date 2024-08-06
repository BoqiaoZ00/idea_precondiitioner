function M = compute_M_by_formula(A, B, C, Q1, Q2)
    [m, n] = size(B);
    [p, ~] = size(C);

    M11 = A+B'/Q1*B;
    M12 = B';
    M13 = B'/Q1*C';
    M21 = B;
    M22 = Q1 + C'/Q2*C;
    M23 = zeros(m,p);
    M31 = C/Q1*B;
    M32 = zeros(p,m);
    M33 = Q2;

    % Get M
   M = [M11, M12, M13; M21, M22, M23; M31, M32, M33];
end