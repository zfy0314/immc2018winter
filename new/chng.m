clear all
load('temp.mat');
p = [317.884673	333.1421454	366.4606923	377.3898395	473.4922787	609.6566792	709.4137551	781.7441643	828.5804793	873.2870617	959.3724836	1053.108243	1148.50829	1288.643252	1508.668098	1753.417829	2099.229435	2695.365917	3471.248054	3838.433972	4560.512586	5633.795717	6337.883323	7077.770765];
p = [p g];
q = [0.022525468	0.04799688	0.100013005	0.029823518	0.254650309	0.287574701	0.163628283	0.101958002	0.059912587	0.053955631	0.098576317	0.097705282	0.090589024	0.122014758	0.170741472	0.16222901	0.197221449	0.283978717	0.287857813	0.105779222	0.188118024	0.235342653	0.124975708	0.116740464];
a = q;
for i = 2:25
chn(5, i) = ((1 + rlt(i - 1, 1)) * g - mi) / (ma - mi);
rlt(i, 1) = tb' * chn(:, i);
g = g * (1 + rlt(i, 1));
p = [p g];
end
plot(1990:2038, p);
xlabel('Years')
ylabel('GDP')
figure(2)
plot(1990:2038, [q rlt']);
xlabel('Years')
ylabel('GDP Growth')
