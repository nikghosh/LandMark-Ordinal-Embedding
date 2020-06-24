function varargout = logObjective(w, X, y)
addpath('../utils')
% Computes the negative log-likelihood function and its gradient
yz = y .* (X * w);

if nargout > 0
   F = -sum(log_logistic(yz));
   varargout{1} = F;
end

if nargout > 1
   z = sigmoid(yz);
   G = X' * ((z - 1) .* y);
   varargout{2} = G;
end
