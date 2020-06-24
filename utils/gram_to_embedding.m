function [ X ] = gram_to_embedding( K, d )
% K is n x n Gram matrix
% returns n x d matrix X of embedding points
[V, D] = eigs(K, d);
X = V * diag(sqrt(diag(D)));
end

