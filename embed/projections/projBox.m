function varargout = projBox(X, l, u)
% Computes the projection of an m x n matrix X onto box [l, u]^(m x n)

X(X < l) = l;
X(X > u) = u;

% Set output
varargout{1} = X;