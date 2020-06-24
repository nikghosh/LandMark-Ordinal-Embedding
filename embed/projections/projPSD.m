function varargout = projPSD(X)
% Computes the projection of an n x n matrix X onto PSD cone

X = projSym(X);
[Q, D] = eig(X);

% Set output
varargout{1} = Q * diag(max(diag(D), 0)) * Q';
