function X = itseq(f, Xinit, n, r)
% computing an iterative sequence of values
X = zeros(n + 1, 1);
X(1) = Xinit;
for i = 1:n
X(i + 1) = f(X(i), r);
end
