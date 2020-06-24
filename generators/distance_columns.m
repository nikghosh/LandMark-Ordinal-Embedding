function [ cols ] = distance_columns( X, ind )
% return n x k matrix cols such that 
% cols(i, j) = ||X(ind(i), :) - X(j, :)||^2

n = size(X, 1);
k = length(ind);
D = sum((repmat(X, [k, 1]) - repelem(X(ind, :), n, 1)) .^2, 2);
cols = reshape(D, [n, k]);
end

