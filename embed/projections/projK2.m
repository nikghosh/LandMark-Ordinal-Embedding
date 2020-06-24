function varargout = projK2(X)
% Computes the projection of an n x n matrix X onto cone K2

[n, ~] = size(X);
V = eye(n) - ones(n) / n;

% Set output
varargout{1} = X - projPSD(V * X * V);