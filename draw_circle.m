function draw_circle(center, r, color)
if nargin < 3
    color = 'b';
end
t = 0:pi/180:2*pi;
plot(center(1) + r*cos(t), center(2) + r*sin(t), 'Color', color)
end