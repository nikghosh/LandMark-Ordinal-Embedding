function [ R ] = rank_columns( n, k, col_compars, opts )
% Compute unshifted MLE estimates for first k columns of distance matrix 

R = zeros(n, k);
for i = 1:k
    R([1:i-1 i+1:n], i) = btl(n-1, col_compars{i}, opts);
end

end