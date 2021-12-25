function [corr_col, corr_row] = col_row_corr_matr(matrix)
% COL_ROW_CORR_MATR считает матрицы коррелляции столбцов и строк для матрицы А
%   [~, row] = col_row_corr_matr(A) Получение матрицы корреляции строк
%       
%   [col, ~] = col_row_corr_matr(A) Получение матрицы корреляции столбцов
%
%   [col, row] = col_row_corr_matr(A) Получение обеих матриц 

    m = size(matrix, 1); 
    n = size(matrix, 2); 
    corr_col = zeros(n, n);
    corr_row = zeros(m, m);
    for i = 1 : m
        for j = 1 : m
            r = corrcoef(matrix(i, :), matrix(j, :));
            corr_row(i, j) = r(2, 1);
        end
    end
    for i = 1 : n
        for j = 1 : n
            r = corrcoef(matrix(:, i), matrix(:, j)); 
            corr_col(i, j) = r(2, 1);
        end
    end
end

