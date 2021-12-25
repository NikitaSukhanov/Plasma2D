function draw_detector(dtr, rays_left_border, color)
if nargin < 3
    color = 'r';
end
if nargin < 2
    rays_left_border = 0.1;
end
plot(dtr.apr_xz(1), dtr.apr_xz(2), 'Color', color, 'Marker', 'o');
plot([dtr.center_xz(1), dtr.center_xz(1)], [dtr.top, dtr.bot], 'Color', color, 'LineWidth', 3);

if dtr.rays_number < 2
    rays_bot = dtr.center_xz(2);
else
    rays_bot = dtr.bot;
end
plot_x = rays_left_border:0.001:dtr.center_xz(1);
for i = 1:dtr.rays_number
    ray_begin = [dtr.center_xz(1), rays_bot + (i-1)*dtr.step];
    [k, b] = get_line(dtr.apr_xz, ray_begin);
    plot(plot_x, k*plot_x+b, color);
    txt_x = rays_left_border + 0.01;
    txt_z = k * txt_x + b;
    text(txt_x, txt_z, num2str(i));
end