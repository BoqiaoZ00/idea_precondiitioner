function result = compare_matrices(A, B, tolerance)
    % Check if the matrices have the same size
    if ~isequal(size(A), size(B))
        error('Matrices must have the same dimensions');
    end
    
    % Calculate the relative difference
    difference = abs(A - B);
    relative_error = difference ./ abs(A);
    
    % Handle cases where the elements of A are zero to avoid division by zero
    % We assume that a zero value in A means that the corresponding value in B should also be zero,
    % and thus the difference itself should be within the tolerance
    relative_error(A == 0) = difference(A == 0);
    
    % Compare the relative error with the tolerance
    result = all(relative_error(:) <= tolerance);
end
