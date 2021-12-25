function new_matrix = columns_reduce(matrix, corr_threshold)
[cor_col, ~] = col_row_corr_matr(matrix);
m = size(matrix, 1); 
n = size(matrix, 2); 
already_used = false(n, 1);
tmp = zeros(m, n);

k = 1;
for i = 1:n
    if already_used(i) == false
        tmp(:, k) = matrix(:, i);
        cnt = 1;
        for j = i+1:n
            if cor_col(i, j) > corr_threshold
                tmp(:, k) = tmp(:, k) + matrix(:, j);
                cnt = cnt + 1;
                already_used(j) = true;
            end
        end
        tmp(:, k) = tmp(:, k) / cnt;
        already_used(i) = true;
        k = k + 1;
    end
end

new_matrix = tmp(:, 1:k-1);
end