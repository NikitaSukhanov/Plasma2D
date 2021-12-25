function A = build_matrix(dtr, sgs, need_plot)

if dtr.rays_number < 2
    rays_bot = dtr.center_xz(2);
else
    rays_bot = dtr.bot;
end

if need_plot == true
    figure
    grid on
    hold on
    axis equal
    draw_detector(dtr, 0.1, 'r');
    draw_elements(sgs, 'b');
end

A = zeros(dtr.rays_number, sgs.segments_number);
for i = 1:dtr.rays_number
    lgh = 0;
    ray_begin = [dtr.center_xz(1), rays_bot + (i-1)*dtr.step];
    [k, b] = get_line(dtr.apr_xz, ray_begin);
    for j = 1:sgs.segments_number
        radius = j * sgs.step;
        [p1, p2, n] = intersect_circle(sgs.center_xz, radius, k, b);
        if n > 0 && need_plot == true
            plot(p1(1), p1(2), 'Marker', '*', 'Color', 'r');
        end
        if n > 1
            if need_plot == true
                 plot(p2(1), p2(2), 'Marker', '*', 'Color', 'r');
            end
        d = norm(p2 - p1);
        A(i, j) = d - lgh;
        lgh = d;
        end
    end
end
end