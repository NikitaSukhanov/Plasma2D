sgs = create_circular_segments();
sgs.center_xz = [0.38, 0.0];
sgs.external_radius = 0.58 - sgs.center_xz(1);
sgs.segments_number = 2;
sgs.step = sgs.external_radius / sgs.segments_number;

dtr = create_detector();
dtr.apr_xz = [0.6776, 0.05];
dtr.center_xz = [dtr.apr_xz(1) + 0.0395, dtr.apr_xz(2)];
dtr.top = dtr.center_xz(2) + (16-1)/2 * 0.0017;
dtr.bot = dtr.center_xz(2) - (16-1)/2 * 0.0017;
dtr.rays_number = 2;
if(dtr.rays_number > 1)
    dtr.step = (dtr.top - dtr.bot) / (dtr.rays_number - 1);
end

draw_geometry = true;
A = build_matrix(dtr, sgs, draw_geometry)
% draw_matrix(A, 'Hord matrix');


[cor_col, cor_row] = col_row_corr_matr(A);
% draw_matrix(cor_col, 'Columns correlation');
% draw_matrix(cor_row, 'Rows correlation');


[col_weights, row_weights] = marginal_distributions(A);
% figure
% bar(col_weights);
% grid on
% title('Columns weights');
% 
% figure
% bar(row_weights);
% grid on
% title('Rows weights');


sing_values = svd(A);
% figure
% hist(sing_values, 16);
% grid on
% title('Singular values histogram');


col_reduced = columns_reduce(A, 0.7);
%draw_matrix(col_reduced, 'Reduced columns');
sing_values_rc = svd(col_reduced);
% figure
% hist(sing_values_rc, 16);
% grid on
% title('Singular values histogram');


row_reduced = rows_reduce(A, 0.7);
%draw_matrix(row_reduced, 'Reduced rows');
sing_values_rr = svd(row_reduced);
% figure
% hist(sing_values_rr, 16);
% grid on
% title('Singular values histogram');

cond1 = cond(A)
cond2 = max(sing_values) / min(sing_values)




    
