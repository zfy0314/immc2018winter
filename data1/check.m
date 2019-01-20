[tb, tbint, tr, trint] = regress(com(:, 1), com(:, 2:10));
b = [b tb];
bint = [bint tbint];
r = [r [tr;zeros(s, 1)]];
rint = [rint [trint;zeros(s, 2)]];
max = 0;
nmax = 0;
for j = 1:600 - s
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
    com = [com(1:max - 1, :);com(max + 1:600-s, :)];
    s = s + 1;
else
    flag = 1;
end
%figure(i)
%rcoplot(tr, trint);
i = i + 1;

                  