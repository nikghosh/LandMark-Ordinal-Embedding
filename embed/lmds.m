function [ X, Y ] = lmds( E, F, d )
% Landmark Multidimensional Scaling
% E - k x k matrix of distances between landmarks
% F - (n-k) x k matrix of distances of non-landmarks to landmarks

[nk, k] = size(F);

% Distance matrix to Gram matrix
V = eye(k) - ones(k) / k;
A = -0.5 * V * E * V;
B = -0.5 * (F - ones(nk, k) * E / k) * V;

% Embedding
[Q, lam] = eigs(A, d);
l = diag(lam);
X = Q * diag(sqrt(l));
Y = B * Q * diag(1 ./ sqrt(l));
end

