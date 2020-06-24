function [ triplets ] = generate_testset( n, test_size)
% generates test_size triplets [i, j, k] such that 1 <= i <= n
triplets = sample_without_replacement(n, test_size, 3);
end



