function draw_elements(sgs, color)
if nargin < 2
    color = 'b';
end
for j = 1:sgs.segments_number
    radius = j * sgs.step;
    txt_x = sgs.center_xz(1);
    txt_z = sgs.center_xz(2) + radius - sgs.step/2;
    text(txt_x, txt_z, num2str(j));
    draw_circle(sgs.center_xz, radius, color);
end
end