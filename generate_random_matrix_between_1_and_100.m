function A = generate_random_matrix_between_1_and_100(n, m)
    % Generate a random matrix with values between 0 and 1
    A = rand(n, m);
    
    % Scale the matrix to have values between 1 and 100
    A = 1 + (A * 99);
end