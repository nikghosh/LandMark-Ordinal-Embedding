function [ compars ] = generate_comparisons( n, m, w )
% Generate noisy pair-wise comparisons according to score vector w
% n items
% m pairwise comparisons
% w score vector
% output: m triplets [i, j, y] such that 1 <= i, j <= n and y in {-1, +1}
% Pr(y = 1) = sigmoid(w(j) - w(i))
 
S = sample_without_replacement(n, m, 2);
p = sigmoid(w(S(:, 2)) - w(S(:, 1)));
y = 2 * binornd(1, p) - 1;
compars = [S y];
end


