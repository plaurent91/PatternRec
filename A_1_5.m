clear all
close all
q = [.75 .25];
A = [0.99 0.01; 0.03 0.97];
mc = MarkovChain (q, A);
mu_1 = 0;
mu_2 = 0;
V_1 = 1;
V_2 = 4;
gD(1) = GaussD('Mean', mu_1, 'Variance', V_1);
gD(2) = GaussD('Mean', mu_2, 'Variance', V_2);
h = HMM (mc, gD);
X = zeros(50,500);
for i = 1:500
X(1:100, i) = rand(h,100);
end
figure()
plot(X)
axis([1 100 -6 6])
title('500 samples plotted with t = 100')
xlabel('t')
ylabel('x(t)')