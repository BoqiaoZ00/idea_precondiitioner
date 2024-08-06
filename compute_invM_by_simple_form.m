function invM = compute_invM_by_simple_form(A, B, C, Q1, Q2)
    M = compute_M_by_formula(A, B, C, Q1, Q2);
    invM = inv(M);
end