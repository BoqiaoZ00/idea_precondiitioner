function [K, Q1, Q2, A, B, C] = construct_K(n0, m0, p0)
    % Set the sizes of the submatrices
    n = n0; % Size of A
    m = m0; % Size of D
    p = p0; % Size of E

        % Generate invertible matrix A
        A = generate_random_matrix_between_1_and_100(n, n);
        A = (A + A') / 2;
       while det(A) == 0
            A = generate_random_matrix_between_1_and_100(n, n);
            A = (A + A') / 2;
        end
    
        % Generate random matrices B, C
        B = randn(m, n);
        C = randn(p, m);
        
        % Ensure Q1 = BA^(-1)B^T is invertible
        Q1 = B / A * B'; 
    
        % Ensure Q2 = CS1^(-1)C^T is invertible
        Q2 = C / Q1 * C';

    % Construct the zero matrices
    Z1 = zeros(n,p);
    Z2 = zeros(p, n);
    Zd = zeros(m,m);
    Ze = zeros(p, p);

    % Construct the block matrix K
    K = [A, B', Z1;
         B, Zd, C';
         Z2, C, Ze];
end