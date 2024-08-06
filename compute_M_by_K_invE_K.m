function M = compute_M_by_K_invE_K(K, A, B, C, Q1, Q2)

    [m, n] = size(B);
    [p, ~] = size(C);

    % construct E = [A, 0, 0; 0, Q1, 0; 0, 0, Q2]
    Z12 = zeros(n, m);
    Z13 = zeros(n, p);
    Z21 = zeros(m, n);
    Z23 = zeros(m, p);
    Z31 = zeros(p, n);
    Z32 = zeros(p, m);
    E = [A, Z12, Z13; Z21, Q1, Z23; Z31, Z32, Q2];

    % Compute M
   M = K*inv(E)*K;
end