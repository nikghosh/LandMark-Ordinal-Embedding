function [ S ] = sample_without_replacement( n, m, k )
% Custom sampling without replacement
% Return m k-tuples sampled from 1..n without replacement
S = zeros(m, k);

if k == 2
    S(:, 1) = datasample(1:n, m)';
    S(:, 2) = datasample(1:n-1, m)';
    S(:, 2) = S(:, 2) + (S(:, 2) >= S(:, 1));
elseif k == 3
    S(:, 1) = datasample(1:n, m)';
    S(:, 2) = datasample(1:n-1, m)';
    S(:, 2) = S(:, 2) + (S(:, 2) >= S(:, 1));
    
    S_sort = sort(S(:, 1:2), 2);
    S(:, 3) = datasample(1:n-2, m)';
    S(:, 3) = S(:, 3) + (S(:, 3) >= S_sort(:, 1));
    S(:, 3) = S(:, 3) + (S(:, 3) >= S_sort(:, 2));
else
    for i = 1:m
        S(i, :) = randperm(n, k);
    end
end


end

