function varargout = projRank( X, r, isPSD )
% projects matrix X onto set of rank r matrices

if nargin < 3
    isPSD = false;
end

if isPSD
    [Q, D] = eigs(X, r);
    
    ind = find(diag(D) > 0);
    if isempty(ind)
        warning('Rank projection failed. All eigenvalues were negative.')
    end
    
    Y = Q * D * Q';
        
    if any(isinf(Y(:)))
        warning('Rank projection failed. Metric contains Inf values.')
    end
    
    if any(isnan(Y(:)))
        warning('Rank projection failed. Metric contains NaN values.')
    end
    
    varargout{1} = Y;
    
else
    [U, S, V] = svd(X);
    varargout{1} = U(:, 1:r) * S(1:r, 1:r) * V(:, 1:r)';
end

end

