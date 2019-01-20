clear all
load('data_rich.mat')
rint = zeros(225, 1); r = zeros(225, 1); bint = zeros(8, 1); b = zeros(8, 1);
i = 1;
s = 0;
max = 0;
del = [0;0;0];
com = [rtarget rdata ones(225, 1)];
flag = 0;

while flag == 0
    [tb, tbint, tr, trint] = regress(com(:, 1), com(:, 2:9));
    b = [b tb];
    bint = [bint tbint];
    r = [r [tr;zeros(s, 1)]];
    rint = [rint [trint;zeros(s, 2)]];
    max = 0;
    nmax = 0;
    for j = 1:225 - s
        if trint(j, 1) * trint(j, 2) > 0
            if trint(j, 1) > 0
                if abs(trint(j, 1)) > nmax
                    nmax = abs(trint(j, 1));
                    max = j;
                end
            end
            if trint(j, 2) < 0
                if abs(trint(j, 2)) > nmax
                    nmax = abs(trint(j, 2));
                    max = j;
                end
            end
        end
    end
    if max > 0
        del = [del [max; nmax; 0]];
        com = [com(1:max - 1, :);com(max + 1:225-s, :)];
        s = s + 1;
    else
        flag = 1;
    end
    %figure(i)
    %rcoplot(tr, trint);
    i = i + 1;
end

for i = 2:s+1
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