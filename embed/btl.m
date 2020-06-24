function [ w ] = btl( n, compars, opts)
% Ranking using MLE for BTL model
m = length(compars);
indX = [1:m, 1:m];
indY = [compars(:, 1); compars(:, 2)];
vals = [-ones(m, 1), ones(m, 1)];
X = sparse(indX, indY, vals);

if size(compars, 2) < 3
    y = ones(m, 1);
else
    y = compars(:, 3);
end

w = logistic_regression(n, X, y, opts);
end
