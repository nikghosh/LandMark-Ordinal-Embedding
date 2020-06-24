function varargout = randEDM( n, d, distr, center )
% Generates random EDM matrix with xi ~ Unif(0, 1) or xi ~ N(0, (1/2d)I_d)
% Default is normal
addpath('../utils/')

% distribution
if nargin < 3
    distr = 'normal';
end

% centering
if nargin < 4
    center = false;
end

if strcmp(distr, 'uniform')
    X = rand(n, d);
elseif strcmp(distr, 'normal')
    X = randn(n, d) / (sqrt(2 * d));
else
    disp('Invalid distribution randEDM')
end

% Center the points
if center
    X = X-repmat(mean(X,1),size(X,1),1);
end

% Points
if nargout > 0
    varargout{1} = X;
end

% Gram matrix
if nargout > 1
    G = X * X';
    varargout{2} = G;
end

% EDM matrix
if nargout > 2
    D = gram_to_distance(G);
    varargout{3} = D;
end

end


