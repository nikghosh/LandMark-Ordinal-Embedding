function [ w ] = logistic_regression( n, X, y, opts)
% logistic regression
func = @(w) logObjective(w, X, y);
w_init = zeros(n, 1);
w = minFunc(func, w_init, opts);
end

