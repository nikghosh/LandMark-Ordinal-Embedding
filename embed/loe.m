function [ Z ] = loe( n, d, k, col_compars, opts)
% embeds using LOE method
% Input:
% n - number of points
% d - embedding dimension
% k - number of landmark points
% col_compars{i} = comparisons for ith column, i = 1,...,k
% opts - optimization options
% grad_iters - number of gradient steps for triangulation
% Output:
% Z - computed embedding
% output - (struct): time elapsed for ranking, adjusting, and total

if nargin < 5
    opts.Display = 0; 
end

R = rank_columns(n, k, col_compars, opts);
W = R(1:k, 1:k);
[E, s] = distance_matrix(W);
F = R(k+1:n, 1:k) + repmat(s', [n-k, 1]);
[X, Y] = lmds(E, F, d);
Z = [X; Y];
end

