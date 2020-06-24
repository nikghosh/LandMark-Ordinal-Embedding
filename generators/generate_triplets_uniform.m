function [ S] = generate_triplets_uniform( n, m, X)
addpath('../utils')
% Generates m noisy triplets uniformly at random
% [i, j, k] is noisy indication of D(i, j) < D(i, k)

S = sample_without_replacement(n, m, 3);
i = S(:, 1); j = S(:, 2); k = S(:, 3);

% p is large if D(i, k) >> D(i, j)
p = sigmoid(distances(X, i, k) - distances(X, i, j));

% flip according to BTL
y = find(binornd(1, 1-p));
S(y, [2, 3]) = S(y, [3, 2]);
end