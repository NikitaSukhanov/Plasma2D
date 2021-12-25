function draw_matrix(matrix, ttl)
if nargin < 2
    ttl= 'Matrix';
end
figure
axis equal
imagesc(matrix);
title(ttl);
colormap('Bone');
cm = colormap;
colormap(flipud(cm));
colorbar;
end