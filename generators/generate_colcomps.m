function [ col_compars ] = generate_colcomps( n, m, k, X )
% m comparisons for each of k columns

% extract score vectors from X
cols = distance_columns(X, 1:k);
col_compars = cell(1, k);

% each column has about floor(m / k) corresponding compars
num_samples = ones(1, k) * floor(m / k);
remaining = m - k * floor(m/k);
distribute = zeros(1, k);
distribute(1:remaining) = 1;
num_samples = num_samples + distribute;

for i = 1:k
    w = cols([1:i-1 i+1:n], i);
    col_compars{i} = generate_comparisons(n-1, num_samples(i), w);
end
end

