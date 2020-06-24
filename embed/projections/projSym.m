function varargout = projSym(X)
% Computes the projection of an n x n matrix X onto its symmetric part

% Set output
varargout{1} = (X + X') / 2;