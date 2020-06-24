function [ D, s ] = distance_matrix( W )
% Estimate distance matrix of first k points given unshifted version W
k = size(W, 1);
% Set-up linear equations
A = [pw_diff(k); ones(1, k)];
W_diff = W' - W;
b = [W_diff(tril(true(k), -1)); -sum(sum(W)) / (k - 1)];
% Least square solution for shift
s = A\b;
% Estimate centered matrix C
J = ones(k) - eye(k);
S = J * diag(s);
C = projSym(W + S);
% Estimate k x k distance matrix D
lambda = sort(eig(C), 'descend');
s = s + lambda(2) * ones(k, 1);
D = projEDM(W + J * diag(s));
end

function [A] = pw_diff( n )
% pair-wise difference matrix
A = zeros((n * (n-1))/2, n);
count = 1;
for i = 1:n
    for j = i+1:n
        A(count, i) = 1;
        A(count, j) = -1;
        count = count + 1;
    end
end
end

