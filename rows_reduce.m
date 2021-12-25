function new_matrix = rows_reduce(matrix, corr_threshold)
[~, cor_row] = col_row_corr_matr(matrix);
m = size(matrix, 1); 
n = size(matrix, 2); 
already_used = false(m, 1);
tmp = zeros(m, n);

k = 1;
for i = 1:m
    if already_used(i) == false
        tmp(k, :) = matrix(i, :);
        cnt = 1;
        for j = i+1:m
            if cor_row(i, j) > corr_threshold
                tmp(k, :) = tmp(k, :) + matrix(j, :);
                cnt = cnt + 1;
                already_used(j) = true;
            end
        end
        tmp(k, :) = tmp(k, :) / cnt;
        already_used(i) = true;
        k = k + 1;
    end
end

new_matrix = tmp(1:k-1, :);
end