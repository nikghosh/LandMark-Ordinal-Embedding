function varargout = projEDM(X, max_iters, projTol)
% Computes the projection of an n x n matrix X onto cone of EDM matrices
% w.r.t frobenius norm

if nargin < 2, max_iters = 1000; end
if nargin < 3, projTol = 1e-10; end

[n, ~] = size(X);
P = zeros(n); 
Y = X;

iter = 0;
converged = false;
conv = Inf;

while (iter < max_iters && ~converged)
    X = projSymHollow(Y);
    Y = projK2(X - P);
    P = Y - (X - P);
    conv = norm(Y - X, 'inf') / norm(Y, 'inf');
    converged = (conv <= projTol);
    iter = iter + 1;
end

if ~converged
    fprintf('projEDM did not converge in %d iterations\n', iter)
end

% Set output
varargout{1} = projSymHollow(Y);