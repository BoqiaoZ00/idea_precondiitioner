    % Number of iterations
    num_iterations = 3;
    well_cond_iterations = 0;

    % Tolerance for comparison
    tolerance = 1e-5;

    all_correct = true;

     % test multiple times
    for i = 1:num_iterations
        % Random dimensions for n, m, p
        % n = randi([2,3]); % Random n between 2 and 5
        % m = randi([2, 3]); % Random m between 2 and 5
        % p = randi([2, 3]); % Random p between 2 and 5
        n = 3; m = 2; p = 1;


        [K, Q1, Q2, A, B, C] = construct_K(n, m, p);
        if (rcond(A) < 1e-15) || (rcond(Q1) < 1e-15) || (rcond(Q2) < 1e-15)
            continue;
        end
        well_cond_iterations = well_cond_iterations + 1;
        M1 = compute_M_by_K_invE_K(K, A, B, C, Q1, Q2);
        M2 = compute_M_by_formula(A, B, C, Q1, Q2);
        
        is_correct = compare_matrices(M1, M2, tolerance);

        if ~is_correct
            all_correct = false;
            fprintf('Iteration %d: The matrices are NOT equal within the given tolerance with n = %d, m=  %d, p = %d.\n', i, n, m, p);
            M1
            M2
            rcond(A)
            rcond(Q1)
            rcond(Q2)
        end
    end

    if all_correct
        fprintf('all correct\n');
        fprintf('well_cond_iter = %d\n', well_cond_iterations);
    else
        fprintf('some are incorrect\n');
        fprintf('well_cond_iter = %d\n', well_cond_iterations);
    end