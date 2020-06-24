function varargout = projSymHollow(X)
% Computes the projection of an n x n matrix X onto space of hollow 
% symmetric matrices
X = X - diag(diag(X));

% Set output
varargout{1} = projSym(X);