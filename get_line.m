function [k, p2] = get_line(p1, p2)
k = (p2(2) - p1(2)) / (p2(1) - p1(1));
p2 = -(p2(2) - p1(2)) / (p2(1) - p1(1)) * p1(1) + p1(2);
end
