clear; clc; 
addpath(genpath('../embed'))
addpath('../generators')
addpath('../test_utils')

% Synthetic example for LOE
% n - number of items
% d - embedding dimension
% k - number of landmarks (>= d+3)
% m - number of comparisons

n = 10^3;
d = 2;
k = d+3; 
C = 200;
m = floor(C * n * log(n));

opts.Display = 0;
opts.useMex = 0;

params.N = n;
params.no_dims = d;
params.verbose = 0;

fprintf('Generating Ground Truth Embedding\n')
Xtrue = randEDM(n, d, 'normal');

fprintf('Generating Comparisons\n')
col_compars = generate_colcomps(n, m, k, Xtrue);

fprintf('Generating Testset Triplets\n')
testset = generate_testset(n, 10^4);

fprintf('Estimating Embedding\n\n')
X = loe(n, d, k, col_compars, opts);

fprintf('MSE: %f\n', procrustes(Xtrue, X))
fprintf('Score: %f\n', tripscore(testset, Xtrue, X))

