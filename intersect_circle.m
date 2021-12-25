function [p1, p2, n] = intersect_circle(center, r, k, b)
EPS = 1e-7;
a0 = k^2 + 1;
a1 = k*(b - center(2)) - center(1);
a2 = (b - center(2))^2 + center(1)^2 - r^2;
D = a1^2 - a0*a2;

if D < - EPS
    n = 0;
    p1 = [0, 0];
    p2 = [0, 0];
elseif abs(D) < EPS
    x = (sqrt(D) - a1) / a0;
    y = k*x + b;
    p1 = [x, y];
    p2 = [0, 0];
    n = 1;
else
    x1 = (sqrt(D) - a1) / a0;
    x2 = (-sqrt(D) - a1) / a0;
    y1 = k*x1 + b;
    y2 = k*x2 + b;
    p1 = [x1, y1];
    p2 = [x2, y2];
    n = 2;
end
end