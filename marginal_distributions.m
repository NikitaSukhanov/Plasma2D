function [col_weights, row_weights] = marginal_distributions(matrix)
m = size(matrix, 1); 
n = size(matrix, 2); 
col_weights = zeros(n, 1);
row_weights = zeros(m, 1);
for i = 1:n
    col_weights(i) = sum(matrix(:, i));
end
for j = 1:m
    row_weights(j) = sum(matrix(j, :));
end
end