run init.m
while flag == 0
run check.m
end
for i = 2:203
for j = 1:i - 1
if del(1, j) < del(1, i)
del(3, i) = del(3, i) + 1;
end
end
end
del(3, :) = del(3, :) - 1;
del(4, :) = del(1, :) + del(3, :);
del(5, :) = floor(del(4, :) / 24);
del(5, :) = del(5, :) + 1;
del(6, :) = del(4, :) - del(5, :) * 24 + 24;
del(5, :) = del(5, :) + 1989;