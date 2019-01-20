clear all
load('data_raw.mat')
rint = zeros(600, 1); r = zeros(600, 1); bint = zeros(9, 1); b = zeros(9, 1);
i = 1;
s = 0;
max = 0;
del = [0;0;0];
x = EI .* PGDP;
data = [data reshape(x, [600, 1])];
com = [target data ones(600, 1)];
flag = 0;